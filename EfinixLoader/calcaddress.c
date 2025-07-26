#include <stdint.h>
#include <stdio.h>

// Compute address from block counts
uint32_t calculate_address(uint16_t blocks_256B, uint16_t blocks_4KB, uint16_t blocks_64KB) {
    return (blocks_64KB << 16) + (blocks_4KB << 12) + (blocks_256B << 8);
}

// Optional: Break down an address into block counts
void decompose_address(uint32_t address, uint16_t* blocks_64KB, uint16_t* blocks_4KB, uint16_t* blocks_256B) {
    *blocks_64KB = address >> 16;
    *blocks_4KB  = (address >> 12) & 0xF;
    *blocks_256B = (address >> 8)  & 0xF;
}

// Demo usage
int main() {
    uint32_t addr = calculate_address(2, 1, 0); // 1*4096 + 2*256 = 4608
    printf("Address: %u\n", addr);

    uint16_t b64K, b4K, b256;
    decompose_address(addr, &b64K, &b4K, &b256);
    printf("64KB blocks: %u, 4KB blocks: %u, 256B blocks: %u\n", b64K, b4K, b256);
}