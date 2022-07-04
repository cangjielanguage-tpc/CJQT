#include "menu_bar.h"
#include <QAction>

extern "C"
{

	// QMenuBar

    long nativeMenuBarCreate(long appPtr, long parentPtr)
	{

		CjQtMenuBar *menuBar;
        if (parentPtr == 0L){
            menuBar = new CjQtMenuBar();
        } else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            menuBar = new CjQtMenuBar(parent);
        }
		return reinterpret_cast<long>(menuBar);
	}

    void nativeMenuBarAddActionStr(long ptr, const char *action){
        QMenuBar *instance = reinterpret_cast<QMenuBar *>(static_cast<uintptr_t>(ptr));
        instance->addAction(action);
    }

    void nativeMenuBarAddAction(long ptr, long actionPtr){
        QMenuBar *instance = reinterpret_cast<QMenuBar *>(static_cast<uintptr_t>(ptr));
        QAction *action = reinterpret_cast<QAction *>(static_cast<uintptr_t>(actionPtr));
        instance->addAction(action);
    }

    long nativeMenuBarAddMenuStr(long ptr, const char *menu){
        QMenuBar *instance = reinterpret_cast<QMenuBar *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<long>(instance->addMenu(menu));
    }

    long nativeMenuBarAddMenu(long ptr, long menuPtr){
        QMenuBar *instance = reinterpret_cast<QMenuBar *>(static_cast<uintptr_t>(ptr));
        QMenu *menu = reinterpret_cast<QMenu *>(static_cast<uintptr_t>(menuPtr));
        return reinterpret_cast<long>(instance->addMenu(menu));
    }

	void nativeMenuBarDelete(long ptr)
	{
		CjQtMenuBar *instance = reinterpret_cast<CjQtMenuBar *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}
}