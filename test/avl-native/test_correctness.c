#include "common.h"
#include "c_avl.h"
#include <assert.h>

// Assembly functions (linked from avl.o)
extern int32_t node_alloc(Pool *pool);
extern void    node_free(Pool *pool, int32_t idx);
extern int32_t avl_search_single(Pool *pool, int32_t root, int64_t key);
extern int32_t avl_insert_single(Pool *pool, int32_t root, int64_t key);
extern int32_t avl_delete_single(Pool *pool, int32_t root, int64_t key);

#ifdef TEST_SVE
extern int64_t  sve_lane_count(void);
extern int32_t  avl_search_parallel(Pool *pool, int64_t key);
extern void     avl_insert_parallel(Pool *pool, int64_t key);
#endif

// --- Test infrastructure ---

static int tests_run    = 0;
static int tests_passed = 0;

#define TEST_BEGIN(name) do { \
    tests_run++; \
    printf("  [%2d] %-40s ", tests_run, name); \
    fflush(stdout); \
} while (0)

#define TEST_PASS() do { \
    tests_passed++; \
    printf("[PASS]\n"); \
} while (0)

#define TEST_FAIL(msg) do { \
    printf("[FAIL] %s\n", msg); \
    return; \
} while (0)

#define ASSERT_T(cond, msg) do { \
    if (!(cond)) { TEST_FAIL(msg); } \
} while (0)

// ============================================================
//  Scalar tests (ASM)
// ============================================================

static void test_node_alloc_free(void) {
    TEST_BEGIN("node_alloc / node_free");
    Pool *pool = pool_create(10, 1);
    for (int i = 0; i < 10; i++) {
        int32_t idx = node_alloc(pool);
        ASSERT_T(idx == i, "alloc index mismatch");
    }
    ASSERT_T(node_alloc(pool) == -1, "should be full");
    node_free(pool, 3);
    ASSERT_T(node_alloc(pool) == 3, "should reuse freed node");
    ASSERT_T(node_alloc(pool) == -1, "should be full again");
    pool_destroy(pool);
    TEST_PASS();
}

static void test_search_empty(void) {
    TEST_BEGIN("search empty tree");
    Pool *pool = pool_create(100, 1);
    ASSERT_T(avl_search_single(pool, -1, 42) == -1, "should return -1");
    pool_destroy(pool);
    TEST_PASS();
}

static void test_insert_search(void) {
    TEST_BEGIN("insert 1..100 + search");
    Pool *pool = pool_create(1000, 1);
    int32_t root = -1;
    for (int i = 1; i <= 100; i++)
        root = avl_insert_single(pool, root, (int64_t)i);
    for (int i = 1; i <= 100; i++) {
        int32_t f = avl_search_single(pool, root, (int64_t)i);
        ASSERT_T(f != -1, "key not found");
        ASSERT_T(pool->key_base[f] == (int64_t)i, "key mismatch");
    }
    ASSERT_T(avl_search_single(pool, root, 0) == -1, "false positive lo");
    ASSERT_T(avl_search_single(pool, root, 101) == -1, "false positive hi");
    ASSERT_T(verify_bst(pool, root, INT64_MIN, INT64_MAX), "BST violated");
    ASSERT_T(verify_avl(pool, root), "AVL violated");
    int h = tree_height(pool, root);
    printf("h=%d ", h);
    pool_destroy(pool);
    TEST_PASS();
}

static void test_insert_reverse(void) {
    TEST_BEGIN("insert 100..1 (reverse)");
    Pool *pool = pool_create(1000, 1);
    int32_t root = -1;
    for (int i = 100; i >= 1; i--)
        root = avl_insert_single(pool, root, (int64_t)i);
    for (int i = 1; i <= 100; i++)
        ASSERT_T(avl_search_single(pool, root, (int64_t)i) != -1, "not found");
    ASSERT_T(verify_bst(pool, root, INT64_MIN, INT64_MAX), "BST violated");
    ASSERT_T(verify_avl(pool, root), "AVL violated");
    int h = tree_height(pool, root);
    printf("h=%d ", h);
    pool_destroy(pool);
    TEST_PASS();
}

