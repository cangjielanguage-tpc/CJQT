#include "main_window.h"

extern "C"
{

	// QMainWindow

	long nativeMainWindowCreate(long appPtr)
	{
		CjQtMainWindow *win = new CjQtMainWindow();
		win->show();
		win->hide();
		return reinterpret_cast<long>(win);
	}

	void nativeMainWindowDelete(long ptr)
	{
		CjQtMainWindow *instance = reinterpret_cast<CjQtMainWindow *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}
}