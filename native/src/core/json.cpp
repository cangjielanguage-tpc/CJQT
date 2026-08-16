/*
 * CJQT native bindings: QJsonValue, QJsonArray, QJsonObject, QJsonDocument
 */
#include <QJsonValue>
#include <QJsonArray>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonParseError>
#include <QStringList>
#include "native_string.h"

extern "C"
{
    // ---- QJsonValue ----

    uintptr_t nativeJsonValueCreateNull()
    {
        return reinterpret_cast<uintptr_t>(new QJsonValue(QJsonValue::Null));
    }

    uintptr_t nativeJsonValueCreateBool(bool value)
    {
        return reinterpret_cast<uintptr_t>(new QJsonValue(value));
    }

    uintptr_t nativeJsonValueCreateInt(intptr_t value)
    {
        return reinterpret_cast<uintptr_t>(new QJsonValue(static_cast<int>(value)));
    }

    uintptr_t nativeJsonValueCreateDouble(double value)
    {
        return reinterpret_cast<uintptr_t>(new QJsonValue(value));
    }

    uintptr_t nativeJsonValueCreateString(const char *value)
    {
        return reinterpret_cast<uintptr_t>(new QJsonValue(QString::fromUtf8(value)));
    }

    uintptr_t nativeJsonValueCreateArray(uintptr_t arrayPtr)
    {
        QJsonArray *arr = reinterpret_cast<QJsonArray *>(static_cast<uintptr_t>(arrayPtr));
        return reinterpret_cast<uintptr_t>(new QJsonValue(*arr));
    }

    uintptr_t nativeJsonValueCreateObject(uintptr_t objectPtr)
    {
        QJsonObject *obj = reinterpret_cast<QJsonObject *>(static_cast<uintptr_t>(objectPtr));
        return reinterpret_cast<uintptr_t>(new QJsonValue(*obj));
    }

    void nativeJsonValueDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QJsonValue *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeJsonValueIsNull(uintptr_t ptr)
    {
        return reinterpret_cast<QJsonValue *>(static_cast<uintptr_t>(ptr))->isNull();
    }

    bool nativeJsonValueIsBool(uintptr_t ptr)
    {
        return reinterpret_cast<QJsonValue *>(static_cast<uintptr_t>(ptr))->isBool();
    }

    bool nativeJsonValueIsDouble(uintptr_t ptr)
    {
        return reinterpret_cast<QJsonValue *>(static_cast<uintptr_t>(ptr))->isDouble();
    }

    bool nativeJsonValueIsString(uintptr_t ptr)
    {
        return reinterpret_cast<QJsonValue *>(static_cast<uintptr_t>(ptr))->isString();
    }

    bool nativeJsonValueIsArray(uintptr_t ptr)
    {
        return reinterpret_cast<QJsonValue *>(static_cast<uintptr_t>(ptr))->isArray();
    }

    bool nativeJsonValueIsObject(uintptr_t ptr)
    {
        return reinterpret_cast<QJsonValue *>(static_cast<uintptr_t>(ptr))->isObject();
    }

    bool nativeJsonValueToBool(uintptr_t ptr)
    {
        return reinterpret_cast<QJsonValue *>(static_cast<uintptr_t>(ptr))->toBool();
    }

    double nativeJsonValueToDouble(uintptr_t ptr)
    {
        return reinterpret_cast<QJsonValue *>(static_cast<uintptr_t>(ptr))->toDouble();
    }

    int nativeJsonValueToInt(uintptr_t ptr)
    {
        return reinterpret_cast<QJsonValue *>(static_cast<uintptr_t>(ptr))->toInt();
    }

    char *nativeJsonValueToString(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QJsonValue *>(static_cast<uintptr_t>(ptr))->toString());
    }

    uintptr_t nativeJsonValueToArray(uintptr_t ptr)
    {
        return reinterpret_cast<uintptr_t>(new QJsonArray(
            reinterpret_cast<QJsonValue *>(static_cast<uintptr_t>(ptr))->toArray()));
    }

    uintptr_t nativeJsonValueToObject(uintptr_t ptr)
    {
        return reinterpret_cast<uintptr_t>(new QJsonObject(
            reinterpret_cast<QJsonValue *>(static_cast<uintptr_t>(ptr))->toObject()));
    }

    // ---- QJsonArray ----

    uintptr_t nativeJsonArrayCreate()
    {
        return reinterpret_cast<uintptr_t>(new QJsonArray());
    }

    void nativeJsonArrayDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QJsonArray *>(static_cast<uintptr_t>(ptr));
    }

    int nativeJsonArraySize(uintptr_t ptr)
    {
        return reinterpret_cast<QJsonArray *>(static_cast<uintptr_t>(ptr))->size();
    }

    bool nativeJsonArrayIsEmpty(uintptr_t ptr)
    {
        return reinterpret_cast<QJsonArray *>(static_cast<uintptr_t>(ptr))->isEmpty();
    }

    uintptr_t nativeJsonArrayAt(uintptr_t ptr, int index)
    {
        return reinterpret_cast<uintptr_t>(new QJsonValue(
            reinterpret_cast<QJsonArray *>(static_cast<uintptr_t>(ptr))->at(index)));
    }

    void nativeJsonArrayAppend(uintptr_t ptr, uintptr_t valuePtr)
    {
        QJsonValue *value = reinterpret_cast<QJsonValue *>(static_cast<uintptr_t>(valuePtr));
        reinterpret_cast<QJsonArray *>(static_cast<uintptr_t>(ptr))->append(*value);
    }

    char *nativeJsonArrayToString(uintptr_t ptr)
    {
        QJsonArray *arr = reinterpret_cast<QJsonArray *>(static_cast<uintptr_t>(ptr));
        return cjqt_to_cstring(QJsonDocument(*arr).toJson(QJsonDocument::Compact));
    }

    uintptr_t nativeJsonArrayFromString(const char *str)
    {
        QJsonParseError err;
        QJsonDocument doc = QJsonDocument::fromJson(QByteArray(str), &err);
        if (err.error != QJsonParseError::NoError || !doc.isArray())
        {
            return 0;
        }
        return reinterpret_cast<uintptr_t>(new QJsonArray(doc.array()));
    }

    // ---- QJsonObject ----

    uintptr_t nativeJsonObjectCreate()
    {
        return reinterpret_cast<uintptr_t>(new QJsonObject());
    }

    void nativeJsonObjectDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QJsonObject *>(static_cast<uintptr_t>(ptr));
    }

    int nativeJsonObjectSize(uintptr_t ptr)
    {
        return reinterpret_cast<QJsonObject *>(static_cast<uintptr_t>(ptr))->size();
    }

    bool nativeJsonObjectIsEmpty(uintptr_t ptr)
    {
        return reinterpret_cast<QJsonObject *>(static_cast<uintptr_t>(ptr))->isEmpty();
    }

    bool nativeJsonObjectContains(uintptr_t ptr, const char *key)
    {
        return reinterpret_cast<QJsonObject *>(static_cast<uintptr_t>(ptr))->contains(QString::fromUtf8(key));
    }

    uintptr_t nativeJsonObjectValue(uintptr_t ptr, const char *key)
    {
        return reinterpret_cast<uintptr_t>(new QJsonValue(
            reinterpret_cast<QJsonObject *>(static_cast<uintptr_t>(ptr))->value(QString::fromUtf8(key))));
    }

    void nativeJsonObjectInsert(uintptr_t ptr, const char *key, uintptr_t valuePtr)
    {
        QJsonValue *value = reinterpret_cast<QJsonValue *>(static_cast<uintptr_t>(valuePtr));
        reinterpret_cast<QJsonObject *>(static_cast<uintptr_t>(ptr))->insert(QString::fromUtf8(key), *value);
    }

    void nativeJsonObjectRemove(uintptr_t ptr, const char *key)
    {
        reinterpret_cast<QJsonObject *>(static_cast<uintptr_t>(ptr))->remove(QString::fromUtf8(key));
    }

    uintptr_t nativeJsonObjectKeys(uintptr_t ptr)
    {
        QJsonObject *obj = reinterpret_cast<QJsonObject *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(new QStringList(obj->keys()));
    }

    char *nativeJsonObjectToString(uintptr_t ptr)
    {
        QJsonObject *obj = reinterpret_cast<QJsonObject *>(static_cast<uintptr_t>(ptr));
        return cjqt_to_cstring(QJsonDocument(*obj).toJson(QJsonDocument::Compact));
    }

    uintptr_t nativeJsonObjectFromString(const char *str)
    {
        QJsonParseError err;
        QJsonDocument doc = QJsonDocument::fromJson(QByteArray(str), &err);
        if (err.error != QJsonParseError::NoError || !doc.isObject())
        {
            return 0;
        }
        return reinterpret_cast<uintptr_t>(new QJsonObject(doc.object()));
    }

    // ---- QJsonDocument ----

    uintptr_t nativeJsonDocumentCreate()
    {
        return reinterpret_cast<uintptr_t>(new QJsonDocument());
    }

    uintptr_t nativeJsonDocumentCreateFromArray(uintptr_t arrayPtr)
    {
        QJsonArray *arr = reinterpret_cast<QJsonArray *>(static_cast<uintptr_t>(arrayPtr));
        return reinterpret_cast<uintptr_t>(new QJsonDocument(*arr));
    }

    uintptr_t nativeJsonDocumentCreateFromObject(uintptr_t objectPtr)
    {
        QJsonObject *obj = reinterpret_cast<QJsonObject *>(static_cast<uintptr_t>(objectPtr));
        return reinterpret_cast<uintptr_t>(new QJsonDocument(*obj));
    }

    void nativeJsonDocumentDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QJsonDocument *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeJsonDocumentIsNull(uintptr_t ptr)
    {
        return reinterpret_cast<QJsonDocument *>(static_cast<uintptr_t>(ptr))->isNull();
    }

    bool nativeJsonDocumentIsEmpty(uintptr_t ptr)
    {
        return reinterpret_cast<QJsonDocument *>(static_cast<uintptr_t>(ptr))->isEmpty();
    }

    bool nativeJsonDocumentIsArray(uintptr_t ptr)
    {
        return reinterpret_cast<QJsonDocument *>(static_cast<uintptr_t>(ptr))->isArray();
    }

    bool nativeJsonDocumentIsObject(uintptr_t ptr)
    {
        return reinterpret_cast<QJsonDocument *>(static_cast<uintptr_t>(ptr))->isObject();
    }

    uintptr_t nativeJsonDocumentArray(uintptr_t ptr)
    {
        return reinterpret_cast<uintptr_t>(new QJsonArray(
            reinterpret_cast<QJsonDocument *>(static_cast<uintptr_t>(ptr))->array()));
    }

    uintptr_t nativeJsonDocumentObject(uintptr_t ptr)
    {
        return reinterpret_cast<uintptr_t>(new QJsonObject(
            reinterpret_cast<QJsonDocument *>(static_cast<uintptr_t>(ptr))->object()));
    }

    char *nativeJsonDocumentToJson(uintptr_t ptr)
    {
        QJsonDocument *doc = reinterpret_cast<QJsonDocument *>(static_cast<uintptr_t>(ptr));
        return cjqt_to_cstring(doc->toJson(QJsonDocument::Compact));
    }

    uintptr_t nativeJsonDocumentFromJson(const char *str)
    {
        QJsonParseError err;
        QJsonDocument *doc = new QJsonDocument(QJsonDocument::fromJson(QByteArray(str), &err));
        if (err.error != QJsonParseError::NoError)
        {
            delete doc;
            return 0;
        }
        return reinterpret_cast<uintptr_t>(doc);
    }
}
