#include <QEvent>

extern "C"
{
    uintptr_t nativeEventCreate(int type)
    {
        QEvent *event = new QEvent(QEvent::Type(type));
        return reinterpret_cast<uintptr_t>(event);
    }
    void nativeEventDelete(uintptr_t ptr)
    {
        QEvent *instance = reinterpret_cast<QEvent *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    void nativeEventAccept(uintptr_t ptr)
    {
        QEvent *instance = reinterpret_cast<QEvent *>(static_cast<uintptr_t>(ptr));
        return instance->accept();
    }
    void nativeEventIgnore(uintptr_t ptr)
    {
        QEvent *instance = reinterpret_cast<QEvent *>(static_cast<uintptr_t>(ptr));
        return instance->ignore();
    }
    bool nativeEventIsAccepted(uintptr_t ptr)
    {
        QEvent *instance = reinterpret_cast<QEvent *>(static_cast<uintptr_t>(ptr));
        return instance->isAccepted();
    }
    void nativeEventSetAccepted(uintptr_t ptr, bool accepted)
    {
        QEvent *instance = reinterpret_cast<QEvent *>(static_cast<uintptr_t>(ptr));
        return instance->setAccepted(accepted);
    }
    bool nativeEventSpontaneous(uintptr_t ptr)
    {
        QEvent *instance = reinterpret_cast<QEvent *>(static_cast<uintptr_t>(ptr));
        return instance->spontaneous();
    }
    int nativeEventType(uintptr_t ptr)
    {
        QEvent *instance = reinterpret_cast<QEvent *>(static_cast<uintptr_t>(ptr));
        return instance->type();
    }
    int nativeEventRegisterEventType(int hint)
    {
        return QEvent::registerEventType(hint);
    }
}