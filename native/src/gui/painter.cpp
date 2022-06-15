#include <QPainter>
#include <QWidget>
#include <QPen>
#include <QBrush>
#include <QPixmap>

extern "C"
{
    long nativePainterCreate(long widgetPtr)
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
        return reinterpret_cast<long>(painter);
    }

    void nativePainterSetPen(long ptr, long penPtr)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QPen *pen = reinterpret_cast<QPen *>(static_cast<uintptr_t>(penPtr));
        instance->setPen(*pen);
    }
    void nativePainterSetBrush(long ptr, long brushPtr)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QBrush *brush = reinterpret_cast<QBrush *>(static_cast<uintptr_t>(brushPtr));
        instance->setBrush(*brush);
    }
    void nativePainterSetOpacity(long ptr, float opacity)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        instance->setOpacity(opacity);
    }
    void nativePainterDrawLine(long ptr, int x, int y, int x2, int y2)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        instance->drawLine(x, y, x2, y2);
    }
    void nativePainterDrawRect(long ptr, int x, int y, int width, int height)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        instance->drawRect(x, y, width, height);
    }
    void nativePainterDrawPixmap(long ptr, int x, int y,
                              int width, int height, long pixmapPtr)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        QPixmap *pixmap = reinterpret_cast<QPixmap *>(static_cast<uintptr_t>(pixmapPtr));
        instance->drawPixmap(x, y, width, height, *pixmap);
    }

    void nativePainterDelete(long ptr)
    {
        QPainter *instance = reinterpret_cast<QPainter *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}