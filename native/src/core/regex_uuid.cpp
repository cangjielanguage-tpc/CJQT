/*
 * CJQT native bindings: QRegularExpression, QRegularExpressionMatch, QUuid
 */
#include <QRegularExpression>
#include <QUuid>
#include "native_string.h"

extern "C"
{
    // ---- QRegularExpression ----

    uintptr_t nativeRegexCreate(const char *pattern)
    {
        return reinterpret_cast<uintptr_t>(new QRegularExpression(QString::fromUtf8(pattern)));
    }

    void nativeRegexDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QRegularExpression *>(static_cast<uintptr_t>(ptr));
    }

    char *nativeRegexPattern(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QRegularExpression *>(static_cast<uintptr_t>(ptr))->pattern());
    }

    bool nativeRegexIsValid(uintptr_t ptr)
    {
        return reinterpret_cast<QRegularExpression *>(static_cast<uintptr_t>(ptr))->isValid();
    }

    char *nativeRegexErrorString(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QRegularExpression *>(static_cast<uintptr_t>(ptr))->errorString());
    }

    uintptr_t nativeRegexMatch(uintptr_t ptr, const char *str)
    {
        QRegularExpression *regex = reinterpret_cast<QRegularExpression *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(new QRegularExpressionMatch(regex->match(QString::fromUtf8(str))));
    }

    // ---- QRegularExpressionMatch ----

    void nativeRegexMatchDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QRegularExpressionMatch *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeRegexMatchHasMatch(uintptr_t ptr)
    {
        return reinterpret_cast<QRegularExpressionMatch *>(static_cast<uintptr_t>(ptr))->hasMatch();
    }

    bool nativeRegexMatchHasPartialMatch(uintptr_t ptr)
    {
        return reinterpret_cast<QRegularExpressionMatch *>(static_cast<uintptr_t>(ptr))->hasPartialMatch();
    }

    char *nativeRegexMatchCaptured(uintptr_t ptr, int index)
    {
        return cjqt_to_cstring(reinterpret_cast<QRegularExpressionMatch *>(static_cast<uintptr_t>(ptr))->captured(index));
    }

    int nativeRegexMatchCapturedCount(uintptr_t ptr)
    {
        return reinterpret_cast<QRegularExpressionMatch *>(static_cast<uintptr_t>(ptr))->lastCapturedIndex() + 1;
    }

    // ---- QUuid ----

    uintptr_t nativeUuidCreate()
    {
        return reinterpret_cast<uintptr_t>(new QUuid(QUuid::createUuid()));
    }

    uintptr_t nativeUuidCreateFromString(const char *str)
    {
        return reinterpret_cast<uintptr_t>(new QUuid(QUuid(QString::fromUtf8(str))));
    }

    void nativeUuidDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QUuid *>(static_cast<uintptr_t>(ptr));
    }

    char *nativeUuidToString(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QUuid *>(static_cast<uintptr_t>(ptr))->toString());
    }

    bool nativeUuidIsNull(uintptr_t ptr)
    {
        return reinterpret_cast<QUuid *>(static_cast<uintptr_t>(ptr))->isNull();
    }
}
