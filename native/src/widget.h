#ifndef __NATIVE_WIDGET_H_
#define __NATIVE_WIDGET_H_

#include <QWidget>
#include <QMouseEvent>
#include <QKeyEvent>
#include <QPainter>

typedef void (*nativeEventCallback)(long);

class CjQtWidget : public QWidget
{
    //Q_OBJECT
public:
    CjQtWidget(QWidget *parent): QWidget(parent){}
    nativeEventCallback paintEventCallback;
    nativeEventCallback mousePressEventCallback;
    nativeEventCallback mouseReleaseEventCallback;
    nativeEventCallback mouseMoveEventCallback;
    nativeEventCallback keyPressEventCallback;

protected:
    void paintEvent(QPaintEvent *event)
    {
        (*paintEventCallback)(reinterpret_cast<long>(event));
    }
    void mousePressEvent(QMouseEvent *event)
    {
        (*mousePressEventCallback)(reinterpret_cast<long>(event));
    }
    void mouseReleaseEvent(QMouseEvent *event)
    {
        (*mouseReleaseEventCallback)(reinterpret_cast<long>(event));
    }
    void mouseMoveEvent(QMouseEvent *event)
    {
        (*mouseMoveEventCallback)(reinterpret_cast<long>(event));
    }
    void keyPressEvent(QKeyEvent *event)
    {
        (*keyPressEventCallback)(reinterpret_cast<long>(event));
    }
};

#endif