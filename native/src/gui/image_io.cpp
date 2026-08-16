/*
 * CJQT native bindings: QImageReader, QImageWriter
 */
#include <QImageReader>
#include <QImageWriter>
#include <QImage>
#include <QSize>
#include "native_string.h"

extern "C"
{
    // ---- QImageReader ----

    uintptr_t nativeImageReaderCreate(const char *path)
    {
        return reinterpret_cast<uintptr_t>(new QImageReader(QString::fromUtf8(path)));
    }

    void nativeImageReaderDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QImageReader *>(static_cast<uintptr_t>(ptr));
    }

    uintptr_t nativeImageReaderRead(uintptr_t ptr)
    {
        QImageReader *reader = reinterpret_cast<QImageReader *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(new QImage(reader->read()));
    }

    int nativeImageReaderWidth(uintptr_t ptr)
    {
        return reinterpret_cast<QImageReader *>(static_cast<uintptr_t>(ptr))->size().width();
    }

    int nativeImageReaderHeight(uintptr_t ptr)
    {
        return reinterpret_cast<QImageReader *>(static_cast<uintptr_t>(ptr))->size().height();
    }

    char *nativeImageReaderFormat(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QImageReader *>(static_cast<uintptr_t>(ptr))->format());
    }

    bool nativeImageReaderCanRead(uintptr_t ptr)
    {
        return reinterpret_cast<QImageReader *>(static_cast<uintptr_t>(ptr))->canRead();
    }

    char *nativeImageReaderErrorString(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QImageReader *>(static_cast<uintptr_t>(ptr))->errorString());
    }

    int nativeImageReaderImageCount(uintptr_t ptr)
    {
        return reinterpret_cast<QImageReader *>(static_cast<uintptr_t>(ptr))->imageCount();
    }

    // ---- QImageWriter ----

    uintptr_t nativeImageWriterCreate(const char *path)
    {
        return reinterpret_cast<uintptr_t>(new QImageWriter(QString::fromUtf8(path)));
    }

    void nativeImageWriterDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QImageWriter *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeImageWriterWrite(uintptr_t ptr, uintptr_t imagePtr)
    {
        QImage *image = reinterpret_cast<QImage *>(static_cast<uintptr_t>(imagePtr));
        return reinterpret_cast<QImageWriter *>(static_cast<uintptr_t>(ptr))->write(*image);
    }

    void nativeImageWriterSetFormat(uintptr_t ptr, const char *format)
    {
        reinterpret_cast<QImageWriter *>(static_cast<uintptr_t>(ptr))->setFormat(QByteArray(format));
    }

    char *nativeImageWriterFormat(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QImageWriter *>(static_cast<uintptr_t>(ptr))->format());
    }

    char *nativeImageWriterErrorString(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QImageWriter *>(static_cast<uintptr_t>(ptr))->errorString());
    }

    bool nativeImageWriterCanWrite(uintptr_t ptr)
    {
        return reinterpret_cast<QImageWriter *>(static_cast<uintptr_t>(ptr))->canWrite();
    }
}
