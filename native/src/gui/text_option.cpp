#include <QTextOption>

extern "C"
{
    uintptr_t nativeTextOptionCreate(uintptr_t ptr)
    {
        if (ptr == 0)
        {
            return reinterpret_cast<uintptr_t>(new QTextOption());
        }
        else
        {
            QTextOption *textOption = reinterpret_cast<QTextOption *>(static_cast<uintptr_t>(ptr));
            return reinterpret_cast<uintptr_t>(textOption);
        }
    }

    uintptr_t nativeTextOptionCreateAlignment(short alignment)
    {

        return reinterpret_cast<uintptr_t>(new QTextOption(Qt::Alignment(alignment)));
    }

    void nativeTextOptionSetAlignment(uintptr_t ptr,short alignment)
    {
        QTextOption *instance = reinterpret_cast<QTextOption *>(static_cast<uintptr_t>(ptr));
        instance->setAlignment(Qt::Alignment(alignment));
    }

    void nativeTextOptionDelete(uintptr_t ptr)
    {
        QTextOption *instance = reinterpret_cast<QTextOption *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}
