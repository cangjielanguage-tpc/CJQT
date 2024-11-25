#include "paint_device.h"

extern "C"
{
    uintptr_t nativePaintDeviceCreate()
    {
        CjPaintDevice *paintDevice = new CjPaintDevice();
        return reinterpret_cast<uintptr_t>(paintDevice);
    }

    void nativePaintDeviceDelete(uintptr_t ptr)
    {
        CjPaintDevice *instance = reinterpret_cast<CjPaintDevice *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}