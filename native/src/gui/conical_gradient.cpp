#include <QConicalGradient>
#include <QColor>
extern "C"
{

    uintptr_t nativeConicalGradientCreate(qreal cx, qreal cy, qreal startAngle){
        QConicalGradient *gradient = new QConicalGradient(cx,cy,startAngle);
        return reinterpret_cast<uintptr_t>(gradient);
    }
}
