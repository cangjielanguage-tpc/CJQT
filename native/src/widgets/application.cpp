#include <QApplication>
#include "widget.h"

#include <sys/types.h>
#include <unistd.h>
#include "main_window.h"
#include "menu_bar.h"

namespace
{
	void register_meta_types()
	{
		qRegisterMetaType<QVector<int>>();
	}
}

// QApplication

extern "C"
{
	Config *appConfig;

	long nativeApplicationCreate()
	{
		int argc = 0;
		char *argv[0];
		register_meta_types();
		QApplication *app = new QApplication(argc, argv);
		appConfig = new Config();

		/*long winPtr = nativeMainWindowCreate(reinterpret_cast<long>(app), 0);
		long barPtr = nativeMainWindowMenuBar(winPtr);
		long menuPtr = nativeMenuBarAddMenuStr(barPtr, "menu");
		nativeWidgetResize(winPtr, 400, 300);
		nativeWidgetShow(winPtr); */

		return reinterpret_cast<long>(app);
	}

	long nativeApplicationCreateWithArg(int argc, char *argv[])
	{
		register_meta_types();
		QApplication *app = new QApplication(argc, argv);
		return reinterpret_cast<long>(app);
	}

	bool nativeApplicationExec(long ptr)
	{
		QApplication *instance = reinterpret_cast<QApplication *>(static_cast<uintptr_t>(ptr));
		return instance->exec();
	}

	void nativeApplicationDelete(long ptr)
	{
		delete appConfig;
		QApplication *instance = reinterpret_cast<QApplication *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}
}