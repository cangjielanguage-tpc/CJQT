#include "widget.h"
#include <QPalette>

extern "C"
{

    // QWidget

    // extern Config *appConfig;

    uintptr_t nativeWidgetCreate(uintptr_t parentPtr)
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
        return reinterpret_cast<uintptr_t>(widget);
    }

    void nativeWidgetDelete(uintptr_t ptr)
    {
        appConfig->callbackMapRemove((char *)"paintEvent", ptr);
        appConfig->callbackMapRemove((char *)"mousePressEvent", ptr);
        appConfig->callbackMapRemove((char *)"mouseReleaseEvent", ptr);
        appConfig->callbackMapRemove((char *)"mouseMoveEvent", ptr);
        appConfig->callbackMapRemove((char *)"keyPressEvent", ptr);
        CjQtWidget *instance = reinterpret_cast<CjQtWidget *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeWidgetSetPaintEvent(uintptr_t ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"paintEvent", ptr, callback);
    }

    void nativeWidgetSetMousePressEvent(uintptr_t ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"mousePressEvent", ptr, callback);
    }

    void nativeWidgetSetMouseReleaseEvent(uintptr_t ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"mouseReleaseEvent", ptr, callback);
    }

    void nativeWidgetSetMouseMoveEvent(uintptr_t ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"mouseMoveEvent", ptr, callback);
    }

    void nativeWidgetSetKeyPressEvent(uintptr_t ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"keyPressEvent", ptr, callback);
    }

    void nativeWidgetSetLayout(uintptr_t ptr, uintptr_t layoutPtr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        QLayout *layout = reinterpret_cast<QLayout *>(static_cast<uintptr_t>(layoutPtr));
        instance->setLayout(layout);
    }

    void nativeWidgetResize(uintptr_t ptr, int w, int h)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->resize(w, h);
    }

    void nativeWidgetSetFixedSize(uintptr_t ptr, int w, int h)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->setFixedSize(w, h);
    }

    void nativeWidgetShow(uintptr_t ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->show();
    }

    void nativeWidgetHide(uintptr_t ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->hide();
    }

    bool nativeWidgetIsVisible(uintptr_t ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        return instance->isVisible();
    }

    int nativeWidgetX(uintptr_t ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        return instance->x();
    }

    int nativeWidgetY(uintptr_t ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        return instance->y();
    }

    int nativeWidgetWidth(uintptr_t ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        return instance->width();
    }

    int nativeWidgetHeight(uintptr_t ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        return instance->height();
    }

    void nativeWidgetShowMinimized(uintptr_t ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->showMinimized();
    }

    void nativeWidgetShowMaximized(uintptr_t ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->showMaximized();
    }

    void nativeWidgetShowFullScreen(uintptr_t ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->showFullScreen();
    }

    void nativeWidgetShowNormal(uintptr_t ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->showNormal();
    }

    void nativeWidgetClose(uintptr_t ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->close();
    }

    void nativeWidgetMove(uintptr_t ptr, int ax, int ay)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->move(ax, ay);
    }

    void nativeWidgetSetWindowTitle(uintptr_t ptr, const char *title)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->setWindowTitle(title);
    }

    void nativeWidgetSetWindowFlag(uintptr_t ptr, int flag, int on)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->setWindowFlag(static_cast<Qt::WindowType>(flag), on != 0);
    }

    const char *nativeWidgetWindowTitle(uintptr_t ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        QString str = instance->windowTitle();
        return qstrdup(str.toUtf8());
    }

    void nativeWidgetRepaint(uintptr_t ptr)
    {
        CjQtWidget *instance = reinterpret_cast<CjQtWidget *>(static_cast<uintptr_t>(ptr));
        instance->repaint();
    }

    void nativeWidgetSetPalette(uintptr_t ptr, uintptr_t palettePtr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        QPalette *palette = reinterpret_cast<QPalette *>(static_cast<uintptr_t>(palettePtr));
        instance->setPalette(*palette);
    }

    void nativeWidgetSetAutoFillBackground(uintptr_t ptr, int enabled)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->setAutoFillBackground(enabled == 1);
    }

    void nativeWidgetSetGeometry(uintptr_t ptr, int ax, int ay, int aw, int ah)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->setGeometry(ax, ay, aw, ah);
    }

    void nativeWidgetSetFont(uintptr_t ptr, uintptr_t fontPtr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        QFont *font = reinterpret_cast<QFont *>(static_cast<uintptr_t>(fontPtr));
        instance->setFont(*font);
    }
    void nativeWidgetSetStyleSheet(uintptr_t ptr, const char *styleSheet)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->setStyleSheet(QString(styleSheet));
    }
    void nativeWidgetSetWindowIcon(uintptr_t ptr, const uintptr_t iconPtr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        instance->setWindowIcon(*icon);
    }
    QRect nativeWidgetRect(uintptr_t ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
      //  QRect rect = instance->rect();
        // QRect *pRect = new QRect(rect);
        return instance->rect();
    }

    void nativeWidgetSetMinimumWidth(uintptr_t ptr, int width)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->setMinimumWidth(width);
    }

    void nativeWidgetSetMinimumHeight(uintptr_t ptr, int height)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->setMinimumHeight(height);
    }

    void nativeWidgetSetMaximumWidth(uintptr_t ptr, int width)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->setMaximumWidth(width);
    }

    void nativeWidgetSetMaximumHeight(uintptr_t ptr, int height)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->setMaximumHeight(height);
    }

    void nativeWidgetSetFixedWidth(uintptr_t ptr, int width)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->setFixedWidth(width);
    }

    void nativeWidgetSetFixedHeight(uintptr_t ptr, int height)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->setFixedHeight(height);
    }

    void nativeWidgetSetToolTip(uintptr_t ptr, const char *tip)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->setToolTip(tip);
    }

    const char *nativeWidgetToolTip(uintptr_t ptr)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        QString str = instance->toolTip();
        return qstrdup(str.toUtf8());
    }

    void nativeWidgetSetSizePolicy(uintptr_t ptr, int horizontal, int vertical)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->setSizePolicy(QSizePolicy::Policy(horizontal), QSizePolicy::Policy(vertical));
    }

    void nativeWidgetAreaSetAttribute(uintptr_t ptr, int attribute, bool on)
    {
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->setAttribute(Qt::WidgetAttribute(attribute), on);
    }
    void nativeWidgetUpdate(uintptr_t ptr){
        QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(ptr));
        instance->update();
    }
}
