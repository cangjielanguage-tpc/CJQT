#include "splitter_handle.h"
#include "splitter.h"

extern "C"
{

    // QSplitterHandle

    long nativeSplitterHandleCreate(int orientation, long parentPtr)
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
        return reinterpret_cast<long>(handle);
    }

    void nativeSplitterHandleDelete(long ptr)
    {
        CjQtSplitterHandle *instance = reinterpret_cast<CjQtSplitterHandle *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeSplitterHandleSetOrientation(long ptr, int orientation)
    {
        QSplitterHandle *instance = reinterpret_cast<QSplitterHandle *>(static_cast<uintptr_t>(ptr));
        instance->setOrientation(Qt::Orientation(orientation));
    }

    int nativeSplitterHandleOrientation(long ptr)
    {
        QSplitterHandle *instance = reinterpret_cast<QSplitterHandle *>(static_cast<uintptr_t>(ptr));
        return instance->orientation();
    }

    bool nativeSplitterHandleOpaqueResize(long ptr)
    {
        QSplitterHandle *instance = reinterpret_cast<QSplitterHandle *>(static_cast<uintptr_t>(ptr));
        return instance->opaqueResize();
    }
    long nativeSplitterHandleSplitter(long ptr)
    {
        QSplitterHandle *instance = reinterpret_cast<QSplitterHandle *>(static_cast<uintptr_t>(ptr));
        QSplitter *splitter = instance->splitter();
        return reinterpret_cast<long>(splitter);
    }

    long nativeSplitterHandleSizeHint(long ptr)
    {
        QSplitterHandle *instance = reinterpret_cast<QSplitterHandle *>(static_cast<uintptr_t>(ptr));
        QSize size = instance->sizeHint();
        return reinterpret_cast<long>(&size);
    }
}