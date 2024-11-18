#include <QScreen>
#include <QRect>
extern "C"
{
    uintptr_t nativeScreenGeometry(uintptr_t ptr){
        QScreen *screen = reinterpret_cast<QScreen *>(static_cast<uintptr_t>(ptr));
        QRect geometry = screen->geometry();
        return reinterpret_cast<uintptr_t>(&geometry);
    }
}
