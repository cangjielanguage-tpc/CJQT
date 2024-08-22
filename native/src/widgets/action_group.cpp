#include <QActionGroup>

extern "C"
{
    uintptr_t nativeActionGroupCreate(uintptr_t parentPtr)
    {
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        QActionGroup *group = new QActionGroup(parent);
        return reinterpret_cast<uintptr_t>(group);
    }

    void nativeActionGroupDelete(uintptr_t ptr)
    {
        QActionGroup *instance = reinterpret_cast<QActionGroup *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    uintptr_t nativeActionGroupAddAction(uintptr_t ptr, uintptr_t actionPtr)
    {
        QActionGroup *instance = reinterpret_cast<QActionGroup *>(static_cast<uintptr_t>(ptr));
        QAction *action = reinterpret_cast<QAction *>(static_cast<uintptr_t>(actionPtr));
        QAction *newAction = instance->addAction(action);
        return reinterpret_cast<uintptr_t>(newAction);
    }
}