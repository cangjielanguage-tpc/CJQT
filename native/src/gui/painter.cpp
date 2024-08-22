#include <QPainter>
#include <QWidget>
#include <QPen>
#include <QBrush>
#include <QPixmap>

extern "C"
{
    uintptr_t nativePainterCreate(uintptr_t widgetPtr)
    {
        QPainter *painter;
        if (widgetPtr == 0L)
        {
            painter = new QPainter();
        }
        else
        {
            QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
            painter = new QPainter(widget);
        }
        return reinterpret_cast<uintptr_t>(painter);
    }
    uintptr_t nativePainterCreateWithDevice(uintptr_t devicePtr)
    {
        QPainter *painter;
        if (devicePtr == 0L)
        {
            painter = new QPainter();
        }
        else
        {
            QPaintDevice *device = reinterpret_cast<QPaintDevice *>(static_cast<uintptr_t>(devicePtr));
            painter = new QPainter(device);
        }
        return reinterpret_cast<uintptr_t>(painter);
    }
    void nativePainterSetPen(uintptr_t ptr, uintptr_t penPtr)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QPen *pen = reinterpret_cast<QPen *>(static_cast<uintptr_t>(penPtr));
        instance->setPen(*pen);
    }
    void nativePainterSetBrush(uintptr_t ptr, uintptr_t brushPtr)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QBrush *brush = reinterpret_cast<QBrush *>(static_cast<uintptr_t>(brushPtr));
        instance->setBrush(*brush);
    }
    void nativePainterSetOpacity(uintptr_t ptr, float opacity)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        instance->setOpacity(opacity);
    }
    void nativePainterDrawLine(uintptr_t ptr, int x, int y, int x2, int y2)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        instance->drawLine(x, y, x2, y2);
    }
    void nativePainterDrawRect(uintptr_t ptr, int x, int y, int width, int height)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        instance->drawRect(x, y, width, height);
    }
    void nativePainterDrawPixmap(uintptr_t ptr, int x, int y,
                                 int width, int height, uintptr_t pixmapPtr)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QPixmap *pixmap = reinterpret_cast<QPixmap *>(static_cast<uintptr_t>(pixmapPtr));
        instance->drawPixmap(x, y, width, height, *pixmap);
    }

    void nativePainterDelete(uintptr_t ptr)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    void nativePainterTranslate(uintptr_t ptr, double dx, double dy)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        instance->translate(dx, dy);
    }
    void nativePainterTranslateWithPoint(uintptr_t ptr, const uintptr_t pointPrt)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QPoint *point = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(pointPrt));
        instance->translate(*point);
    }
    void nativePainterTranslateWithPointF(uintptr_t ptr, const uintptr_t pointFPrt)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QPointF *pointF = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(pointFPrt));
        instance->translate(*pointF);
    }

    void nativePainterDrawPolyline(uintptr_t ptr, const uintptr_t polygonFPtr)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QPolygonF *polygon = reinterpret_cast<QPolygonF *>(static_cast<uintptr_t>(polygonFPtr));
        instance->drawPolyline(*polygon);
    }
}