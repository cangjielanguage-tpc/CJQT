#include "widget.h"

extern "C"
{

    // QWidget

    long nativeWidgetCreate(long appPtr)
    {
        CjQtWidget *widget = new CjQtWidget();
        widget->show();
        widget->hide();
        return reinterpret_cast<long>(widget);
    }

    void nativeWidgetDelete(long ptr)
    {
        CjQtWidget *instance = reinterpret_cast<CjQtWidget *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeWidgetSetPaintEvent(long ptr, nativeEventCallback callback){
        BaseWidget<QWidget> *instance = reinterpret_cast<BaseWidget<QWidget> *>(static_cast<uintptr_t>(ptr));
        instance->paintEventCallback = callback;
    }

    void nativeWidgetSetMousePressEvent(long ptr, nativeEventCallback callback){
        BaseWidget<QWidget> *instance = reinterpret_cast<BaseWidget<QWidget> *>(static_cast<uintptr_t>(ptr));
        instance->mousePressEventCallback = callback;
    }

    void nativeWidgetSetMouseReleaseEvent(long ptr, nativeEventCallback callback){
        BaseWidget<QWidget> *instance = reinterpret_cast<BaseWidget<QWidget> *>(static_cast<uintptr_t>(ptr));
        instance->mouseReleaseEventCallback = callback;
    }

    void nativeWidgetSetMouseMoveEvent(long ptr, nativeEventCallback callback){
        BaseWidget<QWidget> *instance = reinterpret_cast<BaseWidget<QWidget> *>(static_cast<uintptr_t>(ptr));
        instance->mouseMoveEventCallback = callback;
    }

    void nativeWidgetSetKeyPressEvent(long ptr, nativeEventCallback callback){
        BaseWidget<QWidget> *instance = reinterpret_cast<BaseWidget<QWidget> *>(static_cast<uintptr_t>(ptr));
        instance->keyPressEventCallback = callback;
    }

    void nativeWidgetResize(long ptr, int w, int h)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->resize(w, h);
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
}