#include <QRadialGradient>
#include <QColor>
extern "C"
{

    uintptr_t nativeRadialGradientCreate(qreal xStart, qreal yStart, qreal radius){
        QRadialGradient *gradient = new QRadialGradient(xStart,yStart,radius);
        return reinterpret_cast<uintptr_t>(gradient);
    }

}
