/*
 * CJQT native layer unit test entry
 */
#include "test_harness.h"

extern "C"
{
    void nativeApplicationInit();
    void nativeApplicationDelete();
    uintptr_t nativeWidgetCreate(uintptr_t parentPtr);
    void nativeWidgetDelete(uintptr_t ptr);
}

void run_core_tests();
void run_core_new_tests();
void run_gui_tests();
void run_widgets_tests();

int g_pass = 0;
int g_fail = 0;
int g_mod_start = 0;
int g_mod_fail_start = 0;

int main()
{
    printf("== CJQT native layer unit tests ==\n");

    nativeApplicationInit();

    // Construct the QApplication by creating the first widget (lazy init).
    uintptr_t dummy = nativeWidgetCreate(0);
    if (dummy == 0)
    {
        printf("[FATAL] failed to construct QApplication via first widget\n");
        return 1;
    }
    nativeWidgetDelete(dummy);

    run_core_tests();
    run_core_new_tests();
    run_gui_tests();
    run_widgets_tests();

    nativeApplicationDelete();

    printf("\n== TOTAL: %d passed, %d failed ==\n", g_pass, g_fail);
    return g_fail == 0 ? 0 : 1;
}
