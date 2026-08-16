#include "action.h"

extern "C"
{

	// QAction

	uintptr_t nativeActionCreate(uintptr_t parentPtr)
	{
        APPLICATION_CREATE
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
		return reinterpret_cast<uintptr_t>(label);
	}

	void nativeActionSetStatusTip(uintptr_t ptr, const char *tip)
	{
		QAction *instance = reinterpret_cast<QAction *>(static_cast<uintptr_t>(ptr));
		instance->setStatusTip(tip);
	}

	void nativeActionSetText(uintptr_t ptr, const char *txte)
	{
		QAction *instance = reinterpret_cast<QAction *>(static_cast<uintptr_t>(ptr));
		instance->setText(txte);
	}

	const char *nativeActionText(uintptr_t ptr)
	{
		QAction *instance = reinterpret_cast<QAction *>(static_cast<uintptr_t>(ptr));
		QString str = instance->text();
		return qstrdup(str.toUtf8());
	}

	void nativeActionSetIcon(uintptr_t ptr, uintptr_t iconPtr)
	{
		QAction *instance = reinterpret_cast<QAction *>(static_cast<uintptr_t>(ptr));
		QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
		instance->setIcon(*icon);
	}

	uintptr_t nativeActionIcon(uintptr_t ptr)
	{
		QAction *instance = reinterpret_cast<QAction *>(static_cast<uintptr_t>(ptr));
		QIcon icon = instance->icon();
		return reinterpret_cast<uintptr_t>(&icon);
	}

	void nativeActionSetShortcut(uintptr_t ptr, uintptr_t shortcutPtr)
	{
		QAction *instance = reinterpret_cast<QAction *>(static_cast<uintptr_t>(ptr));
		QKeySequence *shortcut = reinterpret_cast<QKeySequence *>(static_cast<uintptr_t>(shortcutPtr));
		instance->setShortcut(*shortcut);
	}

	uintptr_t nativeActionShortcut(uintptr_t ptr)
	{
		QAction *instance = reinterpret_cast<QAction *>(static_cast<uintptr_t>(ptr));
		QKeySequence shortcut = instance->shortcut();
		return reinterpret_cast<uintptr_t>(&shortcut);
	}

	void nativeActionSetCheckable(uintptr_t ptr, bool checkable)
	{
		QAction *instance = reinterpret_cast<QAction *>(static_cast<uintptr_t>(ptr));
		instance->setCheckable(checkable);
	}

	bool nativeActionIsCheckable(uintptr_t ptr)
	{
		QAction *instance = reinterpret_cast<QAction *>(static_cast<uintptr_t>(ptr));
		return instance->isCheckable();
	}

	void nativeActionSetChecked(uintptr_t ptr, bool checked)
	{
		QAction *instance = reinterpret_cast<QAction *>(static_cast<uintptr_t>(ptr));
		instance->setChecked(checked);
	}

	bool nativeActionIsChecked(uintptr_t ptr)
	{
		QAction *instance = reinterpret_cast<QAction *>(static_cast<uintptr_t>(ptr));
		return instance->isChecked();
	}

	void nativeActionConnectTriggered(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
	{
		QAction *instance = reinterpret_cast<QAction *>(static_cast<uintptr_t>(ptr));
		QObject::connect(instance, &QAction::triggered, [=](bool result)
						 { callback(code, (void *)result); });
	}

	void nativeActionDelete(uintptr_t ptr)
	{
		CjQtAction *instance = reinterpret_cast<CjQtAction *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}
}