/*
 * CJQT native bindings: QFontMetricsF, QRegion
 */
#include <QFontMetricsF>
#include <QRegion>
#include "native_string.h"

extern "C"
{
    // ---- QFontMetricsF ----

    uintptr_t nativeFontMetricsFCreate(uintptr_t fontPtr)
    {
        QFont *font = reinterpret_cast<QFont *>(static_cast<uintptr_t>(fontPtr));
        return reinterpret_cast<uintptr_t>(new QFontMetricsF(*font));
    }

    void nativeFontMetricsFDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QFontMetricsF *>(static_cast<uintptr_t>(ptr));
    }

    double nativeFontMetricsFHeight(uintptr_t ptr)
    {
        return reinterpret_cast<QFontMetricsF *>(static_cast<uintptr_t>(ptr))->height();
    }

    double nativeFontMetricsFAscent(uintptr_t ptr)
    {
        return reinterpret_cast<QFontMetricsF *>(static_cast<uintptr_t>(ptr))->ascent();
    }

    double nativeFontMetricsFWidth(uintptr_t ptr, const char *text)
    {
        return reinterpret_cast<QFontMetricsF *>(static_cast<uintptr_t>(ptr))->horizontalAdvance(
            QString::fromUtf8(text));
    }

    double nativeFontMetricsFHorizontalAdvance(uintptr_t ptr, const char *text)
    {
        return reinterpret_cast<QFontMetricsF *>(static_cast<uintptr_t>(ptr))->horizontalAdvance(
            QString::fromUtf8(text));
    }

    // ---- QRegion ----

    uintptr_t nativeRegionCreate(int x, int y, int w, int h)
    {
        return reinterpret_cast<uintptr_t>(new QRegion(x, y, w, h));
    }

    uintptr_t nativeRegionCreateEmpty()
    {
        return reinterpret_cast<uintptr_t>(new QRegion());
    }

    void nativeRegionDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QRegion *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeRegionIsEmpty(uintptr_t ptr)
    {
        return reinterpret_cast<QRegion *>(static_cast<uintptr_t>(ptr))->isEmpty();
    }

    bool nativeRegionIsNull(uintptr_t ptr)
    {
        return reinterpret_cast<QRegion *>(static_cast<uintptr_t>(ptr))->isNull();
    }

    bool nativeRegionContains(uintptr_t ptr, int x, int y)
    {
        return reinterpret_cast<QRegion *>(static_cast<uintptr_t>(ptr))->contains(QPoint(x, y));
    }

    int nativeRegionBoundingRectWidth(uintptr_t ptr)
    {
        return reinterpret_cast<QRegion *>(static_cast<uintptr_t>(ptr))->boundingRect().width();
    }

    int nativeRegionBoundingRectHeight(uintptr_t ptr)
    {
        return reinterpret_cast<QRegion *>(static_cast<uintptr_t>(ptr))->boundingRect().height();
    }
}
