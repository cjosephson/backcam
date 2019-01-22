#include <stdint.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <sys/types.h>
#include <stdbool.h>
#include "bsdecode.h"
#include <time.h>
#include <inttypes.h>
#include <math.h>

/* for debugging */
/* e.g. printf("bin: "BYTE_TO_BINARY_PATTERN, BYTE_TO_BINARY(byte)); */
#define BYTE_TO_BINARY_PATTERN "%c%c%c%c%c%c%c%c"
#define BYTE_TO_BINARY(byte)			\
    ((byte) & 0x80 ? '1' : '0'),       		\
    ((byte) & 0x40 ? '1' : '0'),		\
    ((byte) & 0x20 ? '1' : '0'),		\
    ((byte) & 0x10 ? '1' : '0'),		\
    ((byte) & 0x08 ? '1' : '0'),		\
    ((byte) & 0x04 ? '1' : '0'),		\
    ((byte) & 0x02 ? '1' : '0'),		\
    ((byte) & 0x01 ? '1' : '0')


#define PACKET_MAGIC 0b10010010
#define IMG_SIZE_LR 20008
#define IMG_SIZE_HR 79544
#define IMG_BUFFER_SIZE 79544
#define FRAME_MAGIC 0b10101010
#define FRAME_HEADER_THLD 10     /* number of empty packets before we consider it's a new frame */
      
#define CONV_CMD_LR "ffmpeg -vcodec rawvideo -f rawvideo -pix_fmt gray -s 164x122 -i IMG_%u -f image2 -vcodec png IMG_%u.png &> /dev/null &"
#define CONV_CMD_HR "ffmpeg -vcodec rawvideo -f rawvideo -pix_fmt gray -s 326x244 -i IMG_%u -f image2 -vcodec png IMG_%u.png &> /dev/null &"

#define RAW_BYTES_BUFFER_SIZE 512

size_t place_image_payload (size_t seq, size_t base, size_t sz, 
        uint8_t* img_buf, uint8_t* pld_buf);
void dump_image (unsigned int img_idx, uint8_t* img_buf, int res);
void print_timestamp ();

unsigned long long totalcnt = 0;
unsigned long long errcnt_empty_line = 0;
unsigned long long errcnt_cannot_match = 0;
unsigned long long errcnt_corrupted_offset = 0;

unsigned long long percnt_total = 0;
unsigned long long percnt_cannot_match = 0;
unsigned long long percnt_corrupted_offset = 0;
unsigned long long percnt_total_cache = 0;
unsigned long long percnt_cannot_match_cache = 0;
unsigned long long percnt_corrupted_offset_cache = 0;


