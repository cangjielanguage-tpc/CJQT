#include "tool_bar.h"
#include <QAction>
#include <QIcon>

extern "C"
{

    // QToolBar

    long nativeToolBarCreate(long parentPtr)
    {
        APPLICATION_CREATE
        CjQtToolBar *toolBar;
        if (parentPtr == 0L)
        {
            toolBar = new CjQtToolBar();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            toolBar = new CjQtToolBar(parent);
        }
        return reinterpret_cast<long>(toolBar);
    }

    void nativeToolBarDelete(long ptr)
    {
        CjQtToolBar *instance = reinterpret_cast<CjQtToolBar *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    long nativeToolBarAddActionStr(long ptr, const char *action)
    {
        QToolBar *instance = reinterpret_cast<QToolBar *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<long>(instance->addAction(action));
    }

    long nativeToolBarAddActionStrIcon(long ptr, long iconPtr, const char *action)
    {
        QToolBar *instance = reinterpret_cast<QToolBar *>(static_cast<uintptr_t>(ptr));
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        return reinterpret_cast<long>(instance->addAction(*icon, action));
    }

    void nativeToolBarAddAction(long ptr, long actionPtr)
    {
        QToolBar *instance = reinterpret_cast<QToolBar *>(static_cast<uintptr_t>(ptr));
        QAction *action = reinterpret_cast<QAction *>(static_cast<uintptr_t>(actionPtr));
        instance->addAction(action);
    }

    long nativeToolBarAddSeparator(long ptr)
    {
        QToolBar *instance = reinterpret_cast<QToolBar *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<long>(instance->addSeparator());
    }

    long nativeToolBarInsertSeparator(long ptr, long actionPtr)
    {
        QToolBar *instance = reinterpret_cast<QToolBar *>(static_cast<uintptr_t>(ptr));
        QAction *action = reinterpret_cast<QAction *>(static_cast<uintptr_t>(actionPtr));
        return reinterpret_cast<long>(instance->insertSeparator(action));
    }

    long nativeToolBarAddWidget(long ptr, long widgetPtr)
    {
        QToolBar *instance = reinterpret_cast<QToolBar *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        return reinterpret_cast<long>(instance->addWidget(widget));
    }

    long nativeToolBarInsertWidget(long ptr, long actionPtr, long widgetPtr)
    {
        QToolBar *instance = reinterpret_cast<QToolBar *>(static_cast<uintptr_t>(ptr));
        QAction *action = reinterpret_cast<QAction *>(static_cast<uintptr_t>(actionPtr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        return reinterpret_cast<long>(instance->insertWidget(action, widget));
    }

}