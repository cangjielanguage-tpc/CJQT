/*
 * CJQT native bindings: QInputMethod (static queries)
 */
#include <QInputMethod>
#include <QRectF>
#include <QGuiApplication>

extern "C"
{
    bool nativeInputMethodIsVisible()
    {
        if (QGuiApplication::inputMethod() == nullptr)
        {
            return false;
        }
        return QGuiApplication::inputMethod()->isVisible();
    }

    void nativeInputMethodSetVisible(bool visible)
    {
        if (QGuiApplication::inputMethod() != nullptr)
        {
            QGuiApplication::inputMethod()->setVisible(visible);
        }
    }

    int nativeInputMethodCursorRectangleX()
    {
        if (QGuiApplication::inputMethod() == nullptr)
        {
            return 0;
        }
        return QGuiApplication::inputMethod()->cursorRectangle().x();
    }

    int nativeInputMethodCursorRectangleY()
    {
        if (QGuiApplication::inputMethod() == nullptr)
        {
            return 0;
        }
        return QGuiApplication::inputMethod()->cursorRectangle().y();
    }
}
