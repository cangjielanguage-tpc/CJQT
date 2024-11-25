#include "dialog_button_box.h"

extern "C"
{

    // QDialog

    uintptr_t nativeDialogButtonBoxCreate(uintptr_t parentPtr)
	{
        APPLICATION_CREATE
        CjQtDialogButtonBox *buttonBox;
		if (parentPtr == 0L)
		{
            buttonBox = new CjQtDialogButtonBox();
		}
		else
		{
			QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            buttonBox = new CjQtDialogButtonBox(parent);
		}
        return reinterpret_cast<uintptr_t>(buttonBox);
	}

    void nativeDialogButtonBoxDelete(uintptr_t ptr)
	{
        CjQtDialogButtonBox *instance = reinterpret_cast<CjQtDialogButtonBox *>(static_cast<uintptr_t>(ptr));
		delete instance;
    }

    void nativeDialogButtonBoxConnectAccepted(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QDialogButtonBox *instance = reinterpret_cast<QDialogButtonBox *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QDialogButtonBox::accepted, [=]()
                         { callback(code, (void *)0); });
    }

    void nativeDialogButtonBoxConnectRejected(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QDialogButtonBox *instance = reinterpret_cast<QDialogButtonBox *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QDialogButtonBox::rejected, [=]()
                         { callback(code, (void *)0); });
    }


    uintptr_t nativeDialogButtonBoxAddButton(uintptr_t ptr, int button)
    {
        QDialogButtonBox *lineEditObj = reinterpret_cast<QDialogButtonBox *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(lineEditObj->addButton(QDialogButtonBox::StandardButton(button)));
    }


}
