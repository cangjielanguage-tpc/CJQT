#ifndef __BASE_WIDGET_H_
#define __BASE_WIDGET_H_

#include <QWidget>
#include <QMouseEvent>
#include <QKeyEvent>
#include <QPainter>

typedef void (*nativeEventCallback)(long);

template <typename T>
class BaseWidget : public T
{
    // Q_OBJECT
public:
    BaseWidget(QWidget *parent = nullptr) : T(parent) {}
    nativeEventCallback paintEventCallback;
    nativeEventCallback mousePressEventCallback;
    nativeEventCallback mouseReleaseEventCallback;
    nativeEventCallback mouseMoveEventCallback;
    nativeEventCallback keyPressEventCallback;

protected:
    void paintEvent(QPaintEvent *event)
    {
    }

    void mousePressEvent(QMouseEvent *event)
    {
        
    }

    void mouseReleaseEvent(QMouseEvent *event)
    {
        
    }

    void mouseMoveEvent(QMouseEvent *event)
    {
        
    }

    void keyPressEvent(QKeyEvent *event)
    {
        if (keyPressEventCallback != nullptr)
        {
            keyPressEventCallback(reinterpret_cast<long>(event));
        }
    }
};

class CjQtWidget : public BaseWidget<QWidget>
{
    // Q_OBJECT
public:
    CjQtWidget(QWidget *parent = nullptr) : BaseWidget<QWidget>(parent) {}
};

#endif