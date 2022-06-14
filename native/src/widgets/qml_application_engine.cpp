#include <QtQml/QQmlApplicationEngine>
#include <QUrl>

extern "C"
{

    long nativeQmlApplicationAngineCreate()
    {
        return reinterpret_cast<long>(new QQmlApplicationEngine());
    }

    void nativeQmlApplicationAngineLoadData(long vptr, const char *data)
    {
        QQmlApplicationEngine *engine = reinterpret_cast<QQmlApplicationEngine *>(static_cast<uintptr_t>(vptr));
        engine->loadData(data);
    }

    void nativeQmlApplicationAngineLoadUrl(long vptr, long urlPtr)
    {
        QQmlApplicationEngine *engine = reinterpret_cast<QQmlApplicationEngine *>(static_cast<uintptr_t>(vptr));
        QUrl *qurl = reinterpret_cast<QUrl *>(static_cast<uintptr_t>(urlPtr));
        engine->load(*qurl);
    }

    void nativeQmlApplicationAngineDelete(long vptr)
    {
        QQmlApplicationEngine *engine = reinterpret_cast<QQmlApplicationEngine *>(static_cast<uintptr_t>(vptr));
        delete engine;
    }
}