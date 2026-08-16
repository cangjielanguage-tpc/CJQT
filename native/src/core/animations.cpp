/*
 * CJQT native bindings: QPropertyAnimation, QVariantAnimation, QSharedMemory
 */
#include <QPropertyAnimation>
#include <QVariantAnimation>
#include <QSharedMemory>
#include <QObject>
#include "native_string.h"

extern "C"
{
    // ---- QPropertyAnimation ----

    uintptr_t nativePropertyAnimationCreate(uintptr_t targetPtr, const char *propertyName, uintptr_t parentPtr)
    {
        QObject *target = reinterpret_cast<QObject *>(static_cast<uintptr_t>(targetPtr));
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(
            new QPropertyAnimation(target, QByteArray(propertyName), parent));
    }

    void nativePropertyAnimationDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QPropertyAnimation *>(static_cast<uintptr_t>(ptr));
    }

    void nativePropertyAnimationSetDuration(uintptr_t ptr, int duration)
    {
        reinterpret_cast<QPropertyAnimation *>(static_cast<uintptr_t>(ptr))->setDuration(duration);
    }

    int nativePropertyAnimationDuration(uintptr_t ptr)
    {
        return reinterpret_cast<QPropertyAnimation *>(static_cast<uintptr_t>(ptr))->duration();
    }

    void nativePropertyAnimationSetStartValue(uintptr_t ptr, int value)
    {
        reinterpret_cast<QPropertyAnimation *>(static_cast<uintptr_t>(ptr))->setStartValue(value);
    }

    void nativePropertyAnimationSetEndValue(uintptr_t ptr, int value)
    {
        reinterpret_cast<QPropertyAnimation *>(static_cast<uintptr_t>(ptr))->setEndValue(value);
    }

    void nativePropertyAnimationStart(uintptr_t ptr)
    {
        reinterpret_cast<QPropertyAnimation *>(static_cast<uintptr_t>(ptr))->start();
    }

    void nativePropertyAnimationStop(uintptr_t ptr)
    {
        reinterpret_cast<QPropertyAnimation *>(static_cast<uintptr_t>(ptr))->stop();
    }

    // ---- QVariantAnimation ----

    uintptr_t nativeVariantAnimationCreate(uintptr_t parentPtr)
    {
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QVariantAnimation(parent));
    }

    void nativeVariantAnimationDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QVariantAnimation *>(static_cast<uintptr_t>(ptr));
    }

    void nativeVariantAnimationSetDuration(uintptr_t ptr, int duration)
    {
        reinterpret_cast<QVariantAnimation *>(static_cast<uintptr_t>(ptr))->setDuration(duration);
    }

    int nativeVariantAnimationDuration(uintptr_t ptr)
    {
        return reinterpret_cast<QVariantAnimation *>(static_cast<uintptr_t>(ptr))->duration();
    }

    void nativeVariantAnimationStart(uintptr_t ptr)
    {
        reinterpret_cast<QVariantAnimation *>(static_cast<uintptr_t>(ptr))->start();
    }

    void nativeVariantAnimationStop(uintptr_t ptr)
    {
        reinterpret_cast<QVariantAnimation *>(static_cast<uintptr_t>(ptr))->stop();
    }

    int nativeVariantAnimationCurrentTime(uintptr_t ptr)
    {
        return reinterpret_cast<QVariantAnimation *>(static_cast<uintptr_t>(ptr))->currentTime();
    }

    // ---- QSharedMemory ----

    uintptr_t nativeSharedMemoryCreate(const char *key)
    {
        return reinterpret_cast<uintptr_t>(new QSharedMemory(QString::fromUtf8(key)));
    }

    void nativeSharedMemoryDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QSharedMemory *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeSharedMemoryCreateMemory(uintptr_t ptr, int size)
    {
        return reinterpret_cast<QSharedMemory *>(static_cast<uintptr_t>(ptr))->create(size);
    }

    bool nativeSharedMemoryAttach(uintptr_t ptr)
    {
        return reinterpret_cast<QSharedMemory *>(static_cast<uintptr_t>(ptr))->attach();
    }

    bool nativeSharedMemoryDetach(uintptr_t ptr)
    {
        return reinterpret_cast<QSharedMemory *>(static_cast<uintptr_t>(ptr))->detach();
    }

    bool nativeSharedMemoryIsAttached(uintptr_t ptr)
    {
        return reinterpret_cast<QSharedMemory *>(static_cast<uintptr_t>(ptr))->isAttached();
    }

    int nativeSharedMemorySize(uintptr_t ptr)
    {
        return reinterpret_cast<QSharedMemory *>(static_cast<uintptr_t>(ptr))->size();
    }
}
