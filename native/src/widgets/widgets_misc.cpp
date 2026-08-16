/*
 * CJQT native bindings: QSplashScreen, QProgressDialog, QTextBrowser, QItemDelegate
 */
#include <QSplashScreen>
#include <QProgressDialog>
#include <QTextBrowser>
#include <QItemDelegate>
#include <QPixmap>
#include "object.h"
#include "native_string.h"

extern "C"
{
    // ---- QSplashScreen ----

    uintptr_t nativeSplashScreenCreate(uintptr_t pixmapPtr)
    {
        APPLICATION_CREATE
        QPixmap *pixmap = reinterpret_cast<QPixmap *>(static_cast<uintptr_t>(pixmapPtr));
        return reinterpret_cast<uintptr_t>(new QSplashScreen(pixmap != nullptr ? *pixmap : QPixmap()));
    }

    void nativeSplashScreenDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QSplashScreen *>(static_cast<uintptr_t>(ptr));
    }

    void nativeSplashScreenShow(uintptr_t ptr)
    {
        reinterpret_cast<QSplashScreen *>(static_cast<uintptr_t>(ptr))->show();
    }

    void nativeSplashScreenShowMessage(uintptr_t ptr, const char *message)
    {
        reinterpret_cast<QSplashScreen *>(static_cast<uintptr_t>(ptr))->showMessage(QString::fromUtf8(message));
    }

    void nativeSplashScreenClearMessage(uintptr_t ptr)
    {
        reinterpret_cast<QSplashScreen *>(static_cast<uintptr_t>(ptr))->clearMessage();
    }

    void nativeSplashScreenFinish(uintptr_t ptr, uintptr_t widgetPtr)
    {
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        reinterpret_cast<QSplashScreen *>(static_cast<uintptr_t>(ptr))->finish(widget);
    }

    // ---- QProgressDialog ----

    uintptr_t nativeProgressDialogCreate(const char *label, const char *cancelText, int min, int max,
                                         uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QProgressDialog(QString::fromUtf8(label), QString::fromUtf8(cancelText),
                                                               min, max, parent));
    }

    void nativeProgressDialogDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QProgressDialog *>(static_cast<uintptr_t>(ptr));
    }

    void nativeProgressDialogSetValue(uintptr_t ptr, int value)
    {
        reinterpret_cast<QProgressDialog *>(static_cast<uintptr_t>(ptr))->setValue(value);
    }

    int nativeProgressDialogValue(uintptr_t ptr)
    {
        return reinterpret_cast<QProgressDialog *>(static_cast<uintptr_t>(ptr))->value();
    }

    void nativeProgressDialogSetRange(uintptr_t ptr, int min, int max)
    {
        reinterpret_cast<QProgressDialog *>(static_cast<uintptr_t>(ptr))->setRange(min, max);
    }

    int nativeProgressDialogMinimum(uintptr_t ptr)
    {
        return reinterpret_cast<QProgressDialog *>(static_cast<uintptr_t>(ptr))->minimum();
    }

    int nativeProgressDialogMaximum(uintptr_t ptr)
    {
        return reinterpret_cast<QProgressDialog *>(static_cast<uintptr_t>(ptr))->maximum();
    }

    void nativeProgressDialogSetLabelText(uintptr_t ptr, const char *text)
    {
        reinterpret_cast<QProgressDialog *>(static_cast<uintptr_t>(ptr))->setLabelText(QString::fromUtf8(text));
    }

    char *nativeProgressDialogLabelText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QProgressDialog *>(static_cast<uintptr_t>(ptr))->labelText());
    }

    bool nativeProgressDialogWasCanceled(uintptr_t ptr)
    {
        return reinterpret_cast<QProgressDialog *>(static_cast<uintptr_t>(ptr))->wasCanceled();
    }

    // ---- QTextBrowser ----

    uintptr_t nativeTextBrowserCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QTextBrowser(parent));
    }

    void nativeTextBrowserDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QTextBrowser *>(static_cast<uintptr_t>(ptr));
    }

    void nativeTextBrowserSetText(uintptr_t ptr, const char *text)
    {
        reinterpret_cast<QTextBrowser *>(static_cast<uintptr_t>(ptr))->setText(QString::fromUtf8(text));
    }

    char *nativeTextBrowserToPlainText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QTextBrowser *>(static_cast<uintptr_t>(ptr))->toPlainText());
    }

    void nativeTextBrowserSetHtml(uintptr_t ptr, const char *html)
    {
        reinterpret_cast<QTextBrowser *>(static_cast<uintptr_t>(ptr))->setHtml(QString::fromUtf8(html));
    }

    char *nativeTextBrowserToHtml(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QTextBrowser *>(static_cast<uintptr_t>(ptr))->toHtml());
    }

    // ---- QItemDelegate ----

    uintptr_t nativeItemDelegateCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QItemDelegate(parent));
    }

    void nativeItemDelegateDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QItemDelegate *>(static_cast<uintptr_t>(ptr));
    }
}
