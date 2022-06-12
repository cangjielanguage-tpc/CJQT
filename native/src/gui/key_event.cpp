#include <QKeyEvent>

extern "C"
{

    int nativeKeyEventGetKey(long vptr)
    {
        QKeyEvent *engine = reinterpret_cast<QKeyEvent *>(static_cast<uintptr_t>(vptr));
        return engine->key();
    }

    int nativeKeyEventGetCount(long vptr)
    {
        QKeyEvent *engine = reinterpret_cast<QKeyEvent *>(static_cast<uintptr_t>(vptr));
        return engine->count();
    }

    const char* nativeKeyEventGetText(long vptr)
    {
        QKeyEvent *engine = reinterpret_cast<QKeyEvent *>(static_cast<uintptr_t>(vptr));
        return engine->text().toStdString().c_str();
    }

    int nativeKeyEventIsAutoRepeat(long vptr)
    {
        QKeyEvent *engine = reinterpret_cast<QKeyEvent *>(static_cast<uintptr_t>(vptr));
        return engine->isAutoRepeat();
    }
}