static void test_insert_random(void) {
    TEST_BEGIN("insert 1000 random keys");
    Pool *pool = pool_create(10000, 1);
    int32_t root = -1;
    int keys[1000];
    for (int i = 0; i < 1000; i++) keys[i] = i + 1;
    srand(42);
    for (int i = 999; i > 0; i--) {
        int j = rand() % (i + 1);
        int t = keys[i]; keys[i] = keys[j]; keys[j] = t;
    }
    for (int i = 0; i < 1000; i++)
        root = avl_insert_single(pool, root, (int64_t)keys[i]);
    for (int i = 1; i <= 1000; i++)
        ASSERT_T(avl_search_single(pool, root, (int64_t)i) != -1, "not found");
    ASSERT_T(verify_bst(pool, root, INT64_MIN, INT64_MAX), "BST violated");
    ASSERT_T(verify_avl(pool, root), "AVL violated");
    int h = tree_height(pool, root);
    printf("h=%d ", h);
    pool_destroy(pool);
    TEST_PASS();
}

static void test_duplicate_key(void) {
    TEST_BEGIN("duplicate key insert");
    Pool *pool = pool_create(100, 1);
    int32_t root = -1;
    root = avl_insert_single(pool, root, 42);
    int32_t root2 = avl_insert_single(pool, root, 42);
    ASSERT_T(root2 == root, "root changed");
    ASSERT_T(pool->size == 1, "extra node allocated");
    pool_destroy(pool);
    TEST_PASS();
}

static void test_delete_leaf(void) {
    TEST_BEGIN("delete leaf nodes");
    Pool *pool = pool_create(100, 1);
    int32_t root = -1;
    root = avl_insert_single(pool, root, 2);
    root = avl_insert_single(pool, root, 1);
    root = avl_insert_single(pool, root, 3);
    root = avl_delete_single(pool, root, 1);
    ASSERT_T(avl_search_single(pool, root, 1) == -1, "1 still found");
    ASSERT_T(tree_size(pool, root) == 2, "bad size");
    ASSERT_T(verify_avl(pool, root), "AVL violated");
    root = avl_delete_single(pool, root, 3);
    ASSERT_T(avl_search_single(pool, root, 3) == -1, "3 still found");
    ASSERT_T(tree_size(pool, root) == 1, "bad size");
    pool_destroy(pool);
    TEST_PASS();
}

static void test_delete_one_child(void) {
    TEST_BEGIN("delete node with one child");
    Pool *pool = pool_create(100, 1);
    int32_t root = -1;
    root = avl_insert_single(pool, root, 2);
    root = avl_insert_single(pool, root, 1);
    root = avl_insert_single(pool, root, 3);
    root = avl_insert_single(pool, root, 4);
    root = avl_delete_single(pool, root, 3);
    ASSERT_T(avl_search_single(pool, root, 3) == -1, "3 still found");
    ASSERT_T(avl_search_single(pool, root, 4) != -1, "4 missing");
    ASSERT_T(tree_size(pool, root) == 3, "bad size");
    ASSERT_T(verify_avl(pool, root), "AVL violated");
    ASSERT_T(verify_bst(pool, root, INT64_MIN, INT64_MAX), "BST violated");
    pool_destroy(pool);
    TEST_PASS();
}

