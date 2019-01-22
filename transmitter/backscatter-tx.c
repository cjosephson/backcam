/**
 * Backscatter transmitter using libpcap and TP-Link TL-WN722N wifi card
 *
 * Based off https://gist.github.com/jonhoo/7780260
 *
 *
 */
#include <pcap.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <time.h>
#include <zmq.h>
#include <assert.h>

/* Defined in include/linux/ieee80211.h */
struct ieee80211_hdr {
    uint16_t /*__le16*/ frame_control;
    uint16_t /*__le16*/ duration_id;
    uint8_t addr1[6];
    uint8_t addr2[6];
    uint8_t addr3[6];
    uint16_t /*__le16*/ seq_ctrl;
    //uint8_t addr4[6];
} __attribute__ ((packed));

#define WLAN_FC_TYPE_DATA	2
#define WLAN_FC_SUBTYPE_DATA	0

/* define packet sizes, sizes include LLC part */
#define SIZE0 200   /* size of bit '0' */
#define SIZE1 250   /* size of bit '1' */

/* delay */
#define delay 100

/* pcap packets, we support two sizes for now */
uint8_t* packet_buffer[2];
size_t packet_size[2];

/* transmitter MAC address */
const uint8_t mac[6] = { 0x01, 0x23, 0x45, 0x67, 0x89, 0xab };

int send_preamble(pcap_t * ppcap);
int send_parameters(pcap_t * ppcap, char msg[]);
void send_packet(pcap_t * ppcap, uint8_t type);
void init_packet(uint8_t type, uint32_t size);

/**
 * Note that we are using the broadcast address as the destination and the
 * link-local address as the source to be nice to routers and such.
 *
 */

/**
 * Radiotap is a protocol of sorts that is used to convey information about the
 * physical-layer part of wireless transmissions. When monitoring an interface
 * for packets, it will contain information such as what rate was used, what
 * channel it was sent on, etc. When injecting a packet, we can use it to tell
 * the 802.11 card how we want the frame to be transmitted.
 *
 * The format of the radiotap header is somewhat odd.
 * include/net/ieee80211_radiotap.h does an okay job of explaining it, but I'll
 * try to give a quick overview here.
 *
 * Keep in mind that all the fields here are little-endian, so you should
 * reverse the order of the bytes in your head when reading. Also, fields that
 * are set to 0 just mean that we let the card choose what values to use for
 * that option (for rate and channel for example, we'll let the card decide).
 */
static const uint8_t u8aRadiotapHeader[] = {
    0x00, 0x00, // head revision and padding
    0x18, 0x00, // head len
    0x0f, 0x80, 0x00, 0x00, // present flags
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // timestamp (leave blank for auto)
    0x10, // flags
    0x02, // datarate
    0xa8, 0x09, // channel, 0x76 0x09 for channel 3; 0xa8 0x09 for channel 13
    0x00, 0x00,
    //0x80, 0x04, // channel flags
    0x08, 0x00
};

int main(void) {

    /* PCAP vars */
    char errbuf[PCAP_ERRBUF_SIZE];
    pcap_t *ppcap;

    /**
     * First, we open the interface we want to inject on using pcap.
     */
    ppcap = pcap_open_live("wlan1mon", 800, 1, 20, errbuf);

    if (ppcap == NULL) {
        printf("Could not open interface mon0 for packet injection: %s", errbuf);
        return 2;
    }

    //  Socket to talk to RX
    void *context = zmq_ctx_new ();
    void *responder = zmq_socket (context, ZMQ_PAIR);
    assert(zmq_bind (responder, "tcp://*:5555") == 0);

    /* init packet buffer and size */
    init_packet(0, SIZE0);
    init_packet(1, SIZE1);

    /* check socket for messages and process them. If no messages, send
       a 0 packet before continuing */
    while (1){
        char buffer [10];
        int rc;
        // Use non-blocking so we can continue
        rc  = zmq_recv (responder, buffer, 10, ZMQ_NOBLOCK);
        if (rc < 0) {
            if (errno != EAGAIN && errno != EINTR) { perror("recv"); }
        } else {
            printf ("\nReceived: '%s'\n", buffer);
            send_parameters(ppcap, buffer);
            usleep(delay);
        }

        //if no messages, default to '0' excitation packet
        send_packet(ppcap, 0);
    }
}


int send_preamble(pcap_t * ppcap) {
    uint32_t i;
    //8-bit Preamble 11 01 11 01	  
    int preamble [8] = {1,1, 0,1, 1,1, 0,1};
    for (i = 0; i < sizeof(preamble)/sizeof(preamble[0]); ++i) {
        send_packet(ppcap, preamble[i] ? 1:0); 
    }
    return 1;
}