int main () {
    uint8_t* pcap_buffer = NULL;    /* getline will allocate for us */
    size_t pcap_buffer_size = 0;    /* space allocated for buffer */
    size_t pcap_line_len = 0;       /* actual line size read in */
    ssize_t getline_res = 0;        /* return value from getline */
    
    uint8_t* raw_bytes_buffer = NULL;
    size_t raw_bytes_size = 0;
    raw_bytes_buffer = malloc(RAW_BYTES_BUFFER_SIZE);
    
    uint8_t* payload_buffer = NULL;
    size_t payload_size = 0;
    payload_buffer = malloc(512);
    
    size_t header_offset = 0;
    
    uint8_t detected_new_frame = 0;
    size_t continuous_empty_packets = 0;
    uint8_t new_frame_started = 0;

    size_t seq = 0; /* packet seq number */
    size_t sz = 0;  /* packet data size */
    size_t base = 0;
    size_t offset = 0;  /* offset after the current packet */
    size_t write_count = 0; /* bytes written in this image */
    uint8_t first_img = true;
    unsigned int img_count = 0;
    uint8_t* image_buffer = NULL;
    image_buffer = malloc(IMG_BUFFER_SIZE);
    

    unsigned int count = 0;
    while (true) {
        /* read a line from stdin */
        getline_res = getline((char**)&pcap_buffer, &pcap_buffer_size, stdin);
        if (getline_res == -1) {
            break;
        }
        else {
            pcap_line_len = (size_t) getline_res;
        }
        pcap_line_len -= 1; /* don't count in the trailing newline */
        /* TODO: do we have a more roboust way to do this? */
        
        totalcnt++;
        if (pcap_line_len == 0) {
            /* sometimes we encounter lines that are two short.
               TODO: do we have a more roboust way? */
            errcnt_empty_line++;
            continue;
        }
        
        /* convert the hex string into bytes */
        raw_bytes_size = pcap2bytes(pcap_buffer, pcap_line_len, raw_bytes_buffer);

        /* count per */
        percnt_total_cache++;
        
        /* detect the header */
        header_offset = detect_header(raw_bytes_buffer, 2, 32);
        if (header_offset == 0) {
            /* failed matching header, corrupted packet */
            errcnt_cannot_match++;
            /* count per */
            percnt_cannot_match_cache++;
            continue;
        }
        
        /* decode and get the payload */
        payload_size = bytes2data(raw_bytes_buffer, RAW_BYTES_BUFFER_SIZE, raw_bytes_size, header_offset, payload_buffer);

        /* remove the last byte, as it is not guaranteed to be correct */
        payload_size--;
        
        /* remove the trailing padding bytes PACKET_MAGIC */
        while (payload_buffer[payload_size - 1] == PACKET_MAGIC && payload_size > 10) {
            payload_size--;
        }
        
        /* extact seq and image data (payload) size */
        seq = payload_buffer[payload_size - 2] +
              payload_buffer[payload_size - 3] * 256 +
              payload_buffer[payload_size - 4] * 256 * 256;
        sz = payload_buffer[payload_size - 1];

        /* make sure extract payload size is not larger than packet size */
        if (sz > (payload_size - 4)) {
            sz = payload_size - 4;
        }

        /* assumption: the frame marker is always at the beginning of a
           packet, and there are always a few empty packets before and after
           each frame marker packet */

        if (payload_buffer[0] == FRAME_MAGIC &&
            payload_buffer[1] == FRAME_MAGIC &&
            payload_buffer[2] == FRAME_MAGIC) {
            detected_new_frame = 1;
        }

        if (new_frame_started &&
            (continuous_empty_packets > FRAME_HEADER_THLD)) {
            detected_new_frame = 1;
        }

        /* if detected new frame */
        if (detected_new_frame == 1) {
            /* if it's the first marker we detect, don't dump image */
            if (first_img == true) {
                first_img = false;
            }
            else {
                if (write_count > (IMG_SIZE_LR + 500)) {
                    /* it's a high-res image */
                    dump_image (img_count, image_buffer, 1);
                    img_count += 1;
                    percnt_cannot_match += percnt_cannot_match_cache;
                    percnt_total += percnt_total_cache;
                    percnt_corrupted_offset += percnt_corrupted_offset_cache;
                    percnt_cannot_match_cache = 0;
                    percnt_total_cache = 0;
                    percnt_corrupted_offset_cache = 0;
                }
                else if (write_count > 500) {
                    /* it's a low-res image */
                    dump_image (img_count, image_buffer, 0);
                    img_count += 1;
                    percnt_cannot_match += percnt_cannot_match_cache;
                    percnt_total += percnt_total_cache;
                    percnt_corrupted_offset += percnt_corrupted_offset_cache;
                    percnt_cannot_match_cache = 0;
                    percnt_total_cache = 0;
                    percnt_corrupted_offset_cache = 0;
                }
                else {
                    /* false positive frame detection */
                    percnt_cannot_match_cache = 0;
                    percnt_total_cache = 0;
                    percnt_corrupted_offset_cache = 0;
                }

            }

            /* init for the upcoming new frame */
            detected_new_frame = 0;
            new_frame_started = 0;
            continuous_empty_packets = 0;
            memset(image_buffer, 0, IMG_BUFFER_SIZE);
            write_count = 0;
            base = seq;
        }
        /* if there is no frame header markder in this frame */
        else {
            offset = place_image_payload(seq, base, sz, image_buffer, payload_buffer);
            if (offset != 0) {
                /* if it's a valid write */
                write_count += sz;
            }
            if (sz == 0) {
                continuous_empty_packets++;
            }
            else {
                new_frame_started = 1;
                continuous_empty_packets = 0;
            }
        }
    }
    
    printf("Empty pcap line:\t\t%lld\n", errcnt_empty_line);
    printf("Failed matching header:\t\t%lld\n", errcnt_cannot_match);
    printf("Image offset corrupted:\t\t%lld\n", errcnt_corrupted_offset);
    printf("Total processed:\t\t%lld\n", totalcnt);
    float packet_error_rate = (float)(percnt_cannot_match) / (float)(percnt_total) * 100.0;
    printf("Packet Error Rate:\t\t%.2f%%\n", packet_error_rate);
    float image_quality = (float)(percnt_cannot_match + percnt_corrupted_offset) / (float)(percnt_total) * 100.0;
    printf("Image Quality Index:\t\t%.2f%%\n", image_quality); 
            
    return 0;
}


size_t place_image_payload (size_t seq, size_t base, size_t sz, uint8_t* img_buf, uint8_t* pld_buf) {
    size_t offset;

    if (sz == 0) {
        return 0;
    }

    /* check whether we crossed the max seq numebr */
    if (seq <= base) {
        seq += 256 * 256 * 256;
    }
    /* calculate offset (how many bytes have been transmitted after this packet) */
    offset = seq - base;

    /* make sure we don't run into unallocated memory */
    if (offset <= IMG_BUFFER_SIZE && offset >= sz) {
        memcpy(img_buf + offset - sz, pld_buf, sz);
        return offset;
    }
    else {
        errcnt_corrupted_offset++;
        /* count per */
        percnt_corrupted_offset_cache++;
        return 0;
    }
}

void dump_image (unsigned int img_idx, uint8_t* img_buf, int res) {
    uint8_t image_filename[48] = {0};
    uint8_t* convert_command[512] = {0};
    sprintf((char*)image_filename, "IMG_%u", img_idx);
    FILE * image_fileobj;
    image_fileobj = fopen((char*)image_filename, "wb");
    if (image_fileobj == NULL) {
        /* TODO: failed opening file */
    }
    /* write image buffer of last image to disk */
    print_timestamp();
    if (res == 1) {
        /* it is a high res image */
        fwrite(img_buf, sizeof(uint8_t), IMG_SIZE_HR, image_fileobj);
        fclose(image_fileobj);
        printf("Image #%u dumped, res=high\n", img_idx);
        sprintf((char*)convert_command, CONV_CMD_HR, img_idx, img_idx);
        system((char*)convert_command);
    }
    else if (res == 0) {
        fwrite(img_buf, sizeof(uint8_t), IMG_SIZE_LR, image_fileobj);
        fclose(image_fileobj);
        printf("Image #%u dumped, res=low\n", img_idx);
        sprintf((char*)convert_command, CONV_CMD_LR, img_idx, img_idx);
        system((char*)convert_command);
    }
}

void print_timestamp () {
    long ms;
    time_t s;
    struct timespec spec;

    clock_gettime(CLOCK_REALTIME, &spec);

    s = spec.tv_sec;
    ms = round(spec.tv_nsec / 1000000);

    printf("[%"PRIdMAX".%03ld] ", (intmax_t)s, ms);
}
