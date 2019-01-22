#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <stddef.h>

/* for debugging */
/* e.g. printf("bin: "BYTE_TO_BINARY_PATTERN, BYTE_TO_BINARY(byte)); */
#define BYTE_TO_BINARY_PATTERN "%c%c%c%c%c%c%c%c"
#define BYTE_TO_BINARY(byte)  \
  (byte & 0x80 ? '1' : '0'), \
  (byte & 0x40 ? '1' : '0'), \
  (byte & 0x20 ? '1' : '0'), \
  (byte & 0x10 ? '1' : '0'), \
  (byte & 0x08 ? '1' : '0'), \
  (byte & 0x04 ? '1' : '0'), \
  (byte & 0x02 ? '1' : '0'), \
  (byte & 0x01 ? '1' : '0')


#define PACKET_MAGIC 0b10010010

/* used for hex char to dec conversion */

const uint8_t hexmap[] =
{
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, // 01234567
    0x08, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 89:;<=>?
    0x00, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x00, // @ABCDEFG
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // HIJKLMNO
};

/*
 * converts a hex character into decimal
 * in: the character to be converted
 * return value: decimal equivalent
 */

static inline uint8_t hex2dec (uint8_t in) {
    return hexmap[(in & 0x1f) ^ 0x10];
}

/*
 * reverses the order of bits in a byte
 * in: the byte to be reversed
 * return value: reversed byte 
 */

static inline uint8_t reverse_bits(uint8_t in) {
    in = (in & 0xf0) >> 4 | (in & 0x0f) << 4;
    in = (in & 0xcc) >> 2 | (in & 0x33) << 2;
    in = (in & 0xaa) >> 1 | (in & 0x55) << 1;
    return in;
}

/* terminology: pcap -> raw -> decoded */

/*
 * converts a line of pcap hex dump into raw bytes
 * pcap_str: pointer to the start of pcap hex dump
 * pcap_str_size: length of the pcap hex dump (excl. newline)
 * raw_bytes: pointer to a memory space to be holding converted bytes
 * return value: number of bytes successfully converted
 */

size_t pcap2bytes (uint8_t* pcap_str, size_t pcap_str_size, uint8_t* raw_bytes) {
    /* calculate converted size */
    size_t converted_size = pcap_str_size / 2;
    
    /* check sanity */
    if (!raw_bytes) {
        return 0;
    }
    
    /* convert hex string into bytes, and reverse each byte */
    int byte_idx = 0;
    for (byte_idx = 0; byte_idx < converted_size; byte_idx++) {
        /* convert two chars into one byte */
        uint8_t deci = (hex2dec(pcap_str[byte_idx << 1]) << 4) |
                        hex2dec(pcap_str[(byte_idx << 1) + 1]);
        /* reverse the order of bits */
        raw_bytes[byte_idx] = reverse_bits(deci);
    }
    
    /* return size of converted bytes */
    return converted_size;
}

/*
 * search the packet header in the specified range by detecting PACKET_MAGIC
 * raw_bytes: pointer to the start of raw bytes
 * raw_size: number of raw bytes
 * start_idx: start position of header search in bits (incl.)
 * end_idx: end position of header search in bits (excl.)
 * return value: offset of the header, or 0 when there is no match
 */  
size_t detect_header (uint8_t* raw_bytes, size_t start_idx, size_t end_idx) {
    size_t offset = 0;
    size_t detected_offset = 0;

    /* try each offset */
    for (offset = start_idx; offset < end_idx; offset++) {
        /* extract raw header from raw bytes */
        size_t offset_bytes = offset / 8;
        size_t offset_bits = offset - offset_bytes * 8;
        uint8_t mask_low = (1 << (8-offset_bits)) - 1;    /* for offset_bits=3 it is 0b00011111 */
        uint8_t mask_high = ~mask_low;                  /* for offset_bits=3 it is 0b11100000 */
        uint8_t raw_header[3] = {
            ((raw_bytes[offset_bytes] & mask_low) << offset_bits) | 
                ((raw_bytes[offset_bytes+1] & mask_high) >> (8-offset_bits)),
            ((raw_bytes[offset_bytes+1] & mask_low) << offset_bits) | 
                ((raw_bytes[offset_bytes+2] & mask_high) >> (8-offset_bits)),
            ((raw_bytes[offset_bytes+2] & mask_low) << offset_bits) | 
                ((raw_bytes[offset_bytes+3] & mask_high) >> (8-offset_bits)),
        };
        /* calculate header using majority voting */
        uint8_t header = (raw_header[0] & raw_header[1]) | (raw_header[1] & raw_header[2]) | (raw_header[0] & raw_header[2]);
        /* compare the result against PACKET_MAGIC */
        if (header == PACKET_MAGIC) {
            detected_offset = offset;
            break;
        }
    }
    return detected_offset;
}

/* 
 * decode bytes into backscatter payload, with header removed
 * raw_bytes: pointer to the start of raw bytes 
 * raw_bytes_size: size of raw_bytes buffer
 * raw_size: number of raw bytes
 * header_offset: start position of packet header PACKET_MAGIC
 * decoded: pointer to a memory space to be holding decoded payload
 * return value: size of decoded payload (with header removed)
 */
size_t bytes2data (uint8_t* raw_bytes, size_t raw_bytes_size, size_t raw_size, size_t header_offset, uint8_t* decoded) {
    /* calculate offset for the start of header */
    size_t offset_bytes = header_offset / 8;
    size_t offset_bits = header_offset - offset_bytes * 8;
    uint8_t mask_low = (1 << (8-offset_bits)) - 1;    /* for offset_bits=3 it is 0b00011111 */
    uint8_t mask_high = ~mask_low;                  /* for offset_bits=3 it is 0b11100000 */
    offset_bytes += 3;  /* skip three header bytes */
    
    /* calculate size of decoded payload */
    size_t decoded_size = (offset_bits == 0) ? 
        (raw_size - offset_bytes) / 3 : (raw_size - 1 - offset_bytes) / 3;
    if (decoded_size > raw_bytes_size) {
      decoded_size = raw_bytes_size;
    }
    
    /* use majority voting to decode payload */
    size_t decode_idx = 0;  /* which payload byte are we dealing with */
    for (decode_idx = 0; decode_idx < decoded_size; decode_idx++) {
        size_t raw_idx = decode_idx * 3 + offset_bytes;
        uint8_t raw_payload[3] = {
            ((raw_bytes[raw_idx] & mask_low) << offset_bits) | 
                ((raw_bytes[raw_idx+1] & mask_high) >> (8-offset_bits)),
            ((raw_bytes[raw_idx+1] & mask_low) << offset_bits) | 
                ((raw_bytes[raw_idx+2] & mask_high) >> (8-offset_bits)),
            ((raw_bytes[raw_idx+2] & mask_low) << offset_bits) | 
                ((raw_bytes[raw_idx+3] & mask_high) >> (8-offset_bits)),
        };
        /* calculate payload byte using majority voting */
        uint8_t payload_byte = 
            (raw_payload[0] & raw_payload[1]) | 
            (raw_payload[1] & raw_payload[2]) | 
            (raw_payload[0] & raw_payload[2]);
        decoded[decode_idx] = payload_byte;
    }
    return decoded_size;
}
