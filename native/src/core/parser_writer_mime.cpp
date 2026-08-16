/*
 * CJQT native bindings: QCommandLineParser, QXmlStreamWriter, QMimeDatabase
 */
#include <QCommandLineParser>
#include <QXmlStreamWriter>
#include <QMimeDatabase>
#include <QStringList>
#include <QBuffer>
#include "native_string.h"

extern "C"
{
    // ---- QCommandLineParser ----

    uintptr_t nativeCommandLineParserCreate()
    {
        return reinterpret_cast<uintptr_t>(new QCommandLineParser());
    }

    void nativeCommandLineParserDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QCommandLineParser *>(static_cast<uintptr_t>(ptr));
    }

    void nativeCommandLineParserSetApplicationDescription(uintptr_t ptr, const char *description)
    {
        reinterpret_cast<QCommandLineParser *>(static_cast<uintptr_t>(ptr))->setApplicationDescription(
            QString::fromUtf8(description));
    }

    void nativeCommandLineParserAddOption(uintptr_t ptr, const char *name)
    {
        reinterpret_cast<QCommandLineParser *>(static_cast<uintptr_t>(ptr))->addOption(
            QCommandLineOption(QString::fromUtf8(name)));
    }

    bool nativeCommandLineParserIsSet(uintptr_t ptr, const char *name)
    {
        return reinterpret_cast<QCommandLineParser *>(static_cast<uintptr_t>(ptr))->isSet(QString::fromUtf8(name));
    }

    char *nativeCommandLineParserValue(uintptr_t ptr, const char *name)
    {
        return cjqt_to_cstring(reinterpret_cast<QCommandLineParser *>(static_cast<uintptr_t>(ptr))->value(
            QString::fromUtf8(name)));
    }

    uintptr_t nativeCommandLineParserPositionalArguments(uintptr_t ptr)
    {
        QCommandLineParser *parser = reinterpret_cast<QCommandLineParser *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(new QStringList(parser->positionalArguments()));
    }

    void nativeCommandLineParserProcess(uintptr_t ptr, uintptr_t argsPtr)
    {
        QStringList *args = reinterpret_cast<QStringList *>(static_cast<uintptr_t>(argsPtr));
        if (args != nullptr)
        {
            reinterpret_cast<QCommandLineParser *>(static_cast<uintptr_t>(ptr))->process(*args);
        }
    }

    // ---- QXmlStreamWriter ----

    uintptr_t nativeXmlWriterCreate()
    {
        QBuffer *buffer = new QBuffer();
        buffer->open(QIODevice::WriteOnly);
        QXmlStreamWriter *writer = new QXmlStreamWriter(buffer);
        return reinterpret_cast<uintptr_t>(writer);
    }

    void nativeXmlWriterDelete(uintptr_t ptr)
    {
        QXmlStreamWriter *writer = reinterpret_cast<QXmlStreamWriter *>(static_cast<uintptr_t>(ptr));
        delete writer;
    }

    void nativeXmlWriterSetAutoFormatting(uintptr_t ptr, bool b)
    {
        reinterpret_cast<QXmlStreamWriter *>(static_cast<uintptr_t>(ptr))->setAutoFormatting(b);
    }

    void nativeXmlWriterWriteStartDocument(uintptr_t ptr)
    {
        reinterpret_cast<QXmlStreamWriter *>(static_cast<uintptr_t>(ptr))->writeStartDocument();
    }

    void nativeXmlWriterWriteEndDocument(uintptr_t ptr)
    {
        reinterpret_cast<QXmlStreamWriter *>(static_cast<uintptr_t>(ptr))->writeEndDocument();
    }

    void nativeXmlWriterWriteStartElement(uintptr_t ptr, const char *name)
    {
        reinterpret_cast<QXmlStreamWriter *>(static_cast<uintptr_t>(ptr))->writeStartElement(QString::fromUtf8(name));
    }

    void nativeXmlWriterWriteEndElement(uintptr_t ptr)
    {
        reinterpret_cast<QXmlStreamWriter *>(static_cast<uintptr_t>(ptr))->writeEndElement();
    }

    void nativeXmlWriterWriteCharacters(uintptr_t ptr, const char *text)
    {
        reinterpret_cast<QXmlStreamWriter *>(static_cast<uintptr_t>(ptr))->writeCharacters(QString::fromUtf8(text));
    }

    void nativeXmlWriterWriteTextElement(uintptr_t ptr, const char *name, const char *text)
    {
        reinterpret_cast<QXmlStreamWriter *>(static_cast<uintptr_t>(ptr))->writeTextElement(QString::fromUtf8(name),
                                                                                           QString::fromUtf8(text));
    }

    char *nativeXmlWriterToString(uintptr_t ptr)
    {
        QXmlStreamWriter *writer = reinterpret_cast<QXmlStreamWriter *>(static_cast<uintptr_t>(ptr));
        QBuffer *buffer = static_cast<QBuffer *>(writer->device());
        return cjqt_to_cstring(buffer->data());
    }

    // ---- QMimeDatabase ----

    uintptr_t nativeMimeDatabaseCreate()
    {
        return reinterpret_cast<uintptr_t>(new QMimeDatabase());
    }

    void nativeMimeDatabaseDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QMimeDatabase *>(static_cast<uintptr_t>(ptr));
    }

    uintptr_t nativeMimeDatabaseMimeTypeForName(uintptr_t ptr, const char *name)
    {
        return reinterpret_cast<uintptr_t>(new QMimeType(
            reinterpret_cast<QMimeDatabase *>(static_cast<uintptr_t>(ptr))->mimeTypeForName(QString::fromUtf8(name))));
    }

    uintptr_t nativeMimeDatabaseMimeTypeForFile(uintptr_t ptr, const char *fileName)
    {
        return reinterpret_cast<uintptr_t>(new QMimeType(
            reinterpret_cast<QMimeDatabase *>(static_cast<uintptr_t>(ptr))->mimeTypeForFile(QString::fromUtf8(fileName))));
    }
}
