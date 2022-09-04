#include <QDoubleValidator>
#include "config.h"
extern "C"
{
    long nativeDoubleValidatorCreate(long parentPtr)
    {
        QDoubleValidator *validator;
        if (parentPtr == 0L)
        {
            validator = new QDoubleValidator();
        }
        else
        {
            QObject *object = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
            validator = new QDoubleValidator(object);
        }
        return reinterpret_cast<long>(validator);
    }
    long nativeDoubleValidatorCreateWithBottom(double bottom, double top, int decimals, long parentPtr)
    {
        QDoubleValidator *validator;
        if (parentPtr == 0L)
        {
            validator = new QDoubleValidator(bottom, top, decimals);
        }
        else
        {
            QObject *object = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
            validator = new QDoubleValidator(bottom, top, decimals, object);
        }
        return reinterpret_cast<long>(validator);
    }

    void nativeDoubleValidatorDelete(long ptr)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    double nativeDoubleValidatorBottom(long ptr)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        return instance->bottom();
    }
    int nativeDoubleValidatorDecimals(long ptr)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        return instance->decimals();
    }
    int nativeDoubleValidatorNotation(long ptr)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        return instance->notation();
    }
    void nativeDoubleValidatorSetBottom(long ptr, double bottom)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        return instance->setBottom(bottom);
    }
    void nativeDoubleValidatorSetDecimals(long ptr, int decimals)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        return instance->setDecimals(decimals);
    }
    void nativeDoubleValidatorSetNotation(long ptr, int notation)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        return instance->setNotation(QDoubleValidator::Notation(notation));
    }
    void nativeDoubleValidatorSetRange(long ptr, double minimum, double maximum, int decimals)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        return instance->setRange(minimum, maximum, decimals);
    }
    void nativeDoubleValidatorSetTop(long ptr, double top)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        return instance->setTop(top);
    }
    double nativeDoubleValidatorTop(long ptr)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        return instance->top();
    }
    int nativeDoubleValidatorValidate(long ptr, char *input, int pos)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        QString str = QString(input);
        return instance->validate(str, pos);
    };

    // Signal
    void nativeDoubleValidatorConnectBottomChanged(long ptr, long code, nativeConnectCallbackDouble callback)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QDoubleValidator::bottomChanged, [=](double bottom)
                         { callback(code, bottom); });
    }
    // Signal
    void nativeDoubleValidatorConnectDecimalsChanged(long ptr, long code, nativeConnectCallbackInt callback)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QDoubleValidator::decimalsChanged, [=](int decimals)
                         { callback(code, decimals); });
    }
    // Signal
    void nativeDoubleValidatorConnectNotationChanged(long ptr, long code, nativeConnectCallbackInt callback)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QDoubleValidator::decimalsChanged, [=](int notation)
                         { callback(code, notation); });
    }
    // Signal
    void nativeDoubleValidatorConnectTopChanged(long ptr, long code, nativeConnectCallbackDouble callback)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QDoubleValidator::bottomChanged, [=](double top)
                         { callback(code, top); });
    }
}