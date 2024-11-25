#ifndef __PAINT_DEVICE_H_
#define __PAINT_DEVICE_H_
#include <QPaintDevice>

class CjPaintDevice : public QPaintDevice
{

public:
    CjPaintDevice() {}

public:
    QPaintEngine *paintEngine() const override
    {
        return 0;
    }
};

#endif