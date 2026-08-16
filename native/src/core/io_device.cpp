/*
 * CJQT native bindings: QIODevice (base device API). QFile inherits QIODevice,
 * so a QFile pointer can be passed to these functions.
 */
#include <QIODevice>
#include <QFile>
#include <QBuffer>
#include "native_string.h"

extern "C"
{
    uintptr_t nativeIoDeviceCreate()
    {
        // QBuffer is a concrete QIODevice; used as a generic in-memory device.
        return reinterpret_cast<uintptr_t>(new QBuffer());
    }

    void nativeIoDeviceDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QIODevice *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeIoDeviceOpen(uintptr_t ptr, int mode)
    {
        return reinterpret_cast<QIODevice *>(static_cast<uintptr_t>(ptr))->open(
            static_cast<QIODevice::OpenMode>(mode));
    }

    void nativeIoDeviceClose(uintptr_t ptr)
    {
        reinterpret_cast<QIODevice *>(static_cast<uintptr_t>(ptr))->close();
    }

    bool nativeIoDeviceIsOpen(uintptr_t ptr)
    {
        return reinterpret_cast<QIODevice *>(static_cast<uintptr_t>(ptr))->isOpen();
    }

    bool nativeIoDeviceIsReadable(uintptr_t ptr)
    {
        return reinterpret_cast<QIODevice *>(static_cast<uintptr_t>(ptr))->isReadable();
    }

    bool nativeIoDeviceIsWritable(uintptr_t ptr)
    {
        return reinterpret_cast<QIODevice *>(static_cast<uintptr_t>(ptr))->isWritable();
    }

    intptr_t nativeIoDeviceSize(uintptr_t ptr)
    {
        return reinterpret_cast<QIODevice *>(static_cast<uintptr_t>(ptr))->size();
    }

    intptr_t nativeIoDeviceBytesAvailable(uintptr_t ptr)
    {
        return reinterpret_cast<QIODevice *>(static_cast<uintptr_t>(ptr))->bytesAvailable();
    }

    bool nativeIoDeviceAtEnd(uintptr_t ptr)
    {
        return reinterpret_cast<QIODevice *>(static_cast<uintptr_t>(ptr))->atEnd();
    }

    char *nativeIoDeviceReadAll(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QIODevice *>(static_cast<uintptr_t>(ptr))->readAll());
    }

    intptr_t nativeIoDeviceWrite(uintptr_t ptr, const char *data)
    {
        return reinterpret_cast<QIODevice *>(static_cast<uintptr_t>(ptr))->write(data);
    }

}
