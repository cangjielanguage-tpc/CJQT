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

    void nativeMenuBarAddAction(long ptr, const char *action){
        QMenuBar *instance = reinterpret_cast<QMenuBar *>(static_cast<uintptr_t>(ptr));
        instance->addAction(action);
    }

    void nativeMenuBarAddActionPtr(long ptr, long actionPtr){
        QMenuBar *instance = reinterpret_cast<QMenuBar *>(static_cast<uintptr_t>(ptr));
        QAction *action = reinterpret_cast<QAction *>(static_cast<uintptr_t>(actionPtr));
        instance->addAction(action);
    }

    /* void nativeMenuBarAddActions(long ptr, const char *action){
        QMenuBar *instance = reinterpret_cast<QMenuBar *>(static_cast<uintptr_t>(ptr));
        instance->addActions(action);
    } */

	void nativeMenuBarDelete(long ptr)
	{
		CjQtMenuBar *instance = reinterpret_cast<CjQtMenuBar *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}
}