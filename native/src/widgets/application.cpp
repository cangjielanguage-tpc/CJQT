#include <QApplication>
#include <mutex>
#include "widget.h"

#include <sys/types.h>
#include <unistd.h>
#include "main_window.h"
#include "menu_bar.h"
#include "application.h"
#include<QDebug>

namespace
{
	void register_meta_types()
	{
		qRegisterMetaType<QVector<int>>();
	}

	std::mutex g_appMutex;
}

// thread-safe application ensure: constructs QApplication on first use
void cjqt_application_ensure()
{
	std::lock_guard<std::mutex> lock(g_appMutex);
	if (appConfig != nullptr && appConfig->appInit && appConfig->app == nullptr)
	{
		appConfig->app = new QApplication(appConfig->argc, appConfig->argv);
	}
}

// QApplication

extern "C"
{

	void nativeApplicationInit()
	{
		std::lock_guard<std::mutex> lock(g_appMutex);
		register_meta_types();
		if (appConfig == nullptr){
			appConfig = new Config();
			appConfig->appInit = true;
		}
	}

	void nativeApplicationInitWithArg(int argc, char *argv[])
	{
		std::lock_guard<std::mutex> lock(g_appMutex);
		register_meta_types();
		if (appConfig != nullptr){
			delete appConfig;
			appConfig = nullptr;
		}
		appConfig = new Config();
		appConfig->appInit = true;
		appConfig->argc = argc;
		appConfig->argv = argv;
	}

	bool nativeApplicationExec()
	{
		if (appConfig != nullptr && appConfig->app != nullptr){
			return appConfig->app->exec();
		}
		return false;
	}

	bool nativeApplicationIsCreate()
	{
		return appConfig != nullptr && appConfig->app != nullptr;
	}

	void nativeApplicationBeep()
    {
        if (appConfig != nullptr && appConfig->app != nullptr){
            appConfig->app->beep();
            appConfig->app->primaryScreen();
        }
	}

    uintptr_t nativeApplicationPrimaryScreen(){
        if (appConfig != nullptr && appConfig->app != nullptr){
            return reinterpret_cast<uintptr_t>(appConfig->app->primaryScreen());
        }
        return 0;

    }

	void nativeApplicationQuit()
	{
		if (appConfig != nullptr && appConfig->app != nullptr){
			appConfig->app->quit();
		}
	}

	void nativeApplicationDelete()
	{
		std::lock_guard<std::mutex> lock(g_appMutex);
		if (appConfig == nullptr){
			return;
		}
		if (appConfig->app != nullptr){
			delete appConfig->app;
			appConfig->app = nullptr;
		}
		delete appConfig;
		appConfig = nullptr;
	}
}
