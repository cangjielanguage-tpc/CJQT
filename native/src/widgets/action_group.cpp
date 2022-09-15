#include <QActionGroup>

extern "C"
{
    long nativeActionGroupCreate(long parentPtr)
    {
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        QActionGroup *group = new QActionGroup(parent);
        return reinterpret_cast<long>(group);
    }

    void nativeActionGroupDelete(long ptr)
    {
        QActionGroup *instance = reinterpret_cast<QActionGroup *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    long nativeActionGroupAddAction(long ptr, long actionPtr)
    {
        QActionGroup *instance = reinterpret_cast<QActionGroup *>(static_cast<uintptr_t>(ptr));
        QAction *action = reinterpret_cast<QAction *>(static_cast<uintptr_t>(actionPtr));
        QAction *newAction = instance->addAction(action);
        return reinterpret_cast<long>(newAction);
    }
}