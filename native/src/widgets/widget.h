#ifndef __BASE_WIDGET_H_
#define __BASE_WIDGET_H_

#include <QWidget>
#include <QMouseEvent>
#include <QKeyEvent>
#include <QPainter>

typedef void (*nativeEventCallback)(long, long);

template <typename T>
class BaseWidget : public T
{
    // Q_OBJECT
public:
    BaseWidget(QWidget *parent = nullptr) : T(parent) {}
    nativeEventCallback paintEventCallback = nullptr;
    nativeEventCallback mousePressEventCallback = nullptr;
    nativeEventCallback mouseReleaseEventCallback = nullptr;
    nativeEventCallback mouseMoveEventCallback = nullptr;
    nativeEventCallback keyPressEventCallback = nullptr;

protected:
    void paintEvent(QPaintEvent *event)
    {
        if (paintEventCallback != nullptr)
        {
            paintEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));
        }
        else
        {
            T::paintEvent(event);
        }
    }

    void mousePressEvent(QMouseEvent *event)
    {
        if (mousePressEventCallback != nullptr)
        {
            mousePressEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));
        }
    }

    void mouseReleaseEvent(QMouseEvent *event)
    {
        if (mouseReleaseEventCallback != nullptr)
        {
            mouseReleaseEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));
        }
    }

    void mouseMoveEvent(QMouseEvent *event)
    {
        if (mouseMoveEventCallback != nullptr)
        {
            mouseMoveEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));
        }
    }

    void keyPressEvent(QKeyEvent *event)
    {
        if (keyPressEventCallback != nullptr)
        {
            keyPressEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));
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