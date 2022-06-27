#include "action.h"

extern "C"
{

	// QAction

	long nativeActionCreate(long appPtr, long parentPtr)
	{

		CjQtAction *label;
        if (parentPtr == 0L){
            label = new CjQtAction();
        } else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            label = new CjQtAction(parent);
        }
		return reinterpret_cast<long>(label);
	}

	void nativeActionSetStatusTip(long ptr, const char *tip)
	{
		CjQtAction *instance = reinterpret_cast<CjQtAction *>(static_cast<uintptr_t>(ptr));
		instance->setStatusTip(tip);
	}

	void nativeActionSetText(long ptr, const char *txte)
	{
		CjQtAction *instance = reinterpret_cast<CjQtAction *>(static_cast<uintptr_t>(ptr));
		instance->setText(txte);
	}

	void nativeActionDelete(long ptr)
	{
		CjQtAction *instance = reinterpret_cast<CjQtAction *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}

}