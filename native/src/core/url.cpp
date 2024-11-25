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

    uintptr_t nativeUrlCreate(const char *url, int parsingMode)
    {
        return reinterpret_cast<uintptr_t>(new QUrl(QString::fromUtf8(url), static_cast<QUrl::ParsingMode>(parsingMode)));
    }

    void nativeUrlDelete(uintptr_t vptr)
    {
        QUrl *url = reinterpret_cast<QUrl *>(static_cast<uintptr_t>(vptr));
        delete url;
    }

    char *nativeUrlToString(uintptr_t vptr)
    {
        QUrl *url = reinterpret_cast<QUrl *>(static_cast<uintptr_t>(vptr));
        return convert_to_cstring(url->toString());
    }

    bool nativeUrlIsValid(uintptr_t vptr)
    {
        QUrl *url = reinterpret_cast<QUrl *>(static_cast<uintptr_t>(vptr));
        return url->isValid();
    }
}