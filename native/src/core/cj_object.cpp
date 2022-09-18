#include "cj_object.h"

extern "C"
{
    long nativeObjectCreate(long parentPtr)
    {
        CjObject *obj;
        if (parentPtr == 0l)
        {
            obj = new CjObject();
        }
        else
        {
            QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
            obj = new CjObject(parent);
        }
        return reinterpret_cast<long>(obj);
    }
    void nativeObjectDelete(long ptr)
    {
        CjObject *instance = reinterpret_cast<CjObject *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}