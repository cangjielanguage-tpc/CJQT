#include "validator.h"

extern "C"
{
    uintptr_t nativeValidatorCreate(uintptr_t parentPtr)
    {
        CjValidator *validator;
        if (parentPtr == 0L)
        {
            validator = new CjValidator();
        }
        else
        {
            QObject *object = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
            validator = new CjValidator(object);
        }
        return reinterpret_cast<uintptr_t>(validator);
    }

    void nativeValidatorDelete(uintptr_t ptr)
    {
        QValidator *instance = reinterpret_cast<QValidator *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    void nativeValidatorFixup(uintptr_t ptr, char *input)
    {
        QValidator *instance = reinterpret_cast<QValidator *>(static_cast<uintptr_t>(ptr));
        QString str = QString(input);
        instance->fixup(str);
    }
    int nativeValidatorValidate(uintptr_t ptr, char *input, int pos)
    {
        QValidator *instance = reinterpret_cast<QValidator *>(static_cast<uintptr_t>(ptr));
        QString str = QString(input);
        return instance->validate(str, pos);
    }
    // Signal
    void nativeValidatorConnectChanged(uintptr_t ptr, uintptr_t code, nativeConnectCallback callback)
    {
        QValidator *instance = reinterpret_cast<QValidator *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QValidator::changed, [=]()
                         { callback(code); });
    }
}