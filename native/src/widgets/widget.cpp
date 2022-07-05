#include "widget.h"
#include <QPalette>

extern "C"
{

    // QWidget

    // extern Config *appConfig;

    long nativeWidgetCreate(long parentPtr)
    {
        APPLICATION_CREATE
        CjQtWidget *widget;
        if (parentPtr == 0L)
        {
            widget = new CjQtWidget();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            widget = new CjQtWidget(parent);
        }
        return reinterpret_cast<long>(widget);
    }

    void nativeWidgetDelete(long ptr)
    {
        appConfig->paintEventMapRemove(ptr);
        appConfig->mousePressEventMapRemove(ptr);
        appConfig->mouseReleaseEventMapRemove(ptr);
        appConfig->mouseMoveEventMapRemove(ptr);
        appConfig->keyPressEventMapRemove(ptr);
        CjQtWidget *instance = reinterpret_cast<CjQtWidget *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeWidgetSetPaintEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->paintEventMapPut(ptr, callback);
    }

    void nativeWidgetSetMousePressEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->mousePressEventMapPut(ptr, callback);
    }

    void nativeWidgetSetMouseReleaseEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->mouseReleaseEventMapPut(ptr, callback);
    }

    void nativeWidgetSetMouseMoveEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->mouseMoveEventMapPut(ptr, callback);
    }

    void nativeWidgetSetKeyPressEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->keyPressEventMapPut(ptr, callback);
    }

    void nativeWidgetSetLayout(long ptr, long layoutPtr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        QLayout *layout = reinterpret_cast<QLayout *>(static_cast<uintptr_t>(layoutPtr));
        instance->setLayout(layout);
    }

    void nativeWidgetResize(long ptr, int w, int h)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->resize(w, h);
    }

    void nativeWidgetSetFixedSize(long ptr, int w, int h)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->setFixedSize(w, h);
    }

    void nativeWidgetShow(long ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->show();
    }

    void nativeWidgetHide(long ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->hide();
    }

    void nativeWidgetShowMinimized(long ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->showMinimized();
    }

    void nativeWidgetShowMaximized(long ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->showMaximized();
    }

    void nativeWidgetShowFullScreen(long ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->showFullScreen();
    }

    void nativeWidgetShowNormal(long ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->showNormal();
    }

    void nativeWidgetClose(long ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->close();
    }

    void nativeWidgetMove(long ptr, int ax, int ay)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->move(ax, ay);
    }

    void nativeWidgetSetWindowTitle(long ptr, const char *title)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->setWindowTitle(title);
    }

    void nativeWidgetRepaint(long ptr)
    {
        CjQtWidget *instance = reinterpret_cast<CjQtWidget *>(static_cast<uintptr_t>(ptr));
        instance->repaint();
    }

    void nativeWidgetSetPalette(long ptr, long palettePtr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        QPalette *palette = reinterpret_cast<QPalette *>(static_cast<uintptr_t>(palettePtr));
        instance->setPalette(*palette);
    }

    void nativeWidgetSetAutoFillBackground(long ptr, int enabled)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->setAutoFillBackground(enabled == 1);
    }

    void nativeWidgetSetGeometry(long ptr, int ax, int ay, int aw, int ah)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->setGeometry(ax, ay, aw, ah);
    }

    void nativeWidgetSetFont(long ptr, long fontPtr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        QFont *font = reinterpret_cast<QFont *>(static_cast<uintptr_t>(fontPtr));
        instance->setFont(*font);
    }
}