static void test_delete_two_children(void) {
    TEST_BEGIN("delete node with two children");
    Pool *pool = pool_create(100, 1);
    int32_t root = -1;
    for (int i = 1; i <= 7; i++)
        root = avl_insert_single(pool, root, (int64_t)i);
    root = avl_delete_single(pool, root, 2);
    ASSERT_T(avl_search_single(pool, root, 2) == -1, "2 still found");
    ASSERT_T(tree_size(pool, root) == 6, "bad size");
    ASSERT_T(verify_avl(pool, root), "AVL violated");
    ASSERT_T(verify_bst(pool, root, INT64_MIN, INT64_MAX), "BST violated");
    for (int i = 1; i <= 7; i++) {
        if (i == 2) continue;
        ASSERT_T(avl_search_single(pool, root, (int64_t)i) != -1, "key missing");
    }
    pool_destroy(pool);
    TEST_PASS();
}

static void test_delete_root(void) {
    TEST_BEGIN("delete root node");
    Pool *pool = pool_create(100, 1);
    int32_t root = -1;
    root = avl_insert_single(pool, root, 42);
    root = avl_delete_single(pool, root, 42);
    ASSERT_T(root == -1, "tree not empty");
    root = -1;
    for (int i = 1; i <= 5; i++)
        root = avl_insert_single(pool, root, (int64_t)i);
    int64_t rk = pool->key_base[root];
    root = avl_delete_single(pool, root, rk);
    ASSERT_T(avl_search_single(pool, root, rk) == -1, "root key still found");
    ASSERT_T(tree_size(pool, root) == 4, "bad size");
    ASSERT_T(verify_avl(pool, root), "AVL violated");
    pool_destroy(pool);
    TEST_PASS();
}

static void test_delete_not_found(void) {
    TEST_BEGIN("delete non-existent key");
    Pool *pool = pool_create(100, 1);
    int32_t root = -1;
    root = avl_delete_single(pool, root, 42);
    ASSERT_T(root == -1, "empty tree changed");
    for (int i = 1; i <= 5; i++)
        root = avl_insert_single(pool, root, (int64_t)i);
    int32_t old = root;
    root = avl_delete_single(pool, root, 99);
    ASSERT_T(root == old, "root changed");
    ASSERT_T(tree_size(pool, root) == 5, "bad size");
    pool_destroy(pool);
    TEST_PASS();
}

static void test_delete_all(void) {
    TEST_BEGIN("delete all 100 nodes");
    Pool *pool = pool_create(1000, 1);
    int32_t root = -1;
    int N = 100;
    int keys[100];
    for (int i = 0; i < N; i++) keys[i] = i + 1;
    srand(123);
    for (int i = N - 1; i > 0; i--) {
        int j = rand() % (i + 1);
        int t = keys[i]; keys[i] = keys[j]; keys[j] = t;
    }
    for (int i = 0; i < N; i++)
        root = avl_insert_single(pool, root, (int64_t)keys[i]);
    for (int i = N - 1; i > 0; i--) {
        int j = rand() % (i + 1);
        int t = keys[i]; keys[i] = keys[j]; keys[j] = t;
    }
    for (int i = 0; i < N; i++) {
        root = avl_delete_single(pool, root, (int64_t)keys[i]);
        ASSERT_T(verify_avl(pool, root), "AVL violated mid-delete");
        ASSERT_T(verify_bst(pool, root, INT64_MIN, INT64_MAX), "BST violated mid-delete");
        ASSERT_T(tree_size(pool, root) == N - i - 1, "bad size mid-delete");
    }
    ASSERT_T(root == -1, "tree not empty");
    pool_destroy(pool);
    TEST_PASS();
}

