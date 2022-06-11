#include <QMainWindow>

extern "C"
{

	// QMainWindow

	long nativeMainWindowCreate()
	{
		QMainWindow *win = new QMainWindow();
		win->show();
		return reinterpret_cast<long>(win);
	}

	void nativeMainWindowResize(long ptr, int w, int h)
	{
		QMainWindow *instance = reinterpret_cast<QMainWindow *>(static_cast<uintptr_t>(ptr));
		instance->resize(w, h);
	}

	void nativeMainWindowShow(long ptr)
	{
		QMainWindow *instance = reinterpret_cast<QMainWindow *>(static_cast<uintptr_t>(ptr));
		instance->show();
	}

	void nativeMainWindowHide(long ptr)
	{
		QMainWindow *instance = reinterpret_cast<QMainWindow *>(static_cast<uintptr_t>(ptr));
		instance->hide();
	}

	void nativeMainWindowShowMinimized(long ptr)
	{
		QMainWindow *instance = reinterpret_cast<QMainWindow *>(static_cast<uintptr_t>(ptr));
		instance->showMinimized();
	}

	void nativeMainWindowShowMaximized(long ptr)
	{
		QMainWindow *instance = reinterpret_cast<QMainWindow *>(static_cast<uintptr_t>(ptr));
		instance->showMaximized();
	}

	void nativeMainWindowShowFullScreen(long ptr)
	{
		QMainWindow *instance = reinterpret_cast<QMainWindow *>(static_cast<uintptr_t>(ptr));
		instance->showFullScreen();
	}

	void nativeMainWindowShowNormal(long ptr)
	{
		QMainWindow *instance = reinterpret_cast<QMainWindow *>(static_cast<uintptr_t>(ptr));
		instance->showNormal();
	}

	void nativeMainWindowClose(long ptr)
	{
		QMainWindow *instance = reinterpret_cast<QMainWindow *>(static_cast<uintptr_t>(ptr));
		instance->close();
	}

	void nativeMainWindowDelete(long ptr)
	{
		QMainWindow *instance = reinterpret_cast<QMainWindow *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}
}