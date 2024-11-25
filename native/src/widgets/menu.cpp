#include "menu.h"

extern "C"
{

    // QMenu

    uintptr_t nativeMenuCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        CjQtMenu *menu;
        if (parentPtr == 0L)
        {
            menu = new CjQtMenu();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            menu = new CjQtMenu(parent);
        }
        return reinterpret_cast<uintptr_t>(menu);
    }

    void nativeMenuSetTitle(uintptr_t ptr, const char *title)
    {
        QMenu *instance = reinterpret_cast<QMenu *>(static_cast<uintptr_t>(ptr));
        instance->setTitle(title);
    }

    uintptr_t nativeMenuMenuAction(uintptr_t ptr)
    {
        QMenu *instance = reinterpret_cast<QMenu *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(instance->menuAction());
    }

    void nativeMenuAddSeparator(uintptr_t ptr)
    {
        QMenu *instance = reinterpret_cast<QMenu *>(static_cast<uintptr_t>(ptr));
        instance->addSeparator();
    }

    uintptr_t nativeMenuAddAction(uintptr_t ptr, const char *action)
    {
        QMenu *instance = reinterpret_cast<QMenu *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(instance->addAction(action));
    }

    uintptr_t nativeMenuAddActionStrIcon(uintptr_t ptr, uintptr_t iconPtr, const char *action)
    {
        QMenu *instance = reinterpret_cast<QMenu *>(static_cast<uintptr_t>(ptr));
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        return reinterpret_cast<uintptr_t>(instance->addAction(*icon, action));
    }

    void nativeMenuAddActionPtr(uintptr_t ptr, uintptr_t actionPtr)
    {
        QMenu *instance = reinterpret_cast<QMenu *>(static_cast<uintptr_t>(ptr));
        QAction *action = reinterpret_cast<QAction *>(static_cast<uintptr_t>(actionPtr));
        instance->addAction(action);
    }

    void nativeMenuDelete(uintptr_t ptr)
    {
        CjQtMenu *instance = reinterpret_cast<CjQtMenu *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}