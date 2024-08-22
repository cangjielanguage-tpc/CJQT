#include "cj_object.h"

extern "C"
{
    uintptr_t nativeObjectCreate(uintptr_t parentPtr)
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
        return reinterpret_cast<uintptr_t>(obj);
    }
    void nativeObjectDelete(uintptr_t ptr)
    {
        CjObject *instance = reinterpret_cast<CjObject *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}