#include "splitter.h"

extern "C"
{

    // QSplitter

    long nativeSplitterCreate(long parentPtr)
    {
        APPLICATION_CREATE
        CjQtSplitter *splitter;
        if (parentPtr == 0L)
        {
            splitter = new CjQtSplitter();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            splitter = new CjQtSplitter(parent);
        }
        return reinterpret_cast<long>(splitter);
    }

    void nativeSplitterDelete(long ptr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeSplitterAddWidget(long ptr, long widgetPtr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->addWidget(widget);
    }

    void nativeSplitterInsertWidget(long ptr, int index, long widgetPtr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->insertWidget(index, widget);
    }

    long nativeSplitterReplaceWidget(long ptr, int index, long widgetPtr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        QWidget *replaceWidget = instance->replaceWidget(index, widget);
        return reinterpret_cast<long>(replaceWidget);
    }

    void nativeSplitterSetOrientation(long ptr, int orientation)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        instance->setOrientation(Qt::Orientation(orientation));
    }

    int nativeSplitterOrientation(long ptr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        return instance->orientation();
    }

    void nativeSplitterSetChildrenCollapsible(long ptr, bool collapsible)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        instance->setChildrenCollapsible(collapsible);
    }

    bool nativeSplitterChildrenCollapsible(long ptr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        return instance->childrenCollapsible();
    }

    void nativeSplitterSetCollapsible(long ptr, int index, bool collapsible)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        instance->setCollapsible(index, collapsible);
    }

    bool nativeSplitterCollapsible(long ptr, int index)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        return instance->isCollapsible(index);
    }

    void nativeSplitterSetOpaqueResize(long ptr, bool resize)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        instance->setOpaqueResize(resize);
    }

    bool nativeSplitterOpaqueResize(long ptr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        return instance->opaqueResize();
    }

    void nativeSplitterRefresh(long ptr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        instance->refresh();
    }

    long nativeSplitterSizeHint(long ptr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        QSize size = instance->sizeHint();
        return reinterpret_cast<long>(&size);
    }

    long nativeSplitterMinimumSizeHint(long ptr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        QSize size = instance->minimumSizeHint();
        return reinterpret_cast<long>(&size);
    }

    void nativeSplitterSetHandleWidth(long ptr, int width)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        instance->setHandleWidth(width);
    }

    int nativeSplitterHandleWidth(long ptr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        return instance->handleWidth();
    }

    int nativeSplitterIndexOf(long ptr, long widgetPtr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        return instance->indexOf(widget);
    }

    long nativeSplitterWidget(long ptr, int index)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = instance->widget(index);
        return reinterpret_cast<long>(widget);
    }

    int nativeSplitterCount(long ptr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        return instance->count();
    }

    long nativeSplitterHandle(long ptr, int index)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        QSplitterHandle *handle = instance->handle(index);
        return reinterpret_cast<long>(handle);
    }

    void nativeSplitterSetStretchFactor(long ptr, int index, int stretch)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        instance->setStretchFactor(index, stretch);
    }
}