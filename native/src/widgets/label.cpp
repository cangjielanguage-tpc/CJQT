#include "label.h"

extern "C"
{

	// QLabel

    long nativeLabelCreate(long appPtr, long parentPtr)
	{

		CjQtLabel *label;
        if (parentPtr == 0L){
            label = new CjQtLabel();
        } else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            label = new CjQtLabel(parent);
        }
		return reinterpret_cast<long>(label);
	}

    void nativeLabelSetGeometry(long ptr, int ax, int ay, int aw, int ah){
        QLabel *instance = reinterpret_cast<QLabel *>(static_cast<uintptr_t>(ptr));
        instance->setGeometry(ax, ay, aw, ah);
    }

    void nativeLabelSetText(long ptr, const char *text){
        QLabel *instance = reinterpret_cast<QLabel *>(static_cast<uintptr_t>(ptr));
        instance->setText(text);
    }

	void nativeLabelDelete(long ptr)
	{
		CjQtLabel *instance = reinterpret_cast<CjQtLabel *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}
}