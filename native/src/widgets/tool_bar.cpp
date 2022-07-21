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

    long nativeToolBarAddAction(long ptr, long actionPtr)
    {
        QToolBar *instance = reinterpret_cast<QToolBar *>(static_cast<uintptr_t>(ptr));
        QAction *action = reinterpret_cast<QAction *>(static_cast<uintptr_t>(actionPtr));
        instance->addAction(action);
    }

}