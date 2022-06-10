#include <QApplication>

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
		return reinterpret_cast<long>(new QApplication(argc, argv));
	}

	long nativeApplicationCreateWithArg(int argc, char *argv[])
	{
		return reinterpret_cast<long>(new QApplication(argc, argv));
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