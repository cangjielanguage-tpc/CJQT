#include "v_box_layout.h"

extern "C" {
    // QVBoxLayout

    uintptr_t nativeVBoxLayoutCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        CjQtVBoxLayout *layout;
        if (parentPtr == 0L)
        {
            layout = new CjQtVBoxLayout();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            layout = new CjQtVBoxLayout(parent);
        }
        return reinterpret_cast<uintptr_t>(layout);
    }

    void nativeVBoxLayoutDelete(uintptr_t ptr)
    {
        CjQtVBoxLayout *instance = reinterpret_cast<CjQtVBoxLayout *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}