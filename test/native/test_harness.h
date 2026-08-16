/*
 * CJQT native layer unit test harness
 */
#ifndef CJQT_TEST_HARNESS_H_
#define CJQT_TEST_HARNESS_H_

#include <cstdio>
#include <cstring>
#include <cstdint>

extern int g_pass;
extern int g_fail;

#define CHECK(cond)                                                                        \
    do                                                                                     \
    {                                                                                      \
        if (cond)                                                                          \
        {                                                                                  \
            g_pass++;                                                                      \
            printf("  [PASS] %s\n", #cond);                                                \
        }                                                                                  \
        else                                                                               \
        {                                                                                  \
            g_fail++;                                                                      \
            printf("  [FAIL] %s (%s:%d)\n", #cond, __FILE__, __LINE__);                    \
        }                                                                                  \
    } while (0)

#define CHECK_EQ_INT(a, b)                                                                 \
    do                                                                                     \
    {                                                                                      \
        long long va = (long long)(a);                                                     \
        long long vb = (long long)(b);                                                     \
        if (va == vb)                                                                      \
        {                                                                                  \
            g_pass++;                                                                      \
            printf("  [PASS] %s == %s (%lld)\n", #a, #b, va);                              \
        }                                                                                  \
        else                                                                               \
        {                                                                                  \
            g_fail++;                                                                      \
            printf("  [FAIL] %s (%lld) != %s (%lld) (%s:%d)\n", #a, va, #b, vb, __FILE__,  \
                   __LINE__);                                                              \
        }                                                                                  \
    } while (0)

#define CHECK_EQ_STR(a, b)                                                                 \
    do                                                                                     \
    {                                                                                      \
        const char *sa = (a);                                                              \
        const char *sb = (b);                                                              \
        if (sa != nullptr && sb != nullptr && strcmp(sa, sb) == 0)                         \
        {                                                                                  \
            g_pass++;                                                                      \
            printf("  [PASS] %s == %s (\"%s\")\n", #a, #b, sa);                            \
        }                                                                                  \
        else                                                                               \
        {                                                                                  \
            g_fail++;                                                                      \
            printf("  [FAIL] %s (\"%s\") != %s (\"%s\") (%s:%d)\n", #a,                      \
                   sa ? sa : "null", #b, sb ? sb : "null", __FILE__, __LINE__);             \
        }                                                                                  \
    } while (0)

#define CHECK_STR_CONTAINS(a, sub)                                                         \
    do                                                                                     \
    {                                                                                      \
        const char *sa = (a);                                                              \
        if (sa != nullptr && strstr(sa, (sub)) != nullptr)                                 \
        {                                                                                  \
            g_pass++;                                                                      \
            printf("  [PASS] %s contains \"%s\"\n", #a, (sub));                            \
        }                                                                                  \
        else                                                                               \
        {                                                                                  \
            g_fail++;                                                                      \
            printf("  [FAIL] %s (\"%s\") does not contain \"%s\" (%s:%d)\n", #a,            \
                   sa ? sa : "null", (sub), __FILE__, __LINE__);                            \
        }                                                                                  \
    } while (0)

#define TEST_MODULE_BEGIN(name) printf("\n== %s ==\n", name)
#define TEST_MODULE_END(name)                                                              \
    printf("-- %s: %d passed, %d failed --\n", name, g_pass - g_mod_start, g_fail -        \
           g_mod_fail_start);                                                              \
    g_mod_start = g_pass;                                                                  \
    g_mod_fail_start = g_fail;

extern int g_mod_start;
extern int g_mod_fail_start;

#endif
