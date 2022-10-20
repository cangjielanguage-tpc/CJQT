#include "scroll_area.h"

extern "C"
{

    // QScrollArea
    long nativeScrollAreaCreate(long parentPtr)
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
        return reinterpret_cast<long>(scrollArea);
    }

    void nativeScrollAreaDelete(long ptr)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeScrollAreaSetWidget(long ptr, long widgetPtr)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->setWidget(widget);
    }

    long nativeScrollAreaWidget(long ptr)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = instance->widget();
        return reinterpret_cast<long>(widget);
    }

    long nativeScrollAreaTakeWidget(long ptr)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = instance->takeWidget();
        return reinterpret_cast<long>(widget);
    }

    bool nativeScrollAreaWidgetResizable(long ptr)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        return instance->widgetResizable();
    }

    void nativeScrollAreaSetWidgetResizable(long ptr, bool resizable)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        instance->setWidgetResizable(resizable);
    }

    long nativeScrollAreaSizeHint(long ptr)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        QSize size = instance->sizeHint();
        return reinterpret_cast<long>(&size);
    }

    bool nativeScrollAreaFocusNextPrevChild(long ptr, bool next)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        return instance->focusNextPrevChild(next);
    }

    int nativeScrollAreaAlignment(long ptr)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        return instance->alignment();
    }

    void nativeScrollAreaSetAlignment(long ptr, int alignment)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        instance->setAlignment(Qt::Alignment(alignment));
    }

    void nativeScrollAreaEnsureVisible(long ptr, int x, int y, int xmargin, int ymargin)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        instance->ensureVisible(x, y, xmargin, ymargin);
    }

    void nativeScrollAreaEnsureWidgetVisible(long ptr, long childWidgetPtr, int xmargin, int ymargin)
    {
        CjQtScrollArea *instance = reinterpret_cast<CjQtScrollArea *>(static_cast<uintptr_t>(ptr));
        QWidget *childWidget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(childWidgetPtr));
        instance->ensureWidgetVisible(childWidget, xmargin, ymargin);
    }
}