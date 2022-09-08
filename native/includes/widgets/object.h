#ifndef __BASE_OBJECT_H_
#define __BASE_OBJECT_H_

#include <QMouseEvent>
#include <QKeyEvent>
#include <QPainter>
#include <QString>

#include "config.h"

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
            func;                                                                                           \
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
            func;                                                                                                     \
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
            func;                                                                                                         \
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
            func;                                                                                                   \
        }                                                                                                           \
    }

#define KEY_PRESS_EVENT(func)                                                                                     \
    void keyPressEvent(QKeyEvent *event)                                                                          \
    {                                                                                                             \
        nativeEventCallback keyPressEventCallback = appConfig->keyPressEventMapGet(reinterpret_cast<long>(this)); \
        if (keyPressEventCallback != nullptr)                                                                     \
        {                                                                                                         \
            keyPressEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));                   \
        }                                                                                                         \
        else                                                                                                      \
        {                                                                                                         \
            func;                                                                                                 \
        }                                                                                                         \
    }

#define EVENT(func)                                                                                   \
    bool event(QEvent *event)                                                                         \
    {                                                                                                 \
        nativeEventCallbackBool eventCallback = appConfig->eventMapGet(reinterpret_cast<long>(this)); \
        if (eventCallback != nullptr)                                                                 \
        {                                                                                             \
            eventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));               \
        }                                                                                             \
        else                                                                                          \
        {                                                                                             \
            func;                                                                                     \
        }                                                                                             \
    }

extern "C"
{
    extern Config *appConfig;
}

#endif