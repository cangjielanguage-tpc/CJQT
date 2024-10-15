#include "label.h"

extern "C"
{

	// QLabel

    uintptr_t nativeLabelCreate(uintptr_t parentPtr)
	{
        APPLICATION_CREATE
		CjQtLabel *label;
        if (parentPtr == 0L){
            label = new CjQtLabel();
        } else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            label = new CjQtLabel(parent);
        }
		return reinterpret_cast<uintptr_t>(label);
	}
    uintptr_t nativeLabelCreateText(const char *text,uintptr_t parentPtr)
	{
        APPLICATION_CREATE
		CjQtLabel *label;
        if (parentPtr == 0L){
            label = new CjQtLabel();
        } else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            label = new CjQtLabel(text,parent);
        }
		return reinterpret_cast<uintptr_t>(label);
	}

    void nativeLabelSetGeometry(uintptr_t ptr, int ax, int ay, int aw, int ah){
        QLabel *instance = reinterpret_cast<QLabel *>(static_cast<uintptr_t>(ptr));
        instance->setGeometry(ax, ay, aw, ah);
    }

    void nativeLabelSetText(uintptr_t ptr, const char *text){
        QLabel *instance = reinterpret_cast<QLabel *>(static_cast<uintptr_t>(ptr));
        instance->setText(text);
    }

	void nativeLabelDelete(uintptr_t ptr)
	{
		CjQtLabel *instance = reinterpret_cast<CjQtLabel *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}
}