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
#define KEY_RELEASE_EVENT(func)                                                                                       \
    void keyReleaseEvent(QKeyEvent *event)                                                                            \
    {                                                                                                                 \
        nativeEventCallback keyReleaseEventCallback = appConfig->keyReleaseEventMapGet(reinterpret_cast<long>(this)); \
        if (keyReleaseEventCallback != nullptr)                                                                       \
        {                                                                                                             \
            keyReleaseEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));                     \
        }                                                                                                             \
        else                                                                                                          \
        {                                                                                                             \
            func;                                                                                                     \
        }                                                                                                             \
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

#define HIDE_EVENT(func)                                                                                  \
    void hideEvent(QHideEvent *event)                                                                     \
    {                                                                                                     \
        nativeEventCallback hideEventCallback = appConfig->hideEventMapGet(reinterpret_cast<long>(this)); \
        if (hideEventCallback != nullptr)                                                                 \
        {                                                                                                 \
            hideEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));               \
        }                                                                                                 \
        else                                                                                              \
        {                                                                                                 \
            func;                                                                                         \
        }                                                                                                 \
    }

#define WHEEL_EVENT(func)                                                                                   \
    void wheelEvent(QWheelEvent *event)                                                                     \
    {                                                                                                       \
        nativeEventCallback wheelEventCallback = appConfig->wheelEventMapGet(reinterpret_cast<long>(this)); \
        if (wheelEventCallback != nullptr)                                                                  \
        {                                                                                                   \
            wheelEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));                \
        }                                                                                                   \
        else                                                                                                \
        {                                                                                                   \
            func;                                                                                           \
        }                                                                                                   \
    }

#define CONTEXT_MENU_EVENT(func)                                                                                        \
    void contextMenuEvent(QContextMenuEvent *event)                                                                     \
    {                                                                                                                   \
        nativeEventCallback contextMenuEventCallback = appConfig->contextMenuEventMapGet(reinterpret_cast<long>(this)); \
        if (contextMenuEventCallback != nullptr)                                                                        \
        {                                                                                                               \
            contextMenuEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));                      \
        }                                                                                                               \
        else                                                                                                            \
        {                                                                                                               \
            func;                                                                                                       \
        }                                                                                                               \
    }
#define FOCUS_OUT_EVENT(func)                                                                                     \
    void focusOutEvent(QFocusEvent *event)                                                                        \
    {                                                                                                             \
        nativeEventCallback focusOutEventCallback = appConfig->focusOutEventMapGet(reinterpret_cast<long>(this)); \
        if (focusOutEventCallback != nullptr)                                                                     \
        {                                                                                                         \
            focusOutEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));                   \
        }                                                                                                         \
        else                                                                                                      \
        {                                                                                                         \
            func;                                                                                                 \
        }                                                                                                         \
    }
#define INPUT_METHOD_EVENT(func)                                                                                        \
    void inputMethodEvent(QInputMethodEvent *event)                                                                     \
    {                                                                                                                   \
        nativeEventCallback inputMethodEventCallback = appConfig->inputMethodEventMapGet(reinterpret_cast<long>(this)); \
        if (inputMethodEventCallback != nullptr)                                                                        \
        {                                                                                                               \
            inputMethodEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));                      \
        }                                                                                                               \
        else                                                                                                            \
        {                                                                                                               \
            func;                                                                                                       \
        }                                                                                                               \
    }
// GraphicsEvent
#define GRAPHICS_CONTEXT_MENU_EVENT(func)                                                                               \
    void contextMenuEvent(QGraphicsSceneContextMenuEvent *event)                                                        \
    {                                                                                                                   \
        nativeEventCallback contextMenuEventCallback = appConfig->contextMenuEventMapGet(reinterpret_cast<long>(this)); \
        if (contextMenuEventCallback != nullptr)                                                                        \
        {                                                                                                               \
            contextMenuEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));                      \
        }                                                                                                               \
        else                                                                                                            \
        {                                                                                                               \
            func;                                                                                                       \
        }                                                                                                               \
    }
#define GRAPHICS_DRAG_ENTER_EVENT(func)                                                                             \
    void dragEnterEvent(QGraphicsSceneDragDropEvent *event)                                                         \
    {                                                                                                               \
        nativeEventCallback dragEnterEventCallback = appConfig->dragEnterEventMapGet(reinterpret_cast<long>(this)); \
        if (dragEnterEventCallback != nullptr)                                                                      \
        {                                                                                                           \
            dragEnterEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));                    \
        }                                                                                                           \
        else                                                                                                        \
        {                                                                                                           \
            func;                                                                                                   \
        }                                                                                                           \
    }

