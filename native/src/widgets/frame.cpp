#include "frame.h"

extern "C"
{
    long nativeFrameCreate(long parentPtr, uint f)
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
        return reinterpret_cast<long>(frame);
    }

    void nativeFrameDelete(long ptr)
    {
        CjFrame *instance = reinterpret_cast<CjFrame *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    long nativeFrameFrameRect(long ptr)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        QRect rect = instance->frameRect();
        return reinterpret_cast<long>(&rect);
    }
    short nativeFrameFrameShadow(long ptr)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->frameShadow();
    }
    short nativeFrameFrameShape(long ptr)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->frameShape();
    }
    int nativeFrameFrameStyle(long ptr)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->frameStyle();
    }
    int nativeFrameFrameWidth(long ptr)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->frameWidth();
    }
    int nativeFrameLineWidth(long ptr)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->lineWidth();
    }
    int nativeFrameMidLineWidth(long ptr)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->midLineWidth();
    }
    void nativeFrameSetFrameRect(long ptr, long rectPtr)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        QRect *rect = reinterpret_cast<QRect *>(static_cast<uintptr_t>(rectPtr));
        return instance->setFrameRect(*rect);
    }
    void nativeFrameSetFrameShadow(long ptr, short shadow)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->setFrameShadow(QFrame::Shadow(shadow));
    }
    void nativeFrameSetFrameShape(long ptr, short shape)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->setFrameShape(QFrame::Shape(shape));
    }
    void nativeFrameSetFrameStyle(long ptr, int style)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->setFrameStyle(style);
    }
    void nativeFrameSetLineWidth(long ptr, int width)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->setLineWidth(width);
    }
    void nativeFrameSetMidLineWidth(long ptr, int width)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        return instance->setMidLineWidth(width);
    }
    long nativeFrameSizeHint(long ptr)
    {
        QFrame *instance = reinterpret_cast<QFrame *>(static_cast<uintptr_t>(ptr));
        QSize size = instance->sizeHint();
        return reinterpret_cast<long>(&size);
    }
}