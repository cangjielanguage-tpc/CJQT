/*
 * CJQT native bindings: QStackedLayout, QRubberBand, QShortcut
 */
#include <QStackedLayout>
#include <QRubberBand>
#include <QShortcut>
#include "object.h"
#include "native_string.h"

extern "C"
{
    // ---- QStackedLayout ----

    uintptr_t nativeStackedLayoutCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QStackedLayout(parent));
    }

    void nativeStackedLayoutDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QStackedLayout *>(static_cast<uintptr_t>(ptr));
    }

    int nativeStackedLayoutAddWidget(uintptr_t ptr, uintptr_t widgetPtr)
    {
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        return reinterpret_cast<QStackedLayout *>(static_cast<uintptr_t>(ptr))->addWidget(widget);
    }

    int nativeStackedLayoutCount(uintptr_t ptr)
    {
        return reinterpret_cast<QStackedLayout *>(static_cast<uintptr_t>(ptr))->count();
    }

    int nativeStackedLayoutCurrentIndex(uintptr_t ptr)
    {
        return reinterpret_cast<QStackedLayout *>(static_cast<uintptr_t>(ptr))->currentIndex();
    }

    void nativeStackedLayoutSetCurrentIndex(uintptr_t ptr, int index)
    {
        reinterpret_cast<QStackedLayout *>(static_cast<uintptr_t>(ptr))->setCurrentIndex(index);
    }

    uintptr_t nativeStackedLayoutWidget(uintptr_t ptr, int index)
    {
        return reinterpret_cast<uintptr_t>(reinterpret_cast<QStackedLayout *>(static_cast<uintptr_t>(ptr))->widget(index));
    }

    // ---- QRubberBand ----

    uintptr_t nativeRubberBandCreate(int shape, uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QRubberBand(static_cast<QRubberBand::Shape>(shape), parent));
    }

    void nativeRubberBandDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QRubberBand *>(static_cast<uintptr_t>(ptr));
    }

    void nativeRubberBandMove(uintptr_t ptr, int x, int y)
    {
        reinterpret_cast<QRubberBand *>(static_cast<uintptr_t>(ptr))->move(x, y);
    }

    void nativeRubberBandResize(uintptr_t ptr, int w, int h)
    {
        reinterpret_cast<QRubberBand *>(static_cast<uintptr_t>(ptr))->resize(w, h);
    }

    int nativeRubberBandWidth(uintptr_t ptr)
    {
        return reinterpret_cast<QRubberBand *>(static_cast<uintptr_t>(ptr))->width();
    }

    int nativeRubberBandHeight(uintptr_t ptr)
    {
        return reinterpret_cast<QRubberBand *>(static_cast<uintptr_t>(ptr))->height();
    }

    // ---- QShortcut ----

    uintptr_t nativeShortcutCreate(const char *keyStr, uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QShortcut(QKeySequence(QString::fromUtf8(keyStr)), parent));
    }

    void nativeShortcutDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QShortcut *>(static_cast<uintptr_t>(ptr));
    }

    void nativeShortcutSetEnabled(uintptr_t ptr, bool b)
    {
        reinterpret_cast<QShortcut *>(static_cast<uintptr_t>(ptr))->setEnabled(b);
    }

    bool nativeShortcutIsEnabled(uintptr_t ptr)
    {
        return reinterpret_cast<QShortcut *>(static_cast<uintptr_t>(ptr))->isEnabled();
    }
}
