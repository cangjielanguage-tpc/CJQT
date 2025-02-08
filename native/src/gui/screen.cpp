#include <QScreen>
#include <QRect>
#include <QDebug>
extern "C"
{
    QRect nativeScreenGeometry(uintptr_t ptr){
        QScreen *screen = reinterpret_cast<QScreen *>(static_cast<uintptr_t>(ptr));
        QRect geometry = screen->geometry();
//        QRect *r=new QRect(geometry.x(),geometry.y(),geometry.width(),geometry.height());
//        return reinterpret_cast<uintptr_t>(r);
//        Rect r={geometry.x(),geometry.y(),geometry.width(),geometry.height()};
//        qDebug()<<geometry.width()<<endl;
//         qDebug()<<r.width<<endl;

        return geometry;
    }
}
