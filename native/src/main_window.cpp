#include <QMainWindow>

extern "C"
{

	// QMainWindow

	long nativeMainWindowCreate()
	{
		QMainWindow *win = new QMainWindow();
		win->show();
		win->hide();
		return reinterpret_cast<long>(win);
	}

	void nativeMainWindowDelete(long ptr)
	{
		QMainWindow *instance = reinterpret_cast<QMainWindow *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}
}