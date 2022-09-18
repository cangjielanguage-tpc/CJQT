#include <QUrl>

char *convert_to_cstring(const QByteArray &array)
{
    return qstrdup(array.data());
}

char *convert_to_cstring(const QString &source)
{
    return convert_to_cstring(source.toUtf8());
}

extern "C"
{

    long nativeUrlCreate(const char *url, int parsingMode)
    {
        return reinterpret_cast<long>(new QUrl(QString::fromUtf8(url), static_cast<QUrl::ParsingMode>(parsingMode)));
    }

    void nativeUrlDelete(long vptr)
    {
        QUrl *url = reinterpret_cast<QUrl *>(static_cast<uintptr_t>(vptr));
        delete url;
    }

    char *nativeUrlToString(long vptr)
    {
        QUrl *url = reinterpret_cast<QUrl *>(static_cast<uintptr_t>(vptr));
        return convert_to_cstring(url->toString());
    }

    bool nativeUrlIsValid(long vptr)
    {
        QUrl *url = reinterpret_cast<QUrl *>(static_cast<uintptr_t>(vptr));
        return url->isValid();
    }
}