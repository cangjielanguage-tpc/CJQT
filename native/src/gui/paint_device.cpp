#include "paint_device.h"

extern "C"
{
    long nativePaintDeviceCreate()
    {
        CjPaintDevice *paintDevice = new CjPaintDevice();
        return reinterpret_cast<long>(paintDevice);
    }

    void nativePaintDeviceDelete(long ptr)
    {
        CjPaintDevice *instance = reinterpret_cast<CjPaintDevice *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}