#include "status_bar.h"
#include <QAction>

extern "C"
{

    // QStatusBar

    uintptr_t nativeStatusBarCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        CjQtStatusBar *statusBar;
        if (parentPtr == 0L)
        {
            statusBar = new CjQtStatusBar();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            statusBar = new CjQtStatusBar(parent);
        }
        return reinterpret_cast<uintptr_t>(statusBar);
    }

    void nativeStatusBarDelete(uintptr_t ptr)
    {
        CjQtStatusBar *instance = reinterpret_cast<CjQtStatusBar *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeStatusBarAddWidget(uintptr_t ptr, uintptr_t widgetPtr, int stretch)
    {
        QStatusBar *instance = reinterpret_cast<QStatusBar *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->addWidget(widget, stretch);
    }

    void nativeStatusBarInsertWidget(uintptr_t ptr, int index, uintptr_t widgetPtr, int stretch)
    {
        QStatusBar *instance = reinterpret_cast<QStatusBar *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->insertWidget(index, widget, stretch);
    }

    void nativeStatusBarAddPermanentWidget(uintptr_t ptr, uintptr_t widgetPtr, int stretch)
    {
        QStatusBar *instance = reinterpret_cast<QStatusBar *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->addPermanentWidget(widget, stretch);
    }

    void nativeStatusBarInsertPermanentWidget(uintptr_t ptr, int index, uintptr_t widgetPtr, int stretch)
    {
        QStatusBar *instance = reinterpret_cast<QStatusBar *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->insertPermanentWidget(index, widget, stretch);
    }

    void nativeStatusBarRemoveWidget(uintptr_t ptr, uintptr_t widgetPtr)
    {
        QStatusBar *instance = reinterpret_cast<QStatusBar *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->removeWidget(widget);
    }

    const char *nativeStatusBarCurrentMessage(uintptr_t ptr)
    {
        QStatusBar *instance = reinterpret_cast<QStatusBar *>(static_cast<uintptr_t>(ptr));
        QString str = instance->currentMessage();
        return qstrdup(str.toUtf8());
    }

    void nativeStatusBarShowMessage(uintptr_t ptr, const char *message, int timeout)
    {
        QStatusBar *instance = reinterpret_cast<QStatusBar *>(static_cast<uintptr_t>(ptr));
        instance->showMessage(message, timeout);
    }

    void nativeStatusBarClearMessage(uintptr_t ptr)
    {
        QStatusBar *instance = reinterpret_cast<QStatusBar *>(static_cast<uintptr_t>(ptr));
        instance->clearMessage();
    }
}