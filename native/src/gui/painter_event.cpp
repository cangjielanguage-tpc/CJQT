#include <QPaintEvent>

extern "C"
{
    uintptr_t nativePainterEventGetRect(uintptr_t vptr)
    {
        QPaintEvent *engine = reinterpret_cast<QPaintEvent *>(static_cast<uintptr_t>(vptr));
        return reinterpret_cast<uintptr_t>(&engine->rect());
    }

    uintptr_t nativePainterEventGetRegion(uintptr_t vptr)
    {
        QPaintEvent *engine = reinterpret_cast<QPaintEvent *>(static_cast<uintptr_t>(vptr));
        return reinterpret_cast<uintptr_t>(&engine->region());
    }
}