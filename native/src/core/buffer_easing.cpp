/*
 * CJQT native bindings: QBuffer, QEasingCurve, QTimeLine
 */
#include <QBuffer>
#include <QEasingCurve>
#include <QTimeLine>
#include "native_string.h"

extern "C"
{
    // ---- QBuffer ----

    uintptr_t nativeBufferCreate()
    {
        return reinterpret_cast<uintptr_t>(new QBuffer());
    }

    void nativeBufferDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QBuffer *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeBufferOpen(uintptr_t ptr, int mode)
    {
        return reinterpret_cast<QBuffer *>(static_cast<uintptr_t>(ptr))->open(
            static_cast<QIODevice::OpenMode>(mode));
    }

    void nativeBufferSetData(uintptr_t ptr, const char *data)
    {
        reinterpret_cast<QBuffer *>(static_cast<uintptr_t>(ptr))->setData(QByteArray(data));
    }

    char *nativeBufferData(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QBuffer *>(static_cast<uintptr_t>(ptr))->data());
    }

    int nativeBufferSize(uintptr_t ptr)
    {
        return reinterpret_cast<QBuffer *>(static_cast<uintptr_t>(ptr))->size();
    }

    // ---- QEasingCurve ----

    uintptr_t nativeEasingCurveCreate(int type)
    {
        return reinterpret_cast<uintptr_t>(new QEasingCurve(static_cast<QEasingCurve::Type>(type)));
    }

    void nativeEasingCurveDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QEasingCurve *>(static_cast<uintptr_t>(ptr));
    }

    int nativeEasingCurveType(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QEasingCurve *>(static_cast<uintptr_t>(ptr))->type());
    }

    void nativeEasingCurveSetType(uintptr_t ptr, int type)
    {
        reinterpret_cast<QEasingCurve *>(static_cast<uintptr_t>(ptr))->setType(static_cast<QEasingCurve::Type>(type));
    }

    double nativeEasingCurveValueForProgress(uintptr_t ptr, double progress)
    {
        return reinterpret_cast<QEasingCurve *>(static_cast<uintptr_t>(ptr))->valueForProgress(progress);
    }

    // ---- QTimeLine ----

    uintptr_t nativeTimeLineCreate(int duration)
    {
        return reinterpret_cast<uintptr_t>(new QTimeLine(duration));
    }

    void nativeTimeLineDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QTimeLine *>(static_cast<uintptr_t>(ptr));
    }

    void nativeTimeLineStart(uintptr_t ptr)
    {
        reinterpret_cast<QTimeLine *>(static_cast<uintptr_t>(ptr))->start();
    }

    void nativeTimeLineStop(uintptr_t ptr)
    {
        reinterpret_cast<QTimeLine *>(static_cast<uintptr_t>(ptr))->stop();
    }

    void nativeTimeLineSetDuration(uintptr_t ptr, int duration)
    {
        reinterpret_cast<QTimeLine *>(static_cast<uintptr_t>(ptr))->setDuration(duration);
    }

    int nativeTimeLineDuration(uintptr_t ptr)
    {
        return reinterpret_cast<QTimeLine *>(static_cast<uintptr_t>(ptr))->duration();
    }

    int nativeTimeLineCurrentTime(uintptr_t ptr)
    {
        return reinterpret_cast<QTimeLine *>(static_cast<uintptr_t>(ptr))->currentTime();
    }

    double nativeTimeLineCurrentValue(uintptr_t ptr)
    {
        return reinterpret_cast<QTimeLine *>(static_cast<uintptr_t>(ptr))->currentValue();
    }

    int nativeTimeLineState(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QTimeLine *>(static_cast<uintptr_t>(ptr))->state());
    }

    void nativeTimeLineSetLoopCount(uintptr_t ptr, int count)
    {
        reinterpret_cast<QTimeLine *>(static_cast<uintptr_t>(ptr))->setLoopCount(count);
    }
}
