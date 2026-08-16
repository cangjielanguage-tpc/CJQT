/*
 * Shared C string conversion helpers for CJQT native bindings.
 *
 * All helpers return a buffer allocated with qstrdup() (Qt's malloc-based
 * strdup), which is compatible with Cangjie's `LibC.free()`.
 */
#ifndef CJQT_NATIVE_STRING_H_
#define CJQT_NATIVE_STRING_H_

#include <QString>
#include <QByteArray>

inline char *cjqt_to_cstring(const QByteArray &array)
{
    return qstrdup(array.constData());
}

inline char *cjqt_to_cstring(const QString &source)
{
    return qstrdup(source.toUtf8().constData());
}

#endif
