#include <QEvent>

extern "C"
{
    long nativeEventCreate(int type)
    {
        QEvent *event = new QEvent(QEvent::Type(type));
        return reinterpret_cast<long>(event);
    }
    void nativeEventDelete(long ptr)
    {
        QEvent *instance = reinterpret_cast<QEvent *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    void nativeEventAccept(long ptr)
    {
        QEvent *instance = reinterpret_cast<QEvent *>(static_cast<uintptr_t>(ptr));
        return instance->accept();
    }
    void nativeEventIgnore(long ptr)
    {
        QEvent *instance = reinterpret_cast<QEvent *>(static_cast<uintptr_t>(ptr));
        return instance->ignore();
    }
    bool nativeEventIsAccepted(long ptr)
    {
        QEvent *instance = reinterpret_cast<QEvent *>(static_cast<uintptr_t>(ptr));
        return instance->isAccepted();
    }
    void nativeEventSetAccepted(long ptr, bool accepted)
    {
        QEvent *instance = reinterpret_cast<QEvent *>(static_cast<uintptr_t>(ptr));
        return instance->setAccepted(accepted);
    }
    bool nativeEventSpontaneous(long ptr)
    {
        QEvent *instance = reinterpret_cast<QEvent *>(static_cast<uintptr_t>(ptr));
        return instance->spontaneous();
    }
    int nativeEventType(long ptr)
    {
        QEvent *instance = reinterpret_cast<QEvent *>(static_cast<uintptr_t>(ptr));
        return instance->type();
    }
    int nativeEventRegisterEventType(int hint)
    {
        return QEvent::registerEventType(hint);
    }
}