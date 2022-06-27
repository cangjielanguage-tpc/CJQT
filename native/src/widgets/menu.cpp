#include "menu.h"

extern "C"
{

	// QMenu

    long nativeMenuCreate(long appPtr, long parentPtr)
	{

		CjQtMenu *menu;
        if (parentPtr == 0L){
            menu = new CjQtMenu();
        } else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            menu = new CjQtMenu(parent);
        }
		return reinterpret_cast<long>(menu);
	}

    void nativeMenuSetTitle(long ptr, const char *title){
        QMenu *instance = reinterpret_cast<QMenu *>(static_cast<uintptr_t>(ptr));
        instance->setTitle(title);
    }

    long nativeMenuMenuAction(long ptr){
        QMenu *instance = reinterpret_cast<QMenu *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<long>(instance->menuAction());
    }

    void nativeMenuAddSeparator(long ptr){
        QMenu *instance = reinterpret_cast<QMenu *>(static_cast<uintptr_t>(ptr));
        instance->addSeparator();
    }

    void nativeMenuAddAction(long ptr, const char *action){
        QMenu *instance = reinterpret_cast<QMenu *>(static_cast<uintptr_t>(ptr));
        instance->addAction(action);
    }

    void nativeMenuAddActionPtr(long ptr, long actionPtr){
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