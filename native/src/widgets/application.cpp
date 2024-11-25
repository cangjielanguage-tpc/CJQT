#include <QApplication>
#include "widget.h"

#include <sys/types.h>
#include <unistd.h>
#include "main_window.h"
#include "menu_bar.h"
#include "application.h"

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

	bool nativeApplicationIsCreate()
	{
		return appConfig->app != nullptr;
	}

	void nativeApplicationQuit()
	{
		if (appConfig->app != nullptr){
			appConfig->app->quit();
		}
	}

	void nativeApplicationDelete()
	{
		delete appConfig;
		if (appConfig->app != nullptr){
			delete appConfig->app;
		}
	}
}
