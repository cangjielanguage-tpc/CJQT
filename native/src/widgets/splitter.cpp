#include "splitter.h"

extern "C"
{

    // QSplitter

    uintptr_t nativeSplitterCreate(uintptr_t parentPtr)
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
        return reinterpret_cast<uintptr_t>(splitter);
    }

    void nativeSplitterDelete(uintptr_t ptr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeSplitterAddWidget(uintptr_t ptr, uintptr_t widgetPtr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->addWidget(widget);
    }

    void nativeSplitterInsertWidget(uintptr_t ptr, int index, uintptr_t widgetPtr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->insertWidget(index, widget);
    }

    uintptr_t nativeSplitterReplaceWidget(uintptr_t ptr, int index, uintptr_t widgetPtr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        QWidget *replaceWidget = instance->replaceWidget(index, widget);
        return reinterpret_cast<uintptr_t>(replaceWidget);
    }

    void nativeSplitterSetOrientation(uintptr_t ptr, int orientation)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        instance->setOrientation(Qt::Orientation(orientation));
    }

    int nativeSplitterOrientation(uintptr_t ptr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        return instance->orientation();
    }

    void nativeSplitterSetChildrenCollapsible(uintptr_t ptr, bool collapsible)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        instance->setChildrenCollapsible(collapsible);
    }

    bool nativeSplitterChildrenCollapsible(uintptr_t ptr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        return instance->childrenCollapsible();
    }

    void nativeSplitterSetCollapsible(uintptr_t ptr, int index, bool collapsible)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        instance->setCollapsible(index, collapsible);
    }

    bool nativeSplitterCollapsible(uintptr_t ptr, int index)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        return instance->isCollapsible(index);
    }

    void nativeSplitterSetOpaqueResize(uintptr_t ptr, bool resize)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        instance->setOpaqueResize(resize);
    }

    bool nativeSplitterOpaqueResize(uintptr_t ptr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        return instance->opaqueResize();
    }

    void nativeSplitterRefresh(uintptr_t ptr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        instance->refresh();
    }

    QSize nativeSplitterSizeHint(uintptr_t ptr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        // QSize size = instance->sizeHint();
        return instance->sizeHint();
    }

    QSize nativeSplitterMinimumSizeHint(uintptr_t ptr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        // QSize size = instance->minimumSizeHint();
        return instance->minimumSizeHint();
    }

    void nativeSplitterSetHandleWidth(uintptr_t ptr, int width)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        instance->setHandleWidth(width);
    }

    int nativeSplitterHandleWidth(uintptr_t ptr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        return instance->handleWidth();
    }

    int nativeSplitterIndexOf(uintptr_t ptr, uintptr_t widgetPtr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        return instance->indexOf(widget);
    }

    uintptr_t nativeSplitterWidget(uintptr_t ptr, int index)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = instance->widget(index);
        return reinterpret_cast<uintptr_t>(widget);
    }

    int nativeSplitterCount(uintptr_t ptr)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        return instance->count();
    }

    uintptr_t nativeSplitterHandle(uintptr_t ptr, int index)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        QSplitterHandle *handle = instance->handle(index);
        return reinterpret_cast<uintptr_t>(handle);
    }

    void nativeSplitterSetStretchFactor(uintptr_t ptr, int index, int stretch)
    {
        QSplitter *instance = reinterpret_cast<QSplitter *>(static_cast<uintptr_t>(ptr));
        instance->setStretchFactor(index, stretch);
    }
}