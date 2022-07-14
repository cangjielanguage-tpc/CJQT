#include "h_box_layout.h"

extern "C" {
    // QHBoxLayout

    long nativeHBoxLayoutCreate(long parentPtr)
    {
        APPLICATION_CREATE
        CjQtHBoxLayout *layout;
        if (parentPtr == 0L)
        {
            layout = new CjQtHBoxLayout();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            layout = new CjQtHBoxLayout(parent);
        }
        return reinterpret_cast<long>(layout);
    }

    void nativeHBoxLayoutDelete(long ptr)
    {
        CjQtHBoxLayout *instance = reinterpret_cast<CjQtHBoxLayout *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}