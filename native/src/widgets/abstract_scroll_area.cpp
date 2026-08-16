#include "abstract_scroll_area.h"
#include "object.h"

extern "C"
{
    uintptr_t nativeAbstractScrollAreaCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
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
        return reinterpret_cast<uintptr_t>(scrollArea);
    }

    void nativeAbstractScrollAreaDelete(uintptr_t ptr)
    {
        CjAbstractScrollArea *instance = reinterpret_cast<CjAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeAbstractScrollAreaAddScrollBarWidget(uintptr_t ptr, uintptr_t widgetPtr, short alignment)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        return instance->addScrollBarWidget(widget, Qt::Alignment(alignment));
    }
    uintptr_t nativeAbstractScrollAreaCornerWidget(uintptr_t ptr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = instance->cornerWidget();
        return reinterpret_cast<uintptr_t>(widget);
    }
    uintptr_t nativeAbstractScrollAreaHorizontalScrollBar(uintptr_t ptr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QScrollBar *srollBar = instance->horizontalScrollBar();
        return reinterpret_cast<uintptr_t>(srollBar);
    }
    int nativeAbstractScrollAreaHorizontalScrollBarPolicy(uintptr_t ptr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        return instance->horizontalScrollBarPolicy();
    }
    uintptr_t nativeAbstractScrollAreaMaximumVieportSize(uintptr_t ptr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QSize size = instance->maximumViewportSize();
        QSize *p = new QSize(size);
        return reinterpret_cast<uintptr_t>(p);
    }
    QWidgetList nativeAbstractScrollAreaScrollBarWidgets(uintptr_t ptr, short alignment)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        return instance->scrollBarWidgets(Qt::Alignment(alignment));
    }

    void nativeAbstractScrollAreaSetCornerWidget(uintptr_t ptr, uintptr_t widgetPtr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        return instance->setCornerWidget(widget);
    }
    void nativeAbstractScrollAreaSetHorizontalScrollBar(uintptr_t ptr, uintptr_t scrollBarPtr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QScrollBar *scrollBar = reinterpret_cast<QScrollBar *>(static_cast<uintptr_t>(scrollBarPtr));
        return instance->setHorizontalScrollBar(scrollBar);
    }
    void nativeAbstractScrollAreaSetHorizontalScrollBarPolicy(uintptr_t ptr, int policy)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        return instance->setHorizontalScrollBarPolicy(Qt::ScrollBarPolicy(policy));
    }
    void nativeAbstractScrollAreaSetSizeAdjustPolicy(uintptr_t ptr, int policy)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        return instance->setSizeAdjustPolicy(QAbstractScrollArea::SizeAdjustPolicy(policy));
    }
    void nativeAbstractScrollAreaSetVerticalScrollBar(uintptr_t ptr, uintptr_t scrollBarPtr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QScrollBar *scrollBar = reinterpret_cast<QScrollBar *>(static_cast<uintptr_t>(scrollBarPtr));
        return instance->setVerticalScrollBar(scrollBar);
    }
    void nativeAbstractScrollAreaSetVerticalScrollBarPolicy(uintptr_t ptr, int policy)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        return instance->setVerticalScrollBarPolicy(Qt::ScrollBarPolicy(policy));
    }
    void nativeAbstractScrollAreaSetViewreport(uintptr_t ptr, uintptr_t widgetPtr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        return instance->setViewport(widget);
    }
    void nativeAbstractScrollAreaSetupViewport(uintptr_t ptr, uintptr_t viewportPtr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QWidget *viewport = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(viewportPtr));
        return instance->setupViewport(viewport);
    }
    int nativeAbstractScrollAreaSizeAdjustPolicy(uintptr_t ptr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        return instance->sizeAdjustPolicy();
    }
    uintptr_t nativeAbstractScrollAreaVerticalScrollBar(uintptr_t ptr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QScrollBar *scrollbar = instance->verticalScrollBar();
        return reinterpret_cast<uintptr_t>(scrollbar);
    }
    int nativeAbstractScrollAreaVerticalScrollBarPolicy(uintptr_t ptr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        return instance->verticalScrollBarPolicy();
    }
    uintptr_t nativeAbstractScrollAreaViewport(uintptr_t ptr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = instance->viewport();
        return reinterpret_cast<uintptr_t>(widget);
    }
    uintptr_t nativeAbstractScrollAreaMinimumSizeHint(uintptr_t ptr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QSize size = instance->minimumSizeHint();
        QSize *p = new QSize(size);
        return reinterpret_cast<uintptr_t>(p);
    }
    uintptr_t nativeAbstractScrollAreaSizeHint(uintptr_t ptr)
    {
        QAbstractScrollArea *instance = reinterpret_cast<QAbstractScrollArea *>(static_cast<uintptr_t>(ptr));
        QSize size = instance->sizeHint();
        QSize *p = new QSize(size);
        return reinterpret_cast<uintptr_t>(p);
    }
}