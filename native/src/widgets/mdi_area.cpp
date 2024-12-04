#include "mdi_area.h"
#include<QBrush>

extern "C"
{

    // QFileDialog

    uintptr_t nativeMdiAreaCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        CjQtMdiArea *mdiArea;
        if (parentPtr == 0L)
        {
            mdiArea = new CjQtMdiArea();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            mdiArea = new CjQtMdiArea(parent);
        }

        return reinterpret_cast<uintptr_t>(mdiArea);
    }

    void nativeMdiAreaDelete(uintptr_t ptr)
    {
        CjQtMdiArea *area = reinterpret_cast<CjQtMdiArea *>(static_cast<uintptr_t>(ptr));
        delete area;
    }
    void nativeMdiAreaSetBackground(uintptr_t ptr,uintptr_t bgPtr){
        CjQtMdiArea *area = reinterpret_cast<CjQtMdiArea *>(static_cast<uintptr_t>(ptr));
        QBrush *brush = reinterpret_cast<QBrush *>(static_cast<uintptr_t>(bgPtr));
        area->setBackground(*brush);
    }

}
