/*
 * CJQT native bindings: QXmlStreamReader
 */
#include <QXmlStreamReader>
#include "native_string.h"

extern "C"
{
    uintptr_t nativeXmlReaderCreate(const char *data)
    {
        return reinterpret_cast<uintptr_t>(new QXmlStreamReader(QString::fromUtf8(data)));
    }

    void nativeXmlReaderDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QXmlStreamReader *>(static_cast<uintptr_t>(ptr));
    }

    int nativeXmlReaderReadNext(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QXmlStreamReader *>(static_cast<uintptr_t>(ptr))->readNext());
    }

    bool nativeXmlReaderIsStartElement(uintptr_t ptr)
    {
        return reinterpret_cast<QXmlStreamReader *>(static_cast<uintptr_t>(ptr))->isStartElement();
    }

    bool nativeXmlReaderIsEndElement(uintptr_t ptr)
    {
        return reinterpret_cast<QXmlStreamReader *>(static_cast<uintptr_t>(ptr))->isEndElement();
    }

    char *nativeXmlReaderName(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QXmlStreamReader *>(static_cast<uintptr_t>(ptr))->name().toString());
    }

    char *nativeXmlReaderText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QXmlStreamReader *>(static_cast<uintptr_t>(ptr))->text().toString());
    }

    bool nativeXmlReaderAtEnd(uintptr_t ptr)
    {
        return reinterpret_cast<QXmlStreamReader *>(static_cast<uintptr_t>(ptr))->atEnd();
    }
}