#define GRAPHICS_DRAG_LEAVE_EVENT(func)                                                                             \
    void dragLeaveEvent(QGraphicsSceneDragDropEvent *event)                                                         \
    {                                                                                                               \
        nativeEventCallback dragLeaveEventCallback = appConfig->dragLeaveEventMapGet(reinterpret_cast<long>(this)); \
        if (dragLeaveEventCallback != nullptr)                                                                      \
        {                                                                                                           \
            dragLeaveEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));                    \
        }                                                                                                           \
        else                                                                                                        \
        {                                                                                                           \
            func;                                                                                                   \
        }                                                                                                           \
    }
#define GRAPHICS_DRAG_MOVE_EVENT(func)                                                                            \
    void dragMoveEvent(QGraphicsSceneDragDropEvent *event)                                                        \
    {                                                                                                             \
        nativeEventCallback dragMoveEventCallback = appConfig->dragMoveEventMapGet(reinterpret_cast<long>(this)); \
        if (dragMoveEventCallback != nullptr)                                                                     \
        {                                                                                                         \
            dragMoveEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));                   \
        }                                                                                                         \
        else                                                                                                      \
        {                                                                                                         \
            func;                                                                                                 \
        }                                                                                                         \
    }
#define GRAPHICS_DROP_EVENT(func)                                                                         \
    void dropEvent(QGraphicsSceneDragDropEvent *event)                                                    \
    {                                                                                                     \
        nativeEventCallback dropEventCallback = appConfig->dropEventMapGet(reinterpret_cast<long>(this)); \
        if (dropEventCallback != nullptr)                                                                 \
        {                                                                                                 \
            dropEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));               \
        }                                                                                                 \
        else                                                                                              \
        {                                                                                                 \
            func;                                                                                         \
        }                                                                                                 \
    }

#define GRAPHICS_HELP_EVENT(func)                                                                         \
    void helpEvent(QGraphicsSceneHelpEvent *event)                                                        \
    {                                                                                                     \
        nativeEventCallback helpEventCallback = appConfig->helpEventMapGet(reinterpret_cast<long>(this)); \
        if (helpEventCallback != nullptr)                                                                 \
        {                                                                                                 \
            helpEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));               \
        }                                                                                                 \
        else                                                                                              \
        {                                                                                                 \
            func;                                                                                         \
        }                                                                                                 \
    }
#define GRAPHICS_MOUSE_DOUBLE_CLICK_EVENT(func)                                                                                   \
    void mouseDoubleClickEvent(QGraphicsSceneMouseEvent *event)                                                                   \
    {                                                                                                                             \
        nativeEventCallback mouseDoubleClickEventCallback = appConfig->mouseDoubleClickEventMapGet(reinterpret_cast<long>(this)); \
        if (mouseDoubleClickEventCallback != nullptr)                                                                             \
        {                                                                                                                         \
            mouseDoubleClickEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));                           \
        }                                                                                                                         \
        else                                                                                                                      \
        {                                                                                                                         \
            func;                                                                                                                 \
        }                                                                                                                         \
    }
#define GRAPHICS_MOUSE_PRESS_EVENT(func)                                                                              \
    void mousePressEvent(QGraphicsSceneMouseEvent *event)                                                             \
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
#define GRAPHICS_MOUSE_RELEASE_EVENT(func)                                                                                \
    void mouseReleaseEvent(QGraphicsSceneMouseEvent *event)                                                               \
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

#define GRAPHICS_MOUSE_MOVE_EVENT(func)                                                                             \
    void mouseMoveEvent(QGraphicsSceneMouseEvent *event)                                                            \
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
#define GRAPHICS_KEY_PRESS_EVENT(func)                                                                            \
    void keyPressEvent(QGraphicsSceneMouseEvent *event)                                                           \
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
#define GRAPHICS_WHEEL_EVENT(func)                                                                          \
    void wheelEvent(QGraphicsSceneWheelEvent *event)                                                        \
    {                                                                                                       \
        nativeEventCallback wheelEventCallback = appConfig->wheelEventMapGet(reinterpret_cast<long>(this)); \
        if (wheelEventCallback != nullptr)                                                                  \
        {                                                                                                   \
            wheelEventCallback(reinterpret_cast<long>(this), reinterpret_cast<long>(event));                \
        }                                                                                                   \
        else                                                                                                \
        {                                                                                                   \
            func;                                                                                           \
        }                                                                                                   \
    }
extern "C"
{
    extern Config *appConfig;
}

#endif