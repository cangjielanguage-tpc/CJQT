/*
 * CJQT native bindings: QAbstractSpinBox, QMdiSubWindow, QColumnView,
 * QItemEditorFactory, QFileIconProvider
 */
#include <QAbstractSpinBox>
#include <QMdiSubWindow>
#include <QColumnView>
#include <QItemEditorFactory>
#include <QFileIconProvider>
#include <QIcon>
#include "object.h"
#include "native_string.h"

extern "C"
{
    // ---- QAbstractSpinBox ----

    uintptr_t nativeAbstractSpinBoxCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QAbstractSpinBox(parent));
    }

    void nativeAbstractSpinBoxDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QAbstractSpinBox *>(static_cast<uintptr_t>(ptr));
    }

    char *nativeAbstractSpinBoxText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QAbstractSpinBox *>(static_cast<uintptr_t>(ptr))->text());
    }

    // ---- QMdiSubWindow ----

    uintptr_t nativeMdiSubWindowCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QMdiSubWindow(parent));
    }

    void nativeMdiSubWindowDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QMdiSubWindow *>(static_cast<uintptr_t>(ptr));
    }

    void nativeMdiSubWindowSetWidget(uintptr_t ptr, uintptr_t widgetPtr)
    {
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        reinterpret_cast<QMdiSubWindow *>(static_cast<uintptr_t>(ptr))->setWidget(widget);
    }

    uintptr_t nativeMdiSubWindowWidget(uintptr_t ptr)
    {
        return reinterpret_cast<uintptr_t>(reinterpret_cast<QMdiSubWindow *>(static_cast<uintptr_t>(ptr))->widget());
    }

    // ---- QColumnView ----

    uintptr_t nativeColumnViewCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QColumnView(parent));
    }

    void nativeColumnViewDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QColumnView *>(static_cast<uintptr_t>(ptr));
    }

    // ---- QItemEditorFactory ----

    uintptr_t nativeItemEditorFactoryCreate()
    {
        return reinterpret_cast<uintptr_t>(new QItemEditorFactory());
    }

    void nativeItemEditorFactoryDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QItemEditorFactory *>(static_cast<uintptr_t>(ptr));
    }

    // ---- QFileIconProvider ----

    uintptr_t nativeFileIconProviderCreate()
    {
        return reinterpret_cast<uintptr_t>(new QFileIconProvider());
    }

    void nativeFileIconProviderDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QFileIconProvider *>(static_cast<uintptr_t>(ptr));
    }

    uintptr_t nativeFileIconProviderIcon(uintptr_t ptr, const char *path)
    {
        QFileInfo info(QString::fromUtf8(path));
        return reinterpret_cast<uintptr_t>(new QIcon(
            reinterpret_cast<QFileIconProvider *>(static_cast<uintptr_t>(ptr))->icon(info)));
    }
}
