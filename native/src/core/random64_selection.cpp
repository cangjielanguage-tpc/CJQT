/*
 * CJQT native bindings: QRandomGenerator64, QItemSelection
 */
#include <QRandomGenerator>
#include <QItemSelection>
#include "native_string.h"

extern "C"
{
    // ---- QRandomGenerator64 ----

    uintptr_t nativeRandomGenerator64Create()
    {
        return reinterpret_cast<uintptr_t>(new QRandomGenerator64(QRandomGenerator::global()->generate()));
    }

    void nativeRandomGenerator64Delete(uintptr_t ptr)
    {
        delete reinterpret_cast<QRandomGenerator64 *>(static_cast<uintptr_t>(ptr));
    }

    unsigned long long nativeRandomGenerator64Generate64(uintptr_t ptr)
    {
        return reinterpret_cast<QRandomGenerator64 *>(static_cast<uintptr_t>(ptr))->generate64();
    }


    // ---- QItemSelection ----

    uintptr_t nativeItemSelectionCreate()
    {
        return reinterpret_cast<uintptr_t>(new QItemSelection());
    }

    void nativeItemSelectionDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QItemSelection *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeItemSelectionIsEmpty(uintptr_t ptr)
    {
        return reinterpret_cast<QItemSelection *>(static_cast<uintptr_t>(ptr))->isEmpty();
    }

    int nativeItemSelectionCount(uintptr_t ptr)
    {
        return reinterpret_cast<QItemSelection *>(static_cast<uintptr_t>(ptr))->count();
    }

    void nativeItemSelectionClear(uintptr_t ptr)
    {
        reinterpret_cast<QItemSelection *>(static_cast<uintptr_t>(ptr))->clear();
    }
}
