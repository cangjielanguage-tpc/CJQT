/*
 * CJQT native bindings: QTextBlock (via QTextDocument)
 */
#include <QTextBlock>
#include <QTextDocument>
#include "native_string.h"

extern "C"
{
    uintptr_t nativeTextDocumentFirstBlock(uintptr_t docPtr)
    {
        QTextDocument *doc = reinterpret_cast<QTextDocument *>(static_cast<uintptr_t>(docPtr));
        return reinterpret_cast<uintptr_t>(new QTextBlock(doc->begin()));
    }

    uintptr_t nativeTextDocumentFindBlockByNumber(uintptr_t docPtr, int blockNumber)
    {
        QTextDocument *doc = reinterpret_cast<QTextDocument *>(static_cast<uintptr_t>(docPtr));
        return reinterpret_cast<uintptr_t>(new QTextBlock(doc->findBlockByNumber(blockNumber)));
    }

    void nativeTextBlockDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QTextBlock *>(static_cast<uintptr_t>(ptr));
    }

    char *nativeTextBlockText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QTextBlock *>(static_cast<uintptr_t>(ptr))->text());
    }

    int nativeTextBlockBlockNumber(uintptr_t ptr)
    {
        return reinterpret_cast<QTextBlock *>(static_cast<uintptr_t>(ptr))->blockNumber();
    }

    int nativeTextBlockLength(uintptr_t ptr)
    {
        return reinterpret_cast<QTextBlock *>(static_cast<uintptr_t>(ptr))->length();
    }

    bool nativeTextBlockIsValid(uintptr_t ptr)
    {
        return reinterpret_cast<QTextBlock *>(static_cast<uintptr_t>(ptr))->isValid();
    }
}
