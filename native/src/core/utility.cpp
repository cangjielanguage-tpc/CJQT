/*
 * CJQT native bindings: QElapsedTimer, QStandardPaths
 */
#include <QElapsedTimer>
#include <QStandardPaths>
#include "native_string.h"

extern "C"
{
    // ---- QElapsedTimer ----

    uintptr_t nativeElapsedTimerCreate()
    {
        return reinterpret_cast<uintptr_t>(new QElapsedTimer());
    }

    void nativeElapsedTimerDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QElapsedTimer *>(static_cast<uintptr_t>(ptr));
    }

    void nativeElapsedTimerStart(uintptr_t ptr)
    {
        reinterpret_cast<QElapsedTimer *>(static_cast<uintptr_t>(ptr))->start();
    }

    intptr_t nativeElapsedTimerRestart(uintptr_t ptr)
    {
        return reinterpret_cast<QElapsedTimer *>(static_cast<uintptr_t>(ptr))->restart();
    }

    intptr_t nativeElapsedTimerElapsed(uintptr_t ptr)
    {
        return reinterpret_cast<QElapsedTimer *>(static_cast<uintptr_t>(ptr))->elapsed();
    }

    bool nativeElapsedTimerIsValid(uintptr_t ptr)
    {
        return reinterpret_cast<QElapsedTimer *>(static_cast<uintptr_t>(ptr))->isValid();
    }

    bool nativeElapsedTimerHasExpired(uintptr_t ptr, intptr_t timeout)
    {
        return reinterpret_cast<QElapsedTimer *>(static_cast<uintptr_t>(ptr))->hasExpired(timeout);
    }

    // ---- QStandardPaths ----

    char *nativeStandardPathsWritableLocation(int location)
    {
        return cjqt_to_cstring(QStandardPaths::writableLocation(static_cast<QStandardPaths::StandardLocation>(location)));
    }

    uintptr_t nativeStandardPathsLocations(int location)
    {
        return reinterpret_cast<uintptr_t>(new QStringList(
            QStandardPaths::standardLocations(static_cast<QStandardPaths::StandardLocation>(location))));
    }
}