int send_parameters(pcap_t * ppcap, char msg[]) { 
    send_preamble(ppcap); //11 01 11 01
    usleep(delay);
    //send bits from bit blot MSB to LSB
    int i = 0;
    while (msg[i] != '\0') {
        if (msg[i] == '0') {
            send_packet(ppcap, 0); 
        } 
        else if (msg[i] == '1') { 
            send_packet(ppcap, 1);
        } 
        else printf("Error, unexpected data type!");
        i++;
    }
    return 1;
}

void send_packet(pcap_t * ppcap, uint8_t type) {
    //send a backscatter packet
    if (pcap_sendpacket(ppcap, packet_buffer[type], packet_size[type]) == 1) {
        /* cache pcap error */
        pcap_perror(ppcap, "Failed to inject packet");
        pcap_close(ppcap);
        exit(0);
    }
}

void init_packet(uint8_t type, uint32_t size) {
    /* The parts of our packet */
    uint8_t *rt; /* radiotap */
    struct ieee80211_hdr *hdr;
    uint8_t *data; /* llc and payload, all zero */

    /* Other useful bits */
    uint8_t ** buf = &(packet_buffer[type]);
    size_t * sz = &(packet_size[type]);
    uint8_t fcchunk[2]; /* 802.11 header frame control */

    /* Total buffer size (note the 200 bytes of data and the 4 bytes of FCS */
    *sz = sizeof(u8aRadiotapHeader) + sizeof(struct ieee80211_hdr) + size + 4 /* FCS */;
    *buf = (uint8_t *) malloc(*sz);

    /* Put our pointers in the right place */
    rt = (uint8_t *) (*buf);
    hdr = (struct ieee80211_hdr *) (rt+sizeof(u8aRadiotapHeader));
    data = (uint8_t *) (hdr+1); /* placed next to hdr pointer */

    /* The radiotap header has been explained already */
    memcpy(rt, u8aRadiotapHeader, sizeof(u8aRadiotapHeader));

    /**
     * Next, we need to construct the 802.11 header
     *
     * The biggest trick here is the frame control field.
     * http://www.wildpackets.com/resources/compendium/wireless_lan/wlan_packets
     * gives a fairly good explanation.
     *
     * The first byte of the FC gives the type and "subtype" of the 802.11 frame.
     * We're transmitting a data frame, so we set both the type and the subtype to
     * DATA.
     *
     * Most guides also forget to mention that the bits *within each byte* in the
     * FC are reversed (!!!).
     */
    fcchunk[0] = ((WLAN_FC_TYPE_DATA << 2) | (WLAN_FC_SUBTYPE_DATA << 4));
    fcchunk[1] = 0x00;
    memcpy(&hdr->frame_control, &fcchunk[0], 2*sizeof(uint8_t));

    /**
     * The remaining fields are more straight forward.
     * The duration we can set to some arbitrary high number, and the sequence
     * number can safely be set to 0.
     * The addresses here can be set to whatever, but bear in mind that which
     * address corresponds to source/destination/BSSID will vary depending on
     * which of TODS and FROMDS are set. The full table can be found at the
     * wildpackets.com link above, or condensed here:
     *
     *  +-------+---------+-------------+-------------+-------------+-----------+
     *  | To DS | From DS | Address 1   | Address 2   | Address 3   | Address 4 |
     *  +-------+---------+-------------+-------------+-------------+-----------+
     *  |     0 |       0 | Destination | Source      | BSSID       | N/A       |
     *  |     0 |       1 | Destination | BSSID       | Source      | N/A       |
     *  |     1 |       0 | BSSID       | Source      | Destination | N/A       |
     *  |     1 |       1 | Receiver    | Transmitter | Destination | Source    |
     *  +-------+---------+-------------+-------------+-------------+-----------+
     *
     * Also note that addr4 has been commented out. This is because it should not
     * be present unless both TODS *and* FROMDS has been set (as shown above).
     */
    hdr->duration_id = 0x3a01;
    memcpy(&hdr->addr1[0], mac, 6*sizeof(uint8_t));
    memcpy(&hdr->addr2[0], mac, 6*sizeof(uint8_t));
    memcpy(&hdr->addr3[0], mac, 6*sizeof(uint8_t));
    hdr->seq_ctrl = 0;
    //hdr->addr4;

    memset(data, 0, size);	/* set data field (including llc) to all zero */
}
