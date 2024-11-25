#include "group_box.h"

extern "C" {
    // QGroupBox

    uintptr_t nativeGroupBoxCreate(uintptr_t parentPtr)
	{
        APPLICATION_CREATE
		CjQtGroupBox *groupBox;
        if (parentPtr == 0L){
            groupBox = new CjQtGroupBox();
        } else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            groupBox = new CjQtGroupBox(parent);
        }
		return reinterpret_cast<uintptr_t>(groupBox);
	}

    void nativeGroupBoxSetTitle(uintptr_t ptr, const char *title){
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        instance->setTitle(title);
    }

    const char *nativeGroupBoxTitle(uintptr_t ptr){
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        QString str = instance->title();
        return qstrdup(str.toUtf8());
    }

    void nativeGroupBoxSetAlignment(uintptr_t ptr, short alignment){
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        instance->setAlignment(alignment);
    }

    short nativeGroupBoxAlignment(uintptr_t ptr){
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        return instance->alignment();
    }

    void nativeGroupBoxSetFlat(uintptr_t ptr, bool flat){
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        instance->setFlat(flat);
    }

    bool nativeGroupBoxIsFlat(uintptr_t ptr){
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        return instance->isFlat();
    }

    void nativeGroupBoxSetCheckable(uintptr_t ptr, bool checkable){
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        instance->setCheckable(checkable);
    }

    bool nativeGroupBoxIsCheckable(uintptr_t ptr){
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        return instance->isCheckable();
    }

    void nativeGroupBoxSetChecked(uintptr_t ptr, bool checked){
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        instance->setChecked(checked);
    }

    bool nativeGroupBoxIsChecked(uintptr_t ptr){
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        return instance->isChecked();
    }

    void nativeGroupBoxClickedConnect(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QGroupBox::clicked, [=]()
                         { callback(code, (void*)0); });
    }

    void nativeGroupBoxToggledConnect(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QGroupBox::toggled, [=]()
                         { callback(code, (void*)0); });
    }

    void nativeGroupBoxDelete(uintptr_t ptr)
	{
		CjQtGroupBox *instance = reinterpret_cast<CjQtGroupBox *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}

}