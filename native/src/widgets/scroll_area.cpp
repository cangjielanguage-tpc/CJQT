#include "scroll_area.h"

extern "C"
{

    // QScrollArea
    uintptr_t nativeScrollAreaCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        CjQtScrollArea *scrollArea;
        if (parentPtr == 0L)
        {
            scrollArea = new CjQtScrollArea();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            scrollArea = new CjQtScrollArea(parent);
        }
        return reinterpret_cast<uintptr_t>(scrollArea);
    }

    void nativeScrollAreaDelete(uintptr_t ptr)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeScrollAreaSetWidget(uintptr_t ptr, uintptr_t widgetPtr)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->setWidget(widget);
    }

    uintptr_t nativeScrollAreaWidget(uintptr_t ptr)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = instance->widget();
        return reinterpret_cast<uintptr_t>(widget);
    }

    uintptr_t nativeScrollAreaTakeWidget(uintptr_t ptr)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = instance->takeWidget();
        return reinterpret_cast<uintptr_t>(widget);
    }

    bool nativeScrollAreaWidgetResizable(uintptr_t ptr)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        return instance->widgetResizable();
    }

    void nativeScrollAreaSetWidgetResizable(uintptr_t ptr, bool resizable)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        instance->setWidgetResizable(resizable);
    }

    uintptr_t nativeScrollAreaSizeHint(uintptr_t ptr)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        QSize size = instance->sizeHint();
        return reinterpret_cast<uintptr_t>(&size);
    }

    bool nativeScrollAreaFocusNextPrevChild(uintptr_t ptr, bool next)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        return instance->focusNextPrevChild(next);
    }

    int nativeScrollAreaAlignment(uintptr_t ptr)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        return instance->alignment();
    }

    void nativeScrollAreaSetAlignment(uintptr_t ptr, int alignment)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        instance->setAlignment(Qt::Alignment(alignment));
    }

    void nativeScrollAreaEnsureVisible(uintptr_t ptr, int x, int y, int xmargin, int ymargin)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        instance->ensureVisible(x, y, xmargin, ymargin);
    }

    void nativeScrollAreaEnsureWidgetVisible(uintptr_t ptr, uintptr_t childWidgetPtr, int xmargin, int ymargin)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        QWidget *childWidget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(childWidgetPtr));
        instance->ensureWidgetVisible(childWidget, xmargin, ymargin);
    }
}