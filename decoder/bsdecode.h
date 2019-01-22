#include <stdint.h>
#include <stddef.h>


size_t pcap2bytes (uint8_t* pcap_str, size_t pcap_str_size, uint8_t* raw_bytes);
size_t detect_header (uint8_t* raw_bytes, size_t start_idx, size_t end_idx);
size_t bytes2data (uint8_t* raw_bytes, size_t raw_bytes_size, size_t raw_size, size_t header_offset, uint8_t* decoded);
