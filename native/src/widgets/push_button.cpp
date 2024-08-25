#include "push_button.h"

#include <QMessageBox>

extern "C"
{

    // QPushButton

    long nativePushButtonCreate(long parentPtr)
    {
        APPLICATION_CREATE
        CjQtPushButton *label;
        if (parentPtr == 0L)
        {
            label = new CjQtPushButton();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            label = new CjQtPushButton(parent);
        }
        return reinterpret_cast<long>(label);
    }

    void nativePushButtonSetText(long ptr, const char *text)
    {
        QPushButton *instance = reinterpret_cast<QPushButton *>(static_cast<uintptr_t>(ptr));
        instance->setText(text);
    }

    void nativePushButtonConnect(long ptr, long code, nativeConnectCallbackPointer callback)
    {
        QPushButton *instance = reinterpret_cast<QPushButton *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QPushButton::clicked, [=]()
                         { callback(code, (void *)0); });
    }

    void nativePushButtonDelete(long ptr)
    {
        CjQtPushButton *instance = reinterpret_cast<CjQtPushButton *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}