/*
 * CJQT native bindings: QUrlQuery, QRandomGenerator
 */
#include <QUrlQuery>
#include <QRandomGenerator>
#include <QUuid>
#include <QStringList>
#include "native_string.h"

extern "C"
{
    // ---- QUrlQuery ----

    uintptr_t nativeUrlQueryCreate()
    {
        return reinterpret_cast<uintptr_t>(new QUrlQuery());
    }

    uintptr_t nativeUrlQueryCreateFromString(const char *query)
    {
        return reinterpret_cast<uintptr_t>(new QUrlQuery(QString::fromUtf8(query)));
    }

    void nativeUrlQueryDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QUrlQuery *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeUrlQueryIsEmpty(uintptr_t ptr)
    {
        return reinterpret_cast<QUrlQuery *>(static_cast<uintptr_t>(ptr))->isEmpty();
    }

    char *nativeUrlQueryQueryString(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QUrlQuery *>(static_cast<uintptr_t>(ptr))->query());
    }

    char *nativeUrlQueryQueryItemValue(uintptr_t ptr, const char *key)
    {
        return cjqt_to_cstring(reinterpret_cast<QUrlQuery *>(static_cast<uintptr_t>(ptr))->queryItemValue(
            QString::fromUtf8(key)));
    }

    void nativeUrlQueryAddQueryItem(uintptr_t ptr, const char *key, const char *value)
    {
        reinterpret_cast<QUrlQuery *>(static_cast<uintptr_t>(ptr))->addQueryItem(QString::fromUtf8(key),
                                                                                QString::fromUtf8(value));
    }

    void nativeUrlQueryRemoveQueryItem(uintptr_t ptr, const char *key)
    {
        reinterpret_cast<QUrlQuery *>(static_cast<uintptr_t>(ptr))->removeQueryItem(QString::fromUtf8(key));
    }

    bool nativeUrlQueryHasQueryItem(uintptr_t ptr, const char *key)
    {
        return reinterpret_cast<QUrlQuery *>(static_cast<uintptr_t>(ptr))->hasQueryItem(QString::fromUtf8(key));
    }

    // ---- QRandomGenerator ----

    uintptr_t nativeRandomGeneratorCreate()
    {
        return reinterpret_cast<uintptr_t>(new QRandomGenerator(QUuid::createUuid().data1));
    }

    void nativeRandomGeneratorDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QRandomGenerator *>(static_cast<uintptr_t>(ptr));
    }

    int nativeRandomGeneratorBounded(uintptr_t ptr, int highest)
    {
        return reinterpret_cast<QRandomGenerator *>(static_cast<uintptr_t>(ptr))->bounded(highest);
    }

    unsigned int nativeRandomGeneratorGenerate(uintptr_t ptr)
    {
        return reinterpret_cast<QRandomGenerator *>(static_cast<uintptr_t>(ptr))->generate();
    }

    int nativeRandomGeneratorGlobalBounded(int highest)
    {
        return QRandomGenerator::global()->bounded(highest);
    }
}
