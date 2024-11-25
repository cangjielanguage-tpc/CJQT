#include "splitter_handle.h"
#include "splitter.h"

extern "C"
{

    // QSplitterHandle

    uintptr_t nativeSplitterHandleCreate(int orientation, uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        CjQtSplitterHandle *handle;
        if (parentPtr == 0L)
        {
            handle = new CjQtSplitterHandle();
        }
        else
        {
            QSplitter *parent = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(parentPtr));
            handle = new CjQtSplitterHandle(Qt::Orientation(orientation), parent);
        }
        return reinterpret_cast<uintptr_t>(handle);
    }

    void nativeSplitterHandleDelete(uintptr_t ptr)
    {
        CjQtSplitterHandle *instance = reinterpret_cast<CjQtSplitterHandle *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeSplitterHandleSetOrientation(uintptr_t ptr, int orientation)
    {
        QSplitterHandle *instance = reinterpret_cast<QSplitterHandle *>(static_cast<uintptr_t>(ptr));
        instance->setOrientation(Qt::Orientation(orientation));
    }

    int nativeSplitterHandleOrientation(uintptr_t ptr)
    {
        QSplitterHandle *instance = reinterpret_cast<QSplitterHandle *>(static_cast<uintptr_t>(ptr));
        return instance->orientation();
    }

    bool nativeSplitterHandleOpaqueResize(uintptr_t ptr)
    {
        QSplitterHandle *instance = reinterpret_cast<QSplitterHandle *>(static_cast<uintptr_t>(ptr));
        return instance->opaqueResize();
    }
    uintptr_t nativeSplitterHandleSplitter(uintptr_t ptr)
    {
        QSplitterHandle *instance = reinterpret_cast<QSplitterHandle *>(static_cast<uintptr_t>(ptr));
        QSplitter *splitter = instance->splitter();
        return reinterpret_cast<uintptr_t>(splitter);
    }

    uintptr_t nativeSplitterHandleSizeHint(uintptr_t ptr)
    {
        QSplitterHandle *instance = reinterpret_cast<QSplitterHandle *>(static_cast<uintptr_t>(ptr));
        QSize size = instance->sizeHint();
        return reinterpret_cast<uintptr_t>(&size);
    }
}