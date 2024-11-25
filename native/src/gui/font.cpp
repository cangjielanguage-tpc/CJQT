#include <QFont>
#include <QColor>

extern "C"
{
    uintptr_t nativeFontCreate(uintptr_t fontPtr)
    {
        if (fontPtr == 0)
        {
            return reinterpret_cast<uintptr_t>(new QFont());
        }
        else
        {
            QFont *font = reinterpret_cast<QFont *>(static_cast<uintptr_t>(fontPtr));
            return reinterpret_cast<uintptr_t>(new QFont(*font));
        }
    }

    void nativeFontSetPointSize(uintptr_t ptr, int size)
    {
        QFont *instance = reinterpret_cast<QFont *>(static_cast<uintptr_t>(ptr));
        instance->setPointSize(size);
    }

    void nativeFontDelete(uintptr_t ptr)
    {
        QFont *instance = reinterpret_cast<QFont *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}