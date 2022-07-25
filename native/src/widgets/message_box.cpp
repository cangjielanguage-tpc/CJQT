#include "message_box.h"

extern "C"
{

	// QMessageBox

    void nativeMessageBoxInformation(long parentPtr, const char *title, const char *text, long buttonsPtr, long defaultButtonPtr)
	{
		QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        QMessageBox::information(parent, title, text);
	}

	void nativeMessageBoxAbout(long parentPtr, const char *title, const char *text)
	{
		QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        QMessageBox::about(parent, title, text);
	}
}