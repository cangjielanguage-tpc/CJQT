# include "check_box.h"

extern "C"
{
    // QCheckBox

    uintptr_t nativeCheckBoxCreate(uintptr_t parentPtr)
	{
        APPLICATION_CREATE
		CjQtCheckBox *label;
        if (parentPtr == 0L){
            label = new CjQtCheckBox();
        } else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            label = new CjQtCheckBox(parent);
        }
		return reinterpret_cast<uintptr_t>(label);
	}

    void nativeCheckBoxSetText(uintptr_t ptr, const char *text){
        QCheckBox *instance = reinterpret_cast<QCheckBox *>(static_cast<uintptr_t>(ptr));
        instance->setText(text);
    }

    const char *nativeCheckBoxText(uintptr_t ptr){
        QCheckBox *instance = reinterpret_cast<QCheckBox *>(static_cast<uintptr_t>(ptr));
        QString str = instance->text();
        return qstrdup(str.toUtf8());
    }

    void nativeCheckBoxSetChecked(uintptr_t ptr, bool checked){
        QCheckBox *instance = reinterpret_cast<QCheckBox *>(static_cast<uintptr_t>(ptr));
        instance->setChecked(checked);
    }

    bool nativeCheckBoxIsChecked(uintptr_t ptr){
        QCheckBox *instance = reinterpret_cast<QCheckBox *>(static_cast<uintptr_t>(ptr));
        return instance->isChecked();
    }

    void nativeCheckBoxDelete(uintptr_t ptr)
	{
		CjQtCheckBox *instance = reinterpret_cast<CjQtCheckBox *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}
}