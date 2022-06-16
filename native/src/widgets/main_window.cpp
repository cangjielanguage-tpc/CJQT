#include "main_window.h"

extern "C"
{

	// QMainWindow

	long nativeMainWindowCreate(long appPtr, long parentPtr)
	{
		CjQtMainWindow *win;
        if (parentPtr == 0L){
            win = new CjQtMainWindow();
        } else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            win = new CjQtMainWindow(parent);
        }
		return reinterpret_cast<long>(win);
	}

	void nativeMainWindowSetCentralWidget(long ptr, long widgetPtr)
    {
        QMainWindow *instance = reinterpret_cast<QMainWindow *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        instance->setCentralWidget(widget);
    }

	void nativeMainWindowDelete(long ptr)
	{
		CjQtMainWindow *instance = reinterpret_cast<CjQtMainWindow *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}
}