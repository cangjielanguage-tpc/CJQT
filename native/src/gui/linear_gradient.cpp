#include <QLinearGradient>
#include <QColor>
extern "C"
{

    uintptr_t nativeLinearGradientCreate(qreal xStart, qreal yStart, qreal xFinalStop, qreal yFinalStop){
        QLinearGradient *linear = new QLinearGradient(xStart,yStart,xFinalStop,yFinalStop);
        return reinterpret_cast<uintptr_t>(linear);
    }
}
