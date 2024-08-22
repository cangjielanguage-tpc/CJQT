#include <QKeyEvent>

extern "C"
{

    int nativeKeyEventGetKey(uintptr_t vptr)
    {
        QKeyEvent *engine = reinterpret_cast<QKeyEvent *>(static_cast<uintptr_t>(vptr));
        return engine->key();
    }

    int nativeKeyEventGetCount(uintptr_t vptr)
    {
        QKeyEvent *engine = reinterpret_cast<QKeyEvent *>(static_cast<uintptr_t>(vptr));
        return engine->count();
    }

    const char* nativeKeyEventGetText(uintptr_t vptr)
    {
        QKeyEvent *engine = reinterpret_cast<QKeyEvent *>(static_cast<uintptr_t>(vptr));
        return engine->text().toStdString().c_str();
    }

    int nativeKeyEventIsAutoRepeat(uintptr_t vptr)
    {
        QKeyEvent *engine = reinterpret_cast<QKeyEvent *>(static_cast<uintptr_t>(vptr));
        return engine->isAutoRepeat();
    }
}