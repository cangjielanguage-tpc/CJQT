#include "dialog.h"

extern "C"
{

    // QDialog

    long nativeDialogCreate(long parentPtr)
	{
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
		return reinterpret_cast<long>(dialog);
	}

    void nativeDialogDelete(long ptr)
	{
		CjQtDialog *instance = reinterpret_cast<CjQtDialog *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}

}