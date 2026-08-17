/*
 * CJQT native bindings: QCameraInfo, QCamera, QVideoWidget
 */
#include <QCameraInfo>
#include <QCamera>
#include <QVideoWidget>
#include <QObject>
#include "object.h"
#include "native_string.h"

extern "C"
{
    // ---- QCameraInfo ----

    uintptr_t nativeCameraInfoDefault()
    {
        return reinterpret_cast<uintptr_t>(new QCameraInfo(QCameraInfo::defaultCamera()));
    }

    void nativeCameraInfoDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QCameraInfo *>(static_cast<uintptr_t>(ptr));
    }

    char *nativeCameraInfoDeviceName(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QCameraInfo *>(static_cast<uintptr_t>(ptr))->deviceName());
    }

    char *nativeCameraInfoDescription(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QCameraInfo *>(static_cast<uintptr_t>(ptr))->description());
    }

    bool nativeCameraInfoIsNull(uintptr_t ptr)
    {
        return reinterpret_cast<QCameraInfo *>(static_cast<uintptr_t>(ptr))->isNull();
    }

    int nativeCameraInfoPosition(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QCameraInfo *>(static_cast<uintptr_t>(ptr))->position());
    }

    // ---- QCamera ----

    uintptr_t nativeCameraCreate(uintptr_t infoPtr, uintptr_t parentPtr)
    {
        QCameraInfo *info = reinterpret_cast<QCameraInfo *>(static_cast<uintptr_t>(infoPtr));
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QCamera(*info, parent));
    }

    void nativeCameraDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QCamera *>(static_cast<uintptr_t>(ptr));
    }

    void nativeCameraStart(uintptr_t ptr)
    {
        reinterpret_cast<QCamera *>(static_cast<uintptr_t>(ptr))->start();
    }

    void nativeCameraStop(uintptr_t ptr)
    {
        reinterpret_cast<QCamera *>(static_cast<uintptr_t>(ptr))->stop();
    }

    int nativeCameraState(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QCamera *>(static_cast<uintptr_t>(ptr))->state());
    }

    bool nativeCameraIsAvailable(uintptr_t ptr)
    {
        return reinterpret_cast<QCamera *>(static_cast<uintptr_t>(ptr))->isAvailable();
    }

    void nativeCameraSetCaptureMode(uintptr_t ptr, int mode)
    {
        reinterpret_cast<QCamera *>(static_cast<uintptr_t>(ptr))->setCaptureMode(
            static_cast<QCamera::CaptureMode>(mode));
    }

    int nativeCameraCaptureMode(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QCamera *>(static_cast<uintptr_t>(ptr))->captureMode());
    }

    int nativeCameraStatus(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QCamera *>(static_cast<uintptr_t>(ptr))->status());
    }

    // ---- QVideoWidget ----

    uintptr_t nativeVideoWidgetCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QVideoWidget(parent));
    }

    void nativeVideoWidgetDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QVideoWidget *>(static_cast<uintptr_t>(ptr));
    }

    void nativeVideoWidgetSetFullScreen(uintptr_t ptr, bool b)
    {
        reinterpret_cast<QVideoWidget *>(static_cast<uintptr_t>(ptr))->setFullScreen(b);
    }

    bool nativeVideoWidgetIsFullScreen(uintptr_t ptr)
    {
        return reinterpret_cast<QVideoWidget *>(static_cast<uintptr_t>(ptr))->isFullScreen();
    }
}
