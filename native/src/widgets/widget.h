#ifndef __BASE_WIDGET_H_
#define __BASE_WIDGET_H_

#include <QWidget>
#include <QMouseEvent>
#include <QKeyEvent>
#include <QPainter>
#include <QString>

#include "config.h"
extern "C"
{
void nativeWidgetShow(long ptr);
void nativeWidgetResize(long ptr, int w, int h);
}

typedef void (*paintEventFunc)(QPaintEvent *event);

#define PAINT_EVENT(func)                                                                                   \
    void paintEvent(QPaintEvent *event)                                                                     \
    {                                                                                                       \
        nativeEventCallback paintEventCallback = appConfig->paintEventMapGet(reinterpret_cast<long>(this)); \
        if (paintEventCallback != nullptr)                                                                  \
        {                                                                                                   \
            paintEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));                \
        }                                                                                                   \
        else                                                                                                \
        {                                                                                                   \
            func;                                                                                    \
        }                                                                                                   \
    }

#define MOUSE_PRESS_EVENT(func)                                                                                       \
    void mousePressEvent(QMouseEvent *event)                                                                          \
    {                                                                                                                 \
        nativeEventCallback mousePressEventCallback = appConfig->mousePressEventMapGet(reinterpret_cast<long>(this)); \
        if (mousePressEventCallback != nullptr)                                                                       \
        {                                                                                                             \
            mousePressEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));                     \
        }                                                                                                             \
        else                                                                                                          \
        {                                                                                                             \
            func;                                                                                              \
        }                                                                                                             \
    }

#define MOUSE_RELEASE_EVENT(func)                                                                                         \
    void mouseReleaseEvent(QMouseEvent *event)                                                                            \
    {                                                                                                                     \
        nativeEventCallback mouseReleaseEventCallback = appConfig->mouseReleaseEventMapGet(reinterpret_cast<long>(this)); \
        if (mouseReleaseEventCallback != nullptr)                                                                         \
        {                                                                                                                 \
            mouseReleaseEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));                       \
        }                                                                                                                 \
        else                                                                                                              \
        {                                                                                                                 \
            func;                                                                                                  \
        }                                                                                                                 \
    }

#define MOUSE_MOVE_EVENT(func)                                                                                      \
    void mouseMoveEvent(QMouseEvent *event)                                                                         \
    {                                                                                                               \
        nativeEventCallback mouseMoveEventCallback = appConfig->mouseMoveEventMapGet(reinterpret_cast<long>(this)); \
        if (mouseMoveEventCallback != nullptr)                                                                      \
        {                                                                                                           \
            mouseMoveEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));                    \
        }                                                                                                           \
        else                                                                                                        \
        {                                                                                                           \
            func;                                                                                            \
        }                                                                                                           \
    }

#define KEY_PRESS_EVENT                                                                                           \
    void keyPressEvent(QKeyEvent *event)                                                                          \
    {                                                                                                             \
        nativeEventCallback keyPressEventCallback = appConfig->keyPressEventMapGet(reinterpret_cast<long>(this)); \
        if (keyPressEventCallback != nullptr)                                                                     \
        {                                                                                                         \
            keyPressEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));                   \
        }                                                                                                         \
    }

extern "C"
{
    extern Config *appConfig;
}

class CjQtWidget : public QWidget
{
    Q_OBJECT
public:
    CjQtWidget(QWidget *parent = nullptr) : QWidget(parent) {}

protected:
    PAINT_EVENT(QWidget::paintEvent(event))

    MOUSE_PRESS_EVENT(QWidget::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QWidget::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QWidget::mouseMoveEvent(event))

    KEY_PRESS_EVENT
};

#endif