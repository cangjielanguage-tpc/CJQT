#include <QDoubleValidator>
#include "config.h"
extern "C"
{
    uintptr_t nativeDoubleValidatorCreate(uintptr_t parentPtr)
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
        return reinterpret_cast<uintptr_t>(validator);
    }
    uintptr_t nativeDoubleValidatorCreateWithBottom(double bottom, double top, int decimals, uintptr_t parentPtr)
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
        return reinterpret_cast<uintptr_t>(validator);
    }

    void nativeDoubleValidatorDelete(uintptr_t ptr)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    double nativeDoubleValidatorBottom(uintptr_t ptr)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        return instance->bottom();
    }
    int nativeDoubleValidatorDecimals(uintptr_t ptr)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        return instance->decimals();
    }
    int nativeDoubleValidatorNotation(uintptr_t ptr)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        return instance->notation();
    }
    void nativeDoubleValidatorSetBottom(uintptr_t ptr, double bottom)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        return instance->setBottom(bottom);
    }
    void nativeDoubleValidatorSetDecimals(uintptr_t ptr, int decimals)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        return instance->setDecimals(decimals);
    }
    void nativeDoubleValidatorSetNotation(uintptr_t ptr, int notation)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        return instance->setNotation(QDoubleValidator::Notation(notation));
    }
    void nativeDoubleValidatorSetRange(uintptr_t ptr, double minimum, double maximum, int decimals)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        return instance->setRange(minimum, maximum, decimals);
    }
    void nativeDoubleValidatorSetTop(uintptr_t ptr, double top)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        return instance->setTop(top);
    }
    double nativeDoubleValidatorTop(uintptr_t ptr)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        return instance->top();
    }
    int nativeDoubleValidatorValidate(uintptr_t ptr, char *input, int pos)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        QString str = QString(input);
        return instance->validate(str, pos);
    };

    // Signal
    void nativeDoubleValidatorConnectBottomChanged(uintptr_t ptr, uintptr_t code, nativeConnectCallbackDouble callback)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QDoubleValidator::bottomChanged, [=](double bottom)
                         { callback(code, bottom); });
    }
    // Signal
    void nativeDoubleValidatorConnectDecimalsChanged(uintptr_t ptr, uintptr_t code, nativeConnectCallbackInt callback)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QDoubleValidator::decimalsChanged, [=](int decimals)
                         { callback(code, decimals); });
    }
    // Signal
    void nativeDoubleValidatorConnectNotationChanged(uintptr_t ptr, uintptr_t code, nativeConnectCallbackInt callback)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QDoubleValidator::decimalsChanged, [=](int notation)
                         { callback(code, notation); });
    }
    // Signal
    void nativeDoubleValidatorConnectTopChanged(uintptr_t ptr, uintptr_t code, nativeConnectCallbackDouble callback)
    {
        QDoubleValidator *instance = reinterpret_cast<QDoubleValidator *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QDoubleValidator::bottomChanged, [=](double top)
                         { callback(code, top); });
    }
}