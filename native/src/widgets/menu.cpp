#include "menu.h"

extern "C"
{

    // QMenu

    long nativeMenuCreate(long parentPtr)
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
        return reinterpret_cast<long>(menu);
    }

    void nativeMenuSetTitle(long ptr, const char *title)
    {
        QMenu *instance = reinterpret_cast<QMenu *>(static_cast<uintptr_t>(ptr));
        instance->setTitle(title);
    }

    long nativeMenuMenuAction(long ptr)
    {
        QMenu *instance = reinterpret_cast<QMenu *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<long>(instance->menuAction());
    }

    void nativeMenuAddSeparator(long ptr)
    {
        QMenu *instance = reinterpret_cast<QMenu *>(static_cast<uintptr_t>(ptr));
        instance->addSeparator();
    }

    long nativeMenuAddAction(long ptr, const char *action)
    {
        QMenu *instance = reinterpret_cast<QMenu *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<long>(instance->addAction(action));
    }

    long nativeMenuAddActionStrIcon(long ptr, long iconPtr, const char *action)
    {
        QMenu *instance = reinterpret_cast<QMenu *>(static_cast<uintptr_t>(ptr));
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        return reinterpret_cast<long>(instance->addAction(*icon, action));
    }

    void nativeMenuAddActionPtr(long ptr, long actionPtr)
    {
        QMenu *instance = reinterpret_cast<QMenu *>(static_cast<uintptr_t>(ptr));
        QAction *action = reinterpret_cast<QAction *>(static_cast<uintptr_t>(actionPtr));
        instance->addAction(action);
    }

    void nativeMenuDelete(long ptr)
    {
        CjQtMenu *instance = reinterpret_cast<CjQtMenu *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}