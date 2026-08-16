/*
 * CJQT native bindings: QWindow, QSurfaceFormat, QColorSpace, QPicture
 */
#include <QWindow>
#include <QSurfaceFormat>
#include <QColorSpace>
#include <QPicture>
#include "native_string.h"

extern "C"
{
    // ---- QWindow ----

    uintptr_t nativeWindowCreate()
    {
        return reinterpret_cast<uintptr_t>(new QWindow());
    }

    void nativeWindowDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QWindow *>(static_cast<uintptr_t>(ptr));
    }

    void nativeWindowSetTitle(uintptr_t ptr, const char *title)
    {
        reinterpret_cast<QWindow *>(static_cast<uintptr_t>(ptr))->setTitle(QString::fromUtf8(title));
    }

    char *nativeWindowTitle(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QWindow *>(static_cast<uintptr_t>(ptr))->title());
    }

    void nativeWindowShow(uintptr_t ptr)
    {
        reinterpret_cast<QWindow *>(static_cast<uintptr_t>(ptr))->show();
    }

    void nativeWindowHide(uintptr_t ptr)
    {
        reinterpret_cast<QWindow *>(static_cast<uintptr_t>(ptr))->hide();
    }

    bool nativeWindowIsVisible(uintptr_t ptr)
    {
        return reinterpret_cast<QWindow *>(static_cast<uintptr_t>(ptr))->isVisible();
    }

    int nativeWindowWidth(uintptr_t ptr)
    {
        return reinterpret_cast<QWindow *>(static_cast<uintptr_t>(ptr))->width();
    }

    int nativeWindowHeight(uintptr_t ptr)
    {
        return reinterpret_cast<QWindow *>(static_cast<uintptr_t>(ptr))->height();
    }

    // ---- QSurfaceFormat ----

    uintptr_t nativeSurfaceFormatCreate()
    {
        return reinterpret_cast<uintptr_t>(new QSurfaceFormat());
    }

    void nativeSurfaceFormatDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QSurfaceFormat *>(static_cast<uintptr_t>(ptr));
    }

    void nativeSurfaceFormatSetRedBufferSize(uintptr_t ptr, int size)
    {
        reinterpret_cast<QSurfaceFormat *>(static_cast<uintptr_t>(ptr))->setRedBufferSize(size);
    }

    int nativeSurfaceFormatRedBufferSize(uintptr_t ptr)
    {
        return reinterpret_cast<QSurfaceFormat *>(static_cast<uintptr_t>(ptr))->redBufferSize();
    }

    void nativeSurfaceFormatSetDepthBufferSize(uintptr_t ptr, int size)
    {
        reinterpret_cast<QSurfaceFormat *>(static_cast<uintptr_t>(ptr))->setDepthBufferSize(size);
    }

    int nativeSurfaceFormatDepthBufferSize(uintptr_t ptr)
    {
        return reinterpret_cast<QSurfaceFormat *>(static_cast<uintptr_t>(ptr))->depthBufferSize();
    }

    void nativeSurfaceFormatSetSwapInterval(uintptr_t ptr, int interval)
    {
        reinterpret_cast<QSurfaceFormat *>(static_cast<uintptr_t>(ptr))->setSwapInterval(interval);
    }

    int nativeSurfaceFormatSwapInterval(uintptr_t ptr)
    {
        return reinterpret_cast<QSurfaceFormat *>(static_cast<uintptr_t>(ptr))->swapInterval();
    }

    // ---- QColorSpace ----

    uintptr_t nativeColorSpaceCreate()
    {
        return reinterpret_cast<uintptr_t>(new QColorSpace());
    }

    void nativeColorSpaceDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QColorSpace *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeColorSpaceIsValid(uintptr_t ptr)
    {
        return reinterpret_cast<QColorSpace *>(static_cast<uintptr_t>(ptr))->isValid();
    }

    // ---- QPicture ----

    uintptr_t nativePictureCreate()
    {
        return reinterpret_cast<uintptr_t>(new QPicture());
    }

    void nativePictureDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QPicture *>(static_cast<uintptr_t>(ptr));
    }

    bool nativePictureIsNull(uintptr_t ptr)
    {
        return reinterpret_cast<QPicture *>(static_cast<uintptr_t>(ptr))->isNull();
    }

    int nativePictureWidth(uintptr_t ptr)
    {
        return reinterpret_cast<QPicture *>(static_cast<uintptr_t>(ptr))->width();
    }

    int nativePictureHeight(uintptr_t ptr)
    {
        return reinterpret_cast<QPicture *>(static_cast<uintptr_t>(ptr))->height();
    }
}
