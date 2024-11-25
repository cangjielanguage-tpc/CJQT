#include "dialog.h"

extern "C"
{

    // QDialog

    uintptr_t nativeDialogCreate(uintptr_t parentPtr)
	{
        APPLICATION_CREATE
        CjQtDialog *dialog;
		if (parentPtr == 0L)
		{
			dialog = new CjQtDialog();
		}
		else
		{
			QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
			dialog = new CjQtDialog(parent);
		}
		return reinterpret_cast<uintptr_t>(dialog);
	}

    void nativeDialogDelete(uintptr_t ptr)
	{
		CjQtDialog *instance = reinterpret_cast<CjQtDialog *>(static_cast<uintptr_t>(ptr));
		delete instance;
    }


    int nativeDialogExec(uintptr_t ptr)
    {
        CjQtDialog *instance = reinterpret_cast<CjQtDialog *>(static_cast<uintptr_t>(ptr));
        return instance->exec();
    }


    void nativeDialogReject(uintptr_t ptr)
    {
        CjQtDialog *instance = reinterpret_cast<CjQtDialog *>(static_cast<uintptr_t>(ptr));
        instance->reject();
    }


    void nativeDialogAccept(uintptr_t ptr)
    {
        CjQtDialog *instance = reinterpret_cast<CjQtDialog *>(static_cast<uintptr_t>(ptr));
        instance->accept();
    }

}
