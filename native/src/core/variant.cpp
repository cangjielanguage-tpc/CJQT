#include <QVariant>

extern "C"
{
    void *nativeVariantCreate()
    {
        QVariant *variant = new QVariant();
        return variant;
    }

    void *nativeVariantCreateWithType(int type)
    {
        QVariant *variant = new QVariant(QVariant::Type(type));
        return variant;
    }

    void *nativeVariantCreateWithValue(int typeVal, void *value)
    {
        QVariant::Type type = QVariant::Type(typeVal);
        QVariant *variant = new QVariant();
        if (type == QVariant::Int)
        {
            variant = new QVariant((int)(intptr_t)value);
        }
        else if (type == QVariant::Bool)
        {
            variant = new QVariant((bool)value);
        }
        else if (type == QVariant::String)
        {
            variant = new QVariant((char *)value);
        }
        else
        {
            variant = new QVariant();
        }
        return variant;
    }

    void nativeVariantSetValue(void *ptr, int typeVal, void *value)
    {
        QVariant *instance = (QVariant *)ptr;
        QVariant::Type type = QVariant::Type(typeVal);
        if (type == QVariant::Int)
        {
            instance->setValue((int)(intptr_t)value);
        }
        else if (type == QVariant::Bool)
        {
            instance->setValue((bool)value);
        }
        else if (type == QVariant::String)
        {
            instance->setValue(QString((char *)value));
        }
    }

    void nativeVariantDelete(void *ptr)
    {
        QVariant *instance = (QVariant *)ptr;
        delete instance;
    }

    bool nativeVariantIsValid(void *ptr)
    {
        QVariant *instance = (QVariant *)ptr;
        return instance->isValid();
    }

    bool nativeVariantIsNull(void *ptr)
    {
        QVariant *instance = (QVariant *)ptr;
        return instance->isNull();
    }

    int nativeVariantToInt(void *ptr)
    {
        QVariant *instance = (QVariant *)ptr;
        return instance->toInt();
    }

    bool nativeVariantToBool(void *ptr)
    {
        QVariant *instance = (QVariant *)ptr;
        return instance->toBool();
    }

    const char *nativeVariantToString(void *ptr)
    {
        QVariant *instance = (QVariant *)ptr;
        QString str = instance->toString();
        return qstrdup(str.toUtf8());
    }
}