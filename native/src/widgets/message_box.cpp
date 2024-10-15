#include "message_box.h"

extern "C"
{

	// QMessageBox

    void nativeMessageBoxInformation(uintptr_t parentPtr, const char *title, const char *text, uintptr_t buttonsPtr, uintptr_t defaultButtonPtr)
	{
		QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        QMessageBox::information(parent, title, text);
	}

	void nativeMessageBoxAbout(uintptr_t parentPtr, const char *title, const char *text)
	{
		QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        QMessageBox::about(parent, title, text);
    }

    void nativeMessageBoxCritical(uintptr_t parentPtr, const char *title, const char *text, uintptr_t buttonsPtr, uintptr_t defaultButtonPtr)
    {
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        QMessageBox::critical(parent, title, text);
    }
}
