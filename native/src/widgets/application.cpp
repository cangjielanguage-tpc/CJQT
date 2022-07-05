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

	void nativeApplicationInit()
	{
		register_meta_types();
		appConfig = new Config();
		appConfig->appInit = true;
	}

	void nativeApplicationInitWithArg(int argc, char *argv[])
	{
		register_meta_types();
		appConfig = new Config();
		appConfig->appInit = true;
		appConfig->argc = argc;
		appConfig->argv = argv;
	}

	bool nativeApplicationExec()
	{
		if (appConfig->app != nullptr){
			return appConfig->app->exec();
		}
		return false;
	}

	void nativeApplicationDelete()
	{
		delete appConfig;
		if (appConfig->app != nullptr){
			delete appConfig->app;
		}
	}
}