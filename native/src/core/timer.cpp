#include "timer.h"

extern "C"
{
    uintptr_t nativeTimerCreate(nativeTimerCallback callback, int interval){
        CjQtTimer *timer = new CjQtTimer(callback);
        timer->setInterval(interval);
        return reinterpret_cast<uintptr_t>(timer);
    }

    void nativeTimerDelete(uintptr_t ptr)
    {
        CjQtTimer *instance = reinterpret_cast<CjQtTimer *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeTimerStart(uintptr_t ptr)
    {
        CjQtTimer *instance = reinterpret_cast<CjQtTimer *>(static_cast<uintptr_t>(ptr));
        instance->start();
    }

    void nativeTimerStop(uintptr_t ptr)
    {
        CjQtTimer *instance = reinterpret_cast<CjQtTimer *>(static_cast<uintptr_t>(ptr));
        instance->stop();
    }
}