#include "main_window.h"

extern "C"
{

	// QMainWindow

	long nativeMainWindowCreate(long appPtr, long parentPtr)
	{
		CjQtMainWindow *win;
        if (parentPtr == 0L){
            win = new CjQtMainWindow();
			win->show();
			win->hide();
        } else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            win = new CjQtMainWindow(parent);
        }
		return reinterpret_cast<long>(win);
	}

	void nativeMainWindowDelete(long ptr)
	{
		CjQtMainWindow *instance = reinterpret_cast<CjQtMainWindow *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}
}