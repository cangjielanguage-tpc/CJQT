#include "timer.h"

extern "C"
{
    long nativeTimerCreate(nativeTimerCallback callback, int interval){
        CjQtTimer *timer = new CjQtTimer(callback);
        timer->setInterval(interval);
        return reinterpret_cast<long>(timer);
    }

    void nativeTimerDelete(long ptr)
    {
        CjQtTimer *instance = reinterpret_cast<CjQtTimer *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeTimerStart(long ptr)
    {
        CjQtTimer *instance = reinterpret_cast<CjQtTimer *>(static_cast<uintptr_t>(ptr));
        instance->start();
    }

    void nativeTimerStop(long ptr)
    {
        CjQtTimer *instance = reinterpret_cast<CjQtTimer *>(static_cast<uintptr_t>(ptr));
        instance->stop();
    }
}