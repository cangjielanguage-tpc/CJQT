/*
 * CJQT native bindings: QSystemTrayIcon, QToolTip
 */
#include <QSystemTrayIcon>
#include <QToolTip>
#include <QIcon>
#include "object.h"
#include "native_string.h"

extern "C"
{
    // ---- QSystemTrayIcon ----

    uintptr_t nativeSystemTrayIconCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QSystemTrayIcon(parent));
    }

    void nativeSystemTrayIconDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QSystemTrayIcon *>(static_cast<uintptr_t>(ptr));
    }

    void nativeSystemTrayIconSetIcon(uintptr_t ptr, uintptr_t iconPtr)
    {
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        reinterpret_cast<QSystemTrayIcon *>(static_cast<uintptr_t>(ptr))->setIcon(*icon);
    }

    void nativeSystemTrayIconSetToolTip(uintptr_t ptr, const char *tip)
    {
        reinterpret_cast<QSystemTrayIcon *>(static_cast<uintptr_t>(ptr))->setToolTip(QString::fromUtf8(tip));
    }

    char *nativeSystemTrayIconToolTip(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QSystemTrayIcon *>(static_cast<uintptr_t>(ptr))->toolTip());
    }

    void nativeSystemTrayIconSetVisible(uintptr_t ptr, bool visible)
    {
        reinterpret_cast<QSystemTrayIcon *>(static_cast<uintptr_t>(ptr))->setVisible(visible);
    }

    bool nativeSystemTrayIconIsVisible(uintptr_t ptr)
    {
        return reinterpret_cast<QSystemTrayIcon *>(static_cast<uintptr_t>(ptr))->isVisible();
    }

    void nativeSystemTrayIconShowMessage(uintptr_t ptr, const char *title, const char *message)
    {
        reinterpret_cast<QSystemTrayIcon *>(static_cast<uintptr_t>(ptr))->showMessage(QString::fromUtf8(title),
                                                                                     QString::fromUtf8(message));
    }

    // ---- QToolTip (static) ----

    void nativeToolTipShowText(int x, int y, const char *text)
    {
        QToolTip::showText(QPoint(x, y), QString::fromUtf8(text));
    }

    void nativeToolTipHideText()
    {
        QToolTip::hideText();
    }

    bool nativeToolTipIsVisible()
    {
        return QToolTip::isVisible();
    }

    char *nativeToolTipText()
    {
        return cjqt_to_cstring(QToolTip::text());
    }
}
