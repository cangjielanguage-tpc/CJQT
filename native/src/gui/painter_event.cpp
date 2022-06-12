#include <QPaintEvent>

extern "C"
{
    long nativePainterEventGetRect(long vptr)
    {
        QPaintEvent *engine = reinterpret_cast<QPaintEvent *>(static_cast<uintptr_t>(vptr));
        return reinterpret_cast<long>(&engine->rect());
    }

    long nativePainterEventGetRegion(long vptr)
    {
        QPaintEvent *engine = reinterpret_cast<QPaintEvent *>(static_cast<uintptr_t>(vptr));
        return reinterpret_cast<long>(&engine->region());
    }
}