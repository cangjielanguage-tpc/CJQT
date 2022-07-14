#include "group_box.h"

extern "C" {
    // QGroupBox

    long nativeGroupBoxCreate(long parentPtr)
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
		return reinterpret_cast<long>(groupBox);
	}

    void nativeGroupBoxSetTitle(long ptr, const char *title){
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        instance->setTitle(title);
    }

    const char *nativeGroupBoxTitle(long ptr){
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        QString str = instance->title();
        return qstrdup(str.toUtf8());
    }

    void nativeGroupBoxSetAlignment(long ptr, int alignment){
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        instance->setAlignment(alignment);
    }

    int nativeGroupBoxAlignment(long ptr){
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        return instance->alignment();
    }

    void nativeGroupBoxSetFlat(long ptr, bool flat){
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        instance->setFlat(flat);
    }

    bool nativeGroupBoxIsFlat(long ptr){
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        return instance->isFlat();
    }

    void nativeGroupBoxSetCheckable(long ptr, bool checkable){
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        instance->setCheckable(checkable);
    }

    bool nativeGroupBoxIsCheckable(long ptr){
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        return instance->isCheckable();
    }

    void nativeGroupBoxSetChecked(long ptr, bool checked){
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        instance->setChecked(checked);
    }

    bool nativeGroupBoxIsChecked(long ptr){
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        return instance->isChecked();
    }

    void nativeGroupBoxClickedConnect(long ptr, long code, nativeConnectCallback callback)
    {
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QGroupBox::clicked, [=]()
                         { callback(code); });
    }

    void nativeGroupBoxToggledConnect(long ptr, long code, nativeConnectCallback callback)
    {
        QGroupBox *instance = reinterpret_cast<QGroupBox *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QGroupBox::toggled, [=]()
                         { callback(code); });
    }

    void nativeGroupBoxDelete(long ptr)
	{
		CjQtGroupBox *instance = reinterpret_cast<CjQtGroupBox *>(static_cast<uintptr_t>(ptr));
		delete instance;
	}

}