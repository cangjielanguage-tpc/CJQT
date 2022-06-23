#ifndef __PUSH_BUTTON_H_
#define __PUSH_BUTTON_H_

#include <QPushButton>
#include "widget.h"

class CjQtPushButton : public QPushButton
{
    Q_OBJECT
public:
    CjQtPushButton(QWidget *parent = nullptr) : QPushButton(parent) {}

protected:
    void paintEvent(QPaintEvent *event)
    {
        nativeEventCallback paintEventCallback = appConfig->paintEventMapGet(reinterpret_cast<long>(this));
        if (paintEventCallback != nullptr)
        {
            paintEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));
        }
        else
        {
            QPushButton::paintEvent(event);
        }
    }

    void mousePressEvent(QMouseEvent *event)
    {
        nativeEventCallback mousePressEventCallback = appConfig->mousePressEventMapGet(reinterpret_cast<long>(this));
        if (mousePressEventCallback != nullptr)
        {
            mousePressEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));
        }
        else
        {
            QPushButton::mousePressEvent(event);
        }
    }

    void mouseReleaseEvent(QMouseEvent *event)
    {
        nativeEventCallback mouseReleaseEventCallback = appConfig->mouseReleaseEventMapGet(reinterpret_cast<long>(this));
        if (mouseReleaseEventCallback != nullptr)
        {
            mouseReleaseEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));
        }
        else
        {
            QPushButton::mouseReleaseEvent(event);
        }
    }

    void mouseMoveEvent(QMouseEvent *event)
    {
        nativeEventCallback mouseMoveEventCallback = appConfig->mouseMoveEventMapGet(reinterpret_cast<long>(this));
        if (mouseMoveEventCallback != nullptr)
        {
            mouseMoveEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));
        }
        else
        {
            QPushButton::mouseMoveEvent(event);
        }
    }

    void keyPressEvent(QKeyEvent *event)
    {
        nativeEventCallback keyPressEventCallback = appConfig->keyPressEventMapGet(reinterpret_cast<long>(this));
        if (keyPressEventCallback != nullptr)
        {
            keyPressEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));
        }
    }
};

#endif