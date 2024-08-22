#include "frame.h"

extern "C"
{
    uintptr_t nativeFrameCreate(uintptr_t parentPtr, uint f)
    {
        CjFrame *frame;
        if (parentPtr == 0L)
        {
            frame = new CjFrame();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            frame = new CjFrame(parent, Qt::WindowFlags(f));
        }
        return reinterpret_cast<uintptr_t>(frame);
    }

    void nativeFrameDelete(uintptr_t ptr)
    {
        CjFrame *instance = reinterpret_cast<CjFrame *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    uintptr_t nativeFrameFrameRect(uintptr_t ptr)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        QRect rect = instance->frameRect();
        QRect *p = new QRect(rect);
        return reinterpret_cast<uintptr_t>(p);
    }
    short nativeFrameFrameShadow(uintptr_t ptr)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->frameShadow();
    }
    short nativeFrameFrameShape(uintptr_t ptr)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->frameShape();
    }
    int nativeFrameFrameStyle(uintptr_t ptr)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->frameStyle();
    }
    int nativeFrameFrameWidth(uintptr_t ptr)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->frameWidth();
    }
    int nativeFrameLineWidth(uintptr_t ptr)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->lineWidth();
    }
    int nativeFrameMidLineWidth(uintptr_t ptr)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->midLineWidth();
    }
    void nativeFrameSetFrameRect(uintptr_t ptr, uintptr_t rectPtr)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        QRect *rect = reinterpret_cast<QRect *>(static_cast<uintptr_t>(rectPtr));
        return instance->setFrameRect(*rect);
    }
    void nativeFrameSetFrameShadow(uintptr_t ptr, short shadow)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->setFrameShadow(QFrame::Shadow(shadow));
    }
    void nativeFrameSetFrameShape(uintptr_t ptr, short shape)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->setFrameShape(QFrame::Shape(shape));
    }
    void nativeFrameSetFrameStyle(uintptr_t ptr, int style)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->setFrameStyle(style);
    }
    void nativeFrameSetLineWidth(uintptr_t ptr, int width)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->setLineWidth(width);
    }
    void nativeFrameSetMidLineWidth(uintptr_t ptr, int width)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->setMidLineWidth(width);
    }
    uintptr_t nativeFrameSizeHint(uintptr_t ptr)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        QSize size = instance->sizeHint();
        QSize *p = new QSize(size);
        return reinterpret_cast<uintptr_t>(p);
    }
}