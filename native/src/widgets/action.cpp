#include "action.h"

extern "C"
{

	// QAction

	long nativeActionCreate(long parentPtr)
	{
		CjQtAction *label;
		if (parentPtr == 0L)
		{
			label = new CjQtAction();
		}
		else
		{
			QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
			label = new CjQtAction(parent);
		}
		return reinterpret_cast<long>(label);
	}

	void nativeActionSetStatusTip(long ptr, const char *tip)
	{
		QAction *instance = reinterpret_cast<QAction *>(static_cast<uintptr_t>(ptr));
		instance->setStatusTip(tip);
	}

	void nativeActionSetText(long ptr, const char *txte)
	{
		QAction *instance = reinterpret_cast<QAction *>(static_cast<uintptr_t>(ptr));
		instance->setText(txte);
	}

	void nativeActionSetCheckable(long ptr, bool checkable){
        QAction *instance = reinterpret_cast<QAction *>(static_cast<uintptr_t>(ptr));
        instance->setCheckable(checkable);
    }

    bool nativeActionIsCheckable(long ptr){
        QAction *instance = reinterpret_cast<QAction *>(static_cast<uintptr_t>(ptr));
        return instance->isCheckable();
    }

    void nativeActionSetChecked(long ptr, bool checked){
        QAction *instance = reinterpret_cast<QAction *>(static_cast<uintptr_t>(ptr));
        instance->setChecked(checked);
    }

    bool nativeActionIsChecked(long ptr){
        QAction *instance = reinterpret_cast<QAction *>(static_cast<uintptr_t>(ptr));
        return instance->isChecked();
    }

	void nativeActionConnectTriggered(long ptr, long code, nativeConnectCallbackBool callback)
    {
        QAction *instance = reinterpret_cast<QAction *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QAction::triggered, [=](bool result)
                         { callback(code, result); });
    }

	void nativeActionDelete(long ptr)
	{
		CjQtAction *instance = reinterpret_cast<CjQtAction *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}
}