static void test_insert_delete_mixed(void) {
    TEST_BEGIN("mixed insert/delete 5000 ops");
    Pool *pool = pool_create(10000, 1);
    int32_t root = -1;
    int present[2001];
    memset(present, 0, sizeof(present));
    int count = 0;
    srand(12345);
    for (int r = 0; r < 5000; r++) {
        int key = (rand() % 2000) + 1;
        if (present[key]) {
            root = avl_delete_single(pool, root, (int64_t)key);
            present[key] = 0;
            count--;
        } else {
            root = avl_insert_single(pool, root, (int64_t)key);
            present[key] = 1;
            count++;
        }
    }
    ASSERT_T(verify_avl(pool, root), "AVL violated");
    ASSERT_T(verify_bst(pool, root, INT64_MIN, INT64_MAX), "BST violated");
    ASSERT_T(tree_size(pool, root) == count, "size mismatch");
    for (int k = 1; k <= 2000; k++) {
        int32_t f = avl_search_single(pool, root, (int64_t)k);
        if (present[k]) ASSERT_T(f != -1, "expected key missing");
        else ASSERT_T(f == -1, "unexpected key found");
    }
    int h = tree_height(pool, root);
    printf("n=%d h=%d ", count, h);
    pool_destroy(pool);
    TEST_PASS();
}

// --- C AVL reference validation ---

static void test_c_avl_correctness(void) {
    TEST_BEGIN("C AVL reference insert+search");
    Pool *pool = pool_create(2000, 1);
    int32_t root = -1;
    for (int i = 1; i <= 500; i++)
        root = c_avl_insert(pool, root, (int64_t)i);
    for (int i = 1; i <= 500; i++)
        ASSERT_T(c_avl_search(pool, root, (int64_t)i) != -1, "not found");
    ASSERT_T(c_avl_search(pool, root, 0) == -1, "false positive");
    ASSERT_T(verify_avl(pool, root), "AVL violated");
    ASSERT_T(verify_bst(pool, root, INT64_MIN, INT64_MAX), "BST violated");
    int h = tree_height(pool, root);
    printf("h=%d ", h);
    pool_destroy(pool);
    TEST_PASS();
}

// ============================================================
//  SVE tests
// ============================================================

#ifdef TEST_SVE

static void test_sve_lane_count(void) {
    TEST_BEGIN("SVE lane count");
    int64_t lanes = sve_lane_count();
    printf("lanes=%lld ", (long long)lanes);
    ASSERT_T(lanes > 0, "zero lanes");
    ASSERT_T(lanes <= 32, "too many lanes");
    TEST_PASS();
}

static void test_search_parallel_basic(void) {
    TEST_BEGIN("parallel search (basic)");
    int64_t n = sve_lane_count();
    Pool *pool = pool_create(1000, (uint32_t)n);
    for (int i = 0; i < (int)n; i++) {
        int64_t key = (i + 1) * 100;
        pool->roots_base[i] = avl_insert_single(pool, pool->roots_base[i], key);
        pool->roots_base[i] = avl_insert_single(pool, pool->roots_base[i], key + 1);
        pool->roots_base[i] = avl_insert_single(pool, pool->roots_base[i], key + 2);
    }
    for (int i = 0; i < (int)n; i++) {
        int64_t key = (i + 1) * 100;
        ASSERT_T(avl_search_parallel(pool, key) != -1, "key not found");
        ASSERT_T(avl_search_parallel(pool, key + 1) != -1, "key+1 not found");
        ASSERT_T(avl_search_parallel(pool, key + 2) != -1, "key+2 not found");
    }
    pool_destroy(pool);
    TEST_PASS();
}

static void test_search_parallel_miss(void) {
    TEST_BEGIN("parallel search (miss)");
    int64_t n = sve_lane_count();
    Pool *pool = pool_create(1000, (uint32_t)n);
    for (int i = 0; i < (int)n; i++)
        pool->roots_base[i] = avl_insert_single(pool, pool->roots_base[i], (i + 1) * 10);
    ASSERT_T(avl_search_parallel(pool, 999) == -1, "false positive 999");
    ASSERT_T(avl_search_parallel(pool, 0) == -1, "false positive 0");
    ASSERT_T(avl_search_parallel(pool, -1) == -1, "false positive -1");
    Pool *empty = pool_create(100, (uint32_t)n);
    ASSERT_T(avl_search_parallel(empty, 42) == -1, "false positive empty");
    pool_destroy(empty);
    pool_destroy(pool);
    TEST_PASS();
}

