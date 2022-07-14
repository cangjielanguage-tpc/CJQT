# include "radio_button.h"

extern "C"
{
    // QRadioButton

    long nativeRadioButtonCreate(long parentPtr)
	{
        APPLICATION_CREATE
		CjQtRadioButton *label;
        if (parentPtr == 0L){
            label = new CjQtRadioButton();
        } else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            label = new CjQtRadioButton(parent);
        }
		return reinterpret_cast<long>(label);
	}

    void nativeRadioButtonSetText(long ptr, const char *text){
        QRadioButton *instance = reinterpret_cast<QRadioButton *>(static_cast<uintptr_t>(ptr));
        instance->setText(text);
    }

    const char *nativeRadioButtonText(long ptr){
        QRadioButton *instance = reinterpret_cast<QRadioButton *>(static_cast<uintptr_t>(ptr));
        QString str = instance->text();
        return qstrdup(str.toUtf8());
    }

    void nativeRadioButtonSetChecked(long ptr, bool checked){
        QRadioButton *instance = reinterpret_cast<QRadioButton *>(static_cast<uintptr_t>(ptr));
        instance->setChecked(checked);
    }

    bool nativeRadioButtonIsChecked(long ptr){
        QRadioButton *instance = reinterpret_cast<QRadioButton *>(static_cast<uintptr_t>(ptr));
        return instance->isChecked();
    }

    void nativeRadioButtonDelete(long ptr)
	{
		CjQtRadioButton *instance = reinterpret_cast<CjQtRadioButton *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}
}