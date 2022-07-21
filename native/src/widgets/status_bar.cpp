#include "status_bar.h"
#include <QAction>

extern "C"
{

    // QStatusBar

    long nativeStatusBarCreate(long parentPtr)
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
        return reinterpret_cast<long>(statusBar);
    }

    void nativeStatusBarDelete(long ptr)
    {
        CjQtStatusBar *instance = reinterpret_cast<CjQtStatusBar *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeStatusBarAddWidget(long ptr, long widgetPtr, int stretch)
    {
        QStatusBar *instance = reinterpret_cast<QStatusBar *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->addWidget(widget, stretch);
    }

    void nativeStatusBarInsertWidget(long ptr, int index, long widgetPtr, int stretch)
    {
        QStatusBar *instance = reinterpret_cast<QStatusBar *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->insertWidget(index, widget, stretch);
    }

    void nativeStatusBarAddPermanentWidget(long ptr, long widgetPtr, int stretch)
    {
        QStatusBar *instance = reinterpret_cast<QStatusBar *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->addPermanentWidget(widget, stretch);
    }

    void nativeStatusBarInsertPermanentWidget(long ptr, int index, long widgetPtr, int stretch)
    {
        QStatusBar *instance = reinterpret_cast<QStatusBar *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->insertPermanentWidget(index, widget, stretch);
    }

    void nativeStatusBarRemoveWidget(long ptr, long widgetPtr)
    {
        QStatusBar *instance = reinterpret_cast<QStatusBar *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->removeWidget(widget);
    }

    const char *nativeStatusBarCurrentMessage(long ptr)
    {
        QStatusBar *instance = reinterpret_cast<QStatusBar *>(static_cast<uintptr_t>(ptr));
        QString str = instance->currentMessage();
        return qstrdup(str.toUtf8());
    }

    void nativeStatusBarShowMessage(long ptr, const char *message, int timeout)
    {
        QStatusBar *instance = reinterpret_cast<QStatusBar *>(static_cast<uintptr_t>(ptr));
        instance->showMessage(message, timeout);
    }

    void nativeStatusBarClearMessage(long ptr)
    {
        QStatusBar *instance = reinterpret_cast<QStatusBar *>(static_cast<uintptr_t>(ptr));
        instance->clearMessage();
    }
}