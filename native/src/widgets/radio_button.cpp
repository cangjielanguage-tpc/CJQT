# include "radio_button.h"

extern "C"
{
    // QRadioButton

    uintptr_t nativeRadioButtonCreate(uintptr_t parentPtr)
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
		return reinterpret_cast<uintptr_t>(label);
	}

    void nativeRadioButtonSetText(uintptr_t ptr, const char *text){
        QRadioButton *instance = reinterpret_cast<QRadioButton *>(static_cast<uintptr_t>(ptr));
        instance->setText(text);
    }

    const char *nativeRadioButtonText(uintptr_t ptr){
        QRadioButton *instance = reinterpret_cast<QRadioButton *>(static_cast<uintptr_t>(ptr));
        QString str = instance->text();
        return qstrdup(str.toUtf8());
    }

    void nativeRadioButtonSetChecked(uintptr_t ptr, bool checked){
        QRadioButton *instance = reinterpret_cast<QRadioButton *>(static_cast<uintptr_t>(ptr));
        instance->setChecked(checked);
    }

    bool nativeRadioButtonIsChecked(uintptr_t ptr){
        QRadioButton *instance = reinterpret_cast<QRadioButton *>(static_cast<uintptr_t>(ptr));
        return instance->isChecked();
    }

    void nativeRadioButtonDelete(uintptr_t ptr)
	{
		CjQtRadioButton *instance = reinterpret_cast<CjQtRadioButton *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}
}