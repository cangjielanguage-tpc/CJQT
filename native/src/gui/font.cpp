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

    uintptr_t nativeFontCreateFPWI(const char *family,int pointSize,int weight,bool italic){
        QFont *font=new QFont(family,pointSize,weight,italic);
        return reinterpret_cast<uintptr_t>(font);
    }

    void nativeFontSetPointSize(uintptr_t ptr, int size)
    {
        QFont *instance = reinterpret_cast<QFont *>(static_cast<uintptr_t>(ptr));
        instance->setPointSize(size);
    }

    void nativeFontSetFamily(uintptr_t ptr,  const char *family){
        QFont *instance = reinterpret_cast<QFont *>(static_cast<uintptr_t>(ptr));
        instance->setFamily(family);
    }
    void nativeFontSetWeight(uintptr_t ptr, int weight){
        QFont *instance = reinterpret_cast<QFont *>(static_cast<uintptr_t>(ptr));
        instance->setWeight(weight);
    }
    void nativeFontSetItalic(uintptr_t ptr, bool enable){
        QFont *instance = reinterpret_cast<QFont *>(static_cast<uintptr_t>(ptr));
        instance->setItalic(enable);
    }

    void nativeFontDelete(uintptr_t ptr)
    {
        QFont *instance = reinterpret_cast<QFont *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}
