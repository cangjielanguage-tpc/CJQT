/*
 * CJQT native bindings: QImage, QPainterPath, QFontMetrics
 */
#include <QImage>
#include <QPainterPath>
#include <QFontMetrics>
#include "native_string.h"

extern "C"
{
    // ---- QImage ----

    uintptr_t nativeImageCreate(int width, int height, int format)
    {
        return reinterpret_cast<uintptr_t>(new QImage(width, height, static_cast<QImage::Format>(format)));
    }

    uintptr_t nativeImageCreateFromFile(const char *path)
    {
        return reinterpret_cast<uintptr_t>(new QImage(QString::fromUtf8(path)));
    }

    void nativeImageDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QImage *>(static_cast<uintptr_t>(ptr));
    }

    int nativeImageWidth(uintptr_t ptr)
    {
        return reinterpret_cast<QImage *>(static_cast<uintptr_t>(ptr))->width();
    }

    int nativeImageHeight(uintptr_t ptr)
    {
        return reinterpret_cast<QImage *>(static_cast<uintptr_t>(ptr))->height();
    }

    bool nativeImageIsNull(uintptr_t ptr)
    {
        return reinterpret_cast<QImage *>(static_cast<uintptr_t>(ptr))->isNull();
    }

    void nativeImageFill(uintptr_t ptr, unsigned int rgba)
    {
        reinterpret_cast<QImage *>(static_cast<uintptr_t>(ptr))->fill(QColor::fromRgba(rgba));
    }

    bool nativeImageLoad(uintptr_t ptr, const char *path)
    {
        return reinterpret_cast<QImage *>(static_cast<uintptr_t>(ptr))->load(QString::fromUtf8(path));
    }

    bool nativeImageSave(uintptr_t ptr, const char *path)
    {
        return reinterpret_cast<QImage *>(static_cast<uintptr_t>(ptr))->save(QString::fromUtf8(path));
    }

    unsigned int nativeImagePixelColor(uintptr_t ptr, int x, int y)
    {
        return reinterpret_cast<QImage *>(static_cast<uintptr_t>(ptr))->pixelColor(x, y).rgba();
    }

    bool nativeImageSetPixelColor(uintptr_t ptr, int x, int y, unsigned int rgba)
    {
        if (x < 0 || y < 0 || x >= reinterpret_cast<QImage *>(static_cast<uintptr_t>(ptr))->width() ||
            y >= reinterpret_cast<QImage *>(static_cast<uintptr_t>(ptr))->height())
        {
            return false;
        }
        reinterpret_cast<QImage *>(static_cast<uintptr_t>(ptr))->setPixelColor(x, y, QColor::fromRgba(rgba));
        return true;
    }

    // ---- QPainterPath ----

    uintptr_t nativePainterPathCreate()
    {
        return reinterpret_cast<uintptr_t>(new QPainterPath());
    }

    void nativePainterPathDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QPainterPath *>(static_cast<uintptr_t>(ptr));
    }

    void nativePainterPathMoveTo(uintptr_t ptr, double x, double y)
    {
        reinterpret_cast<QPainterPath *>(static_cast<uintptr_t>(ptr))->moveTo(x, y);
    }

    void nativePainterPathLineTo(uintptr_t ptr, double x, double y)
    {
        reinterpret_cast<QPainterPath *>(static_cast<uintptr_t>(ptr))->lineTo(x, y);
    }

    void nativePainterPathCubicTo(uintptr_t ptr, double c1x, double c1y, double c2x, double c2y, double ex, double ey)
    {
        reinterpret_cast<QPainterPath *>(static_cast<uintptr_t>(ptr))->cubicTo(c1x, c1y, c2x, c2y, ex, ey);
    }

    void nativePainterPathCloseSubpath(uintptr_t ptr)
    {
        reinterpret_cast<QPainterPath *>(static_cast<uintptr_t>(ptr))->closeSubpath();
    }

    bool nativePainterPathIsEmpty(uintptr_t ptr)
    {
        return reinterpret_cast<QPainterPath *>(static_cast<uintptr_t>(ptr))->isEmpty();
    }

    bool nativePainterPathContains(uintptr_t ptr, double x, double y)
    {
        return reinterpret_cast<QPainterPath *>(static_cast<uintptr_t>(ptr))->contains(QPointF(x, y));
    }

    double nativePainterPathLength(uintptr_t ptr)
    {
        return reinterpret_cast<QPainterPath *>(static_cast<uintptr_t>(ptr))->length();
    }

    int nativePainterPathElementCount(uintptr_t ptr)
    {
        return reinterpret_cast<QPainterPath *>(static_cast<uintptr_t>(ptr))->elementCount();
    }

    // ---- QFontMetrics ----

    uintptr_t nativeFontMetricsCreate(uintptr_t fontPtr)
    {
        QFont *font = reinterpret_cast<QFont *>(static_cast<uintptr_t>(fontPtr));
        return reinterpret_cast<uintptr_t>(new QFontMetrics(*font));
    }

    void nativeFontMetricsDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QFontMetrics *>(static_cast<uintptr_t>(ptr));
    }

    int nativeFontMetricsHeight(uintptr_t ptr)
    {
        return reinterpret_cast<QFontMetrics *>(static_cast<uintptr_t>(ptr))->height();
    }

    int nativeFontMetricsAscent(uintptr_t ptr)
    {
        return reinterpret_cast<QFontMetrics *>(static_cast<uintptr_t>(ptr))->ascent();
    }

    int nativeFontMetricsDescent(uintptr_t ptr)
    {
        return reinterpret_cast<QFontMetrics *>(static_cast<uintptr_t>(ptr))->descent();
    }

    int nativeFontMetricsWidth(uintptr_t ptr, const char *text)
    {
        return reinterpret_cast<QFontMetrics *>(static_cast<uintptr_t>(ptr))->horizontalAdvance(QString::fromUtf8(text));
    }

    int nativeFontMetricsHorizontalAdvance(uintptr_t ptr, const char *text)
    {
        return reinterpret_cast<QFontMetrics *>(static_cast<uintptr_t>(ptr))->horizontalAdvance(QString::fromUtf8(text));
    }
}
