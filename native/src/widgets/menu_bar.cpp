#include "menu_bar.h"
#include <QAction>

extern "C"
{

    // QMenuBar

    uintptr_t nativeMenuBarCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        CjQtMenuBar *menuBar;
        if (parentPtr == 0L)
        {
            menuBar = new CjQtMenuBar();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            menuBar = new CjQtMenuBar(parent);
        }
        return reinterpret_cast<uintptr_t>(menuBar);
    }

    uintptr_t nativeMenuBarAddActionStr(uintptr_t ptr, const char *action)
    {
        QMenuBar *instance = reinterpret_cast<QMenuBar *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(instance->addAction(action));
    }

    void nativeMenuBarAddAction(uintptr_t ptr, uintptr_t actionPtr)
    {
        QMenuBar *instance = reinterpret_cast<QMenuBar *>(static_cast<uintptr_t>(ptr));
        QAction *action = reinterpret_cast<QAction *>(static_cast<uintptr_t>(actionPtr));
        instance->addAction(action);
    }

    uintptr_t nativeMenuBarAddMenuStr(uintptr_t ptr, const char *menu)
    {
        QMenuBar *instance = reinterpret_cast<QMenuBar *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(instance->addMenu(menu));
    }

    uintptr_t nativeMenuBarAddMenuStrIcon(uintptr_t ptr, uintptr_t iconPtr, const char *action)
    {
        QMenuBar *instance = reinterpret_cast<QMenuBar *>(static_cast<uintptr_t>(ptr));
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        return reinterpret_cast<uintptr_t>(instance->addMenu(*icon, action));
    }

    uintptr_t nativeMenuBarAddMenu(uintptr_t ptr, uintptr_t menuPtr)
    {
        QMenuBar *instance = reinterpret_cast<QMenuBar *>(static_cast<uintptr_t>(ptr));
        QMenu *menu = reinterpret_cast<QMenu *>(static_cast<uintptr_t>(menuPtr));
        return reinterpret_cast<uintptr_t>(instance->addMenu(menu));
    }

    void nativeMenuBarDelete(uintptr_t ptr)
    {
        CjQtMenuBar *instance = reinterpret_cast<CjQtMenuBar *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}