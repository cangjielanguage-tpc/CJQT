#include "abstract_scroll_area.h"

extern "C"
{
    long nativeAbstractScrollAreaCreate(long parentPtr)
    {
        CjAbstractScrollArea *scrollArea;
        if (parentPtr == 0L)
        {
            scrollArea = new CjAbstractScrollArea();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            scrollArea = new CjAbstractScrollArea(parent);
        }
        return reinterpret_cast<long>(scrollArea);
    }

    void nativeAbstractScrollAreaDelete(long ptr)
    {
        CjAbstractScrollArea *instance = reinterpret_cast<CjAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeAbstractScrollAreaAddScrollBarWidget(long ptr, long widgetPtr, short alignment)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        return instance->addScrollBarWidget(widget, Qt::Alignment(alignment));
    }
    long nativeAbstractScrollAreaCornerWidget(long ptr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = instance->cornerWidget();
        return reinterpret_cast<long>(widget);
    }
    long nativeAbstractScrollAreaHorizontalScrollBar(long ptr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QScrollBar *srollBar = instance->horizontalScrollBar();
        return reinterpret_cast<long>(srollBar);
    }
    int nativeAbstractScrollAreaHorizontalScrollBarPolicy(long ptr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        return instance->horizontalScrollBarPolicy();
    }
    long nativeAbstractScrollAreaMaximumVieportSize(long ptr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QSize size = instance->maximumViewportSize();
        QSize *p = new QSize(size);
        return reinterpret_cast<long>(p);
    }
    QWidgetList nativeAbstractScrollAreaScrollBarWidgets(long ptr, short alignment)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        return instance->scrollBarWidgets(Qt::Alignment(alignment));
    }

    void nativeAbstractScrollAreaSetCornerWidget(long ptr, long widgetPtr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        return instance->setCornerWidget(widget);
    }
    void nativeAbstractScrollAreaSetHorizontalScrollBar(long ptr, long scrollBarPtr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QScrollBar *scrollBar = reinterpret_cast<QScrollBar *>(static_cast<uintptr_t>(scrollBarPtr));
        return instance->setHorizontalScrollBar(scrollBar);
    }
    void nativeAbstractScrollAreaSetHorizontalScrollBarPolicy(long ptr, int policy)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        return instance->setHorizontalScrollBarPolicy(Qt::ScrollBarPolicy(policy));
    }
    void nativeAbstractScrollAreaSetSizeAdjustPolicy(long ptr, int policy)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        return instance->setSizeAdjustPolicy(QAbstractScrollArea::SizeAdjustPolicy(policy));
    }
    void nativeAbstractScrollAreaSetVerticalScrollBar(long ptr, long scrollBarPtr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QScrollBar *scrollBar = reinterpret_cast<QScrollBar *>(static_cast<uintptr_t>(scrollBarPtr));
        return instance->setVerticalScrollBar(scrollBar);
    }
    void nativeAbstractScrollAreaSetVerticalScrollBarPolicy(long ptr, int policy)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        return instance->setVerticalScrollBarPolicy(Qt::ScrollBarPolicy(policy));
    }
    void nativeAbstractScrollAreaSetViewreport(long ptr, long widgetPtr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        return instance->setViewport(widget);
    }
    void nativeAbstractScrollAreaSetupViewport(long ptr, long viewportPtr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QWidget *viewport = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(viewportPtr));
        return instance->setupViewport(viewport);
    }
    int nativeAbstractScrollAreaSizeAdjustPolicy(long ptr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        return instance->sizeAdjustPolicy();
    }
    long nativeAbstractScrollAreaVerticalScrollBar(long ptr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QScrollBar *scrollbar = instance->verticalScrollBar();
        return reinterpret_cast<long>(scrollbar);
    }
    int nativeAbstractScrollAreaVerticalScrollBarPolicy(long ptr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        return instance->verticalScrollBarPolicy();
    }
    long nativeAbstractScrollAreaViewport(long ptr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = instance->viewport();
        return reinterpret_cast<long>(widget);
    }
    long nativeAbstractScrollAreaMinimumSizeHint(long ptr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QSize size = instance->minimumSizeHint();
        QSize *p = new QSize(size);
        return reinterpret_cast<long>(p);
    }
    long nativeAbstractScrollAreaSizeHint(long ptr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QSize size = instance->sizeHint();
        QSize *p = new QSize(size);
        return reinterpret_cast<long>(p);
    }
}