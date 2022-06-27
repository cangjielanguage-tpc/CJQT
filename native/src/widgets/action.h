#ifndef __ACTION_H_
#define __ACTION_H_

#include <QAction>
#include "widget.h"

class CjQtAction : public QAction
{
    // Q_OBJECT
public:
    CjQtAction(QWidget *parent = nullptr) : QAction(parent) {}

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
            //QAction::paintEvent(event);
        }
    }

    void mousePressEvent(QMouseEvent *event)
    {
        nativeEventCallback mousePressEventCallback = appConfig->mousePressEventMapGet(reinterpret_cast<long>(this));
        if (mousePressEventCallback != nullptr)
        {
            mousePressEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));
        }
    }

    void mouseReleaseEvent(QMouseEvent *event)
    {
        nativeEventCallback mouseReleaseEventCallback = appConfig->mouseReleaseEventMapGet(reinterpret_cast<long>(this));
        if (mouseReleaseEventCallback != nullptr)
        {
            mouseReleaseEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));
        }
    }

    void mouseMoveEvent(QMouseEvent *event)
    {
        nativeEventCallback mouseMoveEventCallback = appConfig->mouseMoveEventMapGet(reinterpret_cast<long>(this));
        if (mouseMoveEventCallback != nullptr)
        {
            mouseMoveEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));
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