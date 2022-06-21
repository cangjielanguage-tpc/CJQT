#include <QFont>
#include <QColor>

extern "C"
{
    long nativeFontCreate(long fontPtr)
    {
        if (fontPtr == 0)
        {
            return reinterpret_cast<long>(new QFont());
        }
        else
        {
            QFont *font = reinterpret_cast<QFont *>(static_cast<uintptr_t>(fontPtr));
            return reinterpret_cast<long>(new QFont(*font));
        }
    }

    void nativeFontSetPointSize(long ptr, int size)
    {
        QFont *instance = reinterpret_cast<QFont *>(static_cast<uintptr_t>(ptr));
        instance->setPointSize(size);
    }

    void nativeFontDelete(long ptr)
    {
        QFont *instance = reinterpret_cast<QFont *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}