static void test_insert_parallel(void) {
    TEST_BEGIN("parallel insert 500 keys");
    int64_t n = sve_lane_count();
    Pool *pool = pool_create(10000, (uint32_t)n);
    int N = 500;
    for (int i = 1; i <= N; i++)
        avl_insert_parallel(pool, (int64_t)i);
    for (int i = 1; i <= N; i++)
        ASSERT_T(avl_search_parallel(pool, (int64_t)i) != -1, "key not found");
    int total = 0;
    for (int i = 0; i < (int)n; i++) {
        ASSERT_T(verify_avl(pool, pool->roots_base[i]), "AVL violated");
        ASSERT_T(verify_bst(pool, pool->roots_base[i], INT64_MIN, INT64_MAX), "BST violated");
        total += tree_size(pool, pool->roots_base[i]);
    }
    ASSERT_T(total == N, "total mismatch");
    // Duplicate
    avl_insert_parallel(pool, 1);
    int total2 = 0;
    for (int i = 0; i < (int)n; i++)
        total2 += tree_size(pool, pool->roots_base[i]);
    ASSERT_T(total2 == N, "dup changed size");
    printf("n_trees=%lld ", (long long)n);
    pool_destroy(pool);
    TEST_PASS();
}

static void test_mixed_parallel(void) {
    TEST_BEGIN("parallel mixed 5000 keys");
    int64_t n = sve_lane_count();
    Pool *pool = pool_create(50000, (uint32_t)n);
    int N = 5000;
    for (int i = 1; i <= N; i++)
        avl_insert_parallel(pool, (int64_t)i);
    for (int i = 1; i <= N; i++)
        ASSERT_T(avl_search_parallel(pool, (int64_t)i) != -1, "key not found");
    for (int i = N + 1; i <= N + 100; i++)
        ASSERT_T(avl_search_parallel(pool, (int64_t)i) == -1, "false positive");
    int total = 0;
    int max_h = 0;
    for (int i = 0; i < (int)n; i++) {
        ASSERT_T(verify_avl(pool, pool->roots_base[i]), "AVL violated");
        ASSERT_T(verify_bst(pool, pool->roots_base[i], INT64_MIN, INT64_MAX), "BST violated");
        total += tree_size(pool, pool->roots_base[i]);
        int h = tree_height(pool, pool->roots_base[i]);
        if (h > max_h) max_h = h;
    }
    ASSERT_T(total == N, "total mismatch");
    printf("max_h=%d ", max_h);
    pool_destroy(pool);
    TEST_PASS();
}

#endif // TEST_SVE

// ============================================================
//  Main
// ============================================================

int main(void) {
    print_header("AVL Forest Correctness Tests");

    printf("\n--- Scalar (ASM) ---\n");
    test_node_alloc_free();
    test_search_empty();
    test_insert_search();
    test_insert_reverse();
    test_insert_random();
    test_duplicate_key();
    test_delete_leaf();
    test_delete_one_child();
    test_delete_two_children();
    test_delete_root();
    test_delete_not_found();
    test_delete_all();
    test_insert_delete_mixed();

    printf("\n--- C Reference AVL ---\n");
    test_c_avl_correctness();

#ifdef TEST_SVE
    printf("\n--- SVE Parallel ---\n");
    test_sve_lane_count();
    test_search_parallel_basic();
    test_search_parallel_miss();
    test_insert_parallel();
    test_mixed_parallel();
#endif

    printf("\n------------------------------------------------------------\n");
#ifdef TEST_SVE
    int total = tests_run;
#else
    int total = tests_run;
    printf("  (SVE tests skipped — compile with -DTEST_SVE to enable)\n");
#endif
    printf("  Result: %d/%d tests passed\n", tests_passed, total);
    printf("------------------------------------------------------------\n\n");

    return tests_passed == tests_run ? 0 : 1;
}
