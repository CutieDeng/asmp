// benchmark/sha1/main.c - SHA1 benchmark
#include "../common.h"
#include "sha1_ref.h"

#ifdef __APPLE__
#include <CommonCrypto/CommonDigest.h>
#endif

// ============================================================
// SHA1 实现
// ============================================================

// ASM implementation (from our DSL)
extern void sha1_init(uint32_t state[5]);
extern void sha1_consume(uint32_t state[5], const uint8_t block[64]);
extern void sha1_digest(uint32_t state[5], const uint8_t *data,
                        uint64_t total_bits, uint8_t digest[20]);

static void sha1_c_ref(const uint8_t *data, size_t len, uint8_t digest[32]) {
    sha1_ref(data, len, digest);
}

static void sha1_asm_neon(const uint8_t *data, size_t len, uint8_t digest[32]) {
    uint32_t state[5];
    sha1_init(state);
    size_t blocks = len / 64;
    for (size_t i = 0; i < blocks; i++) {
        sha1_consume(state, data + i * 64);
    }
    sha1_digest(state, data + blocks * 64, len * 8, digest);
}

#ifdef __APPLE__
static void sha1_commoncrypto(const uint8_t *data, size_t len, uint8_t digest[32]) {
    CC_SHA1(data, (CC_LONG)len, digest);
}
#endif

// ============================================================
// Main
// ============================================================

int main(int argc, char *argv[]) {
    timing_init();

    int json_output = 0;
    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--json") == 0) {
            json_output = 1;
        }
    }

    if (!json_output) {
        printf("SHA1 Benchmark\n");
        printf("==============\n");
    }

    category_t sha1;
    category_init(&sha1, "SHA1", 20);
    category_add(&sha1, "C-reference", sha1_c_ref);
    category_add(&sha1, "ASM-NEON", sha1_asm_neon);
#ifdef __APPLE__
    category_add(&sha1, "CommonCrypto", sha1_commoncrypto);
#endif

    int passed = run_category_benchmark(&sha1, json_output);

    if (!json_output) {
        printf("\nDigest verification: %s\n", passed ? "PASSED" : "FAILED");
    }

    return passed ? 0 : 1;
}
