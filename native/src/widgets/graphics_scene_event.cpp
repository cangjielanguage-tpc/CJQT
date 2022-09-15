#include <QGraphicsSceneEvent>

extern "C"
{
    void nativeGraphicsSceneEventDelete(long ptr)
    {
        QGraphicsSceneEvent *instance = reinterpret_cast<QGraphicsSceneEvent *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}