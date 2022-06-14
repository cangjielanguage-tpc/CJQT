#include <QApplication>
#include "widget.h"

#include <sys/types.h>
#include <unistd.h>

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
	long nativeApplicationCreate()
	{
		int argc = 0;
		char *argv[0];
		register_meta_types();
		QApplication *app = new QApplication(argc, argv);
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
		QApplication *instance = reinterpret_cast<QApplication *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}
}