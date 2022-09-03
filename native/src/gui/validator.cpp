#include "validator.h"

extern "C"
{
    long nativeValidatorCreate(long parentPtr)
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
        return reinterpret_cast<long>(validator);
    }

    void nativeValidatorDelete(long ptr)
    {
        QValidator *instance = reinterpret_cast<QValidator *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    void nativeValidatorFixup(long ptr, char *input)
    {
        QValidator *instance = reinterpret_cast<QValidator *>(static_cast<uintptr_t>(ptr));
        QString str = QString(input);
        instance->fixup(str);
    }
    int nativeValidatorValidate(long ptr, char *input, int pos)
    {
        QValidator *instance = reinterpret_cast<QValidator *>(static_cast<uintptr_t>(ptr));
        QString str = QString(input);
        return instance->validate(str, pos);
    }
    // Signal
    void nativeValidatorConnectChanged(long ptr, long code, nativeConnectCallback callback)
    {
        QValidator *instance = reinterpret_cast<QValidator *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QValidator::changed, [=]()
                         { callback(code); });
    }
}