# include "check_box.h"

extern "C"
{
    // QCheckBox

    long nativeCheckBoxCreate(long parentPtr)
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
		return reinterpret_cast<long>(label);
	}

    void nativeCheckBoxSetText(long ptr, const char *text){
        QCheckBox *instance = reinterpret_cast<QCheckBox *>(static_cast<uintptr_t>(ptr));
        instance->setText(text);
    }

    const char *nativeCheckBoxText(long ptr){
        QCheckBox *instance = reinterpret_cast<QCheckBox *>(static_cast<uintptr_t>(ptr));
        QString str = instance->text();
        return qstrdup(str.toUtf8());
    }

    void nativeCheckBoxSetChecked(long ptr, bool checked){
        QCheckBox *instance = reinterpret_cast<QCheckBox *>(static_cast<uintptr_t>(ptr));
        instance->setChecked(checked);
    }

    bool nativeCheckBoxIsChecked(long ptr){
        QCheckBox *instance = reinterpret_cast<QCheckBox *>(static_cast<uintptr_t>(ptr));
        return instance->isChecked();
    }

    void nativeCheckBoxDelete(long ptr)
	{
		CjQtCheckBox *instance = reinterpret_cast<CjQtCheckBox *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}
}