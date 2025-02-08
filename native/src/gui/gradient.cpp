#include <QGradient>
#include <QColor>
extern "C"
{

    void nativeGradientSetColorAt(uintptr_t ptr,qreal pos, int color){
        QGradient *linear = reinterpret_cast<QGradient *>(static_cast<uintptr_t>(ptr));
        linear->setColorAt(pos,QColor(color));
//        linear->setColorAt(0.3, Qt::red);//设置从0-30%的区域为红色
//        linear->setColorAt(0.6, Qt::blue);//设置30%-60%的区域为绿色
//        linear->setColorAt(1.0, Qt::green);//设置60%-100%的区域为蓝色

    }
}