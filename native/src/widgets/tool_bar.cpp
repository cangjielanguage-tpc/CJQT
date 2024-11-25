#include "tool_bar.h"
#include <QAction>
#include <QIcon>

extern "C"
{

    // QToolBar

    uintptr_t nativeToolBarCreate(uintptr_t parentPtr)
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
        return reinterpret_cast<uintptr_t>(toolBar);
    }

    void nativeToolBarDelete(uintptr_t ptr)
    {
        CjQtToolBar *instance = reinterpret_cast<CjQtToolBar *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    uintptr_t nativeToolBarAddActionStr(uintptr_t ptr, const char *action)
    {
        QToolBar *instance = reinterpret_cast<QToolBar *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(instance->addAction(action));
    }

    uintptr_t nativeToolBarAddActionStrIcon(uintptr_t ptr, uintptr_t iconPtr, const char *action)
    {
        QToolBar *instance = reinterpret_cast<QToolBar *>(static_cast<uintptr_t>(ptr));
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        return reinterpret_cast<uintptr_t>(instance->addAction(*icon, action));
    }

    void nativeToolBarAddAction(uintptr_t ptr, uintptr_t actionPtr)
    {
        QToolBar *instance = reinterpret_cast<QToolBar *>(static_cast<uintptr_t>(ptr));
        QAction *action = reinterpret_cast<QAction *>(static_cast<uintptr_t>(actionPtr));
        instance->addAction(action);
    }

    uintptr_t nativeToolBarAddSeparator(uintptr_t ptr)
    {
        QToolBar *instance = reinterpret_cast<QToolBar *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(instance->addSeparator());
    }

    uintptr_t nativeToolBarInsertSeparator(uintptr_t ptr, uintptr_t actionPtr)
    {
        QToolBar *instance = reinterpret_cast<QToolBar *>(static_cast<uintptr_t>(ptr));
        QAction *action = reinterpret_cast<QAction *>(static_cast<uintptr_t>(actionPtr));
        return reinterpret_cast<uintptr_t>(instance->insertSeparator(action));
    }

    uintptr_t nativeToolBarAddWidget(uintptr_t ptr, uintptr_t widgetPtr)
    {
        QToolBar *instance = reinterpret_cast<QToolBar *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        return reinterpret_cast<uintptr_t>(instance->addWidget(widget));
    }

    uintptr_t nativeToolBarInsertWidget(uintptr_t ptr, uintptr_t actionPtr, uintptr_t widgetPtr)
    {
        QToolBar *instance = reinterpret_cast<QToolBar *>(static_cast<uintptr_t>(ptr));
        QAction *action = reinterpret_cast<QAction *>(static_cast<uintptr_t>(actionPtr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        return reinterpret_cast<uintptr_t>(instance->insertWidget(action, widget));
    }

}