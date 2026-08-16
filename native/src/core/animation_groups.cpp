/*
 * CJQT native bindings: QAbstractAnimation, QAnimationGroup,
 * QSequentialAnimationGroup, QParallelAnimationGroup, QPauseAnimation
 */
#include <QAbstractAnimation>
#include <QAnimationGroup>
#include <QSequentialAnimationGroup>
#include <QParallelAnimationGroup>
#include <QPauseAnimation>
#include <QObject>
#include "native_string.h"

extern "C"
{
    // ---- QAbstractAnimation (common) ----

    void nativeAbstractAnimationStart(uintptr_t ptr)
    {
        reinterpret_cast<QAbstractAnimation *>(static_cast<uintptr_t>(ptr))->start();
    }

    void nativeAbstractAnimationStop(uintptr_t ptr)
    {
        reinterpret_cast<QAbstractAnimation *>(static_cast<uintptr_t>(ptr))->stop();
    }

    int nativeAbstractAnimationState(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QAbstractAnimation *>(static_cast<uintptr_t>(ptr))->state());
    }

    int nativeAbstractAnimationCurrentTime(uintptr_t ptr)
    {
        return reinterpret_cast<QAbstractAnimation *>(static_cast<uintptr_t>(ptr))->currentTime();
    }

    int nativeAbstractAnimationDuration(uintptr_t ptr)
    {
        return reinterpret_cast<QAbstractAnimation *>(static_cast<uintptr_t>(ptr))->duration();
    }

    // ---- QAnimationGroup ----

    void nativeAnimationGroupDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QAnimationGroup *>(static_cast<uintptr_t>(ptr));
    }

    void nativeAnimationGroupAddAnimation(uintptr_t ptr, uintptr_t animationPtr)
    {
        QAbstractAnimation *animation = reinterpret_cast<QAbstractAnimation *>(static_cast<uintptr_t>(animationPtr));
        reinterpret_cast<QAnimationGroup *>(static_cast<uintptr_t>(ptr))->addAnimation(animation);
    }

    int nativeAnimationGroupAnimationCount(uintptr_t ptr)
    {
        return reinterpret_cast<QAnimationGroup *>(static_cast<uintptr_t>(ptr))->animationCount();
    }

    void nativeAnimationGroupRemoveAnimation(uintptr_t ptr, uintptr_t animationPtr)
    {
        QAbstractAnimation *animation = reinterpret_cast<QAbstractAnimation *>(static_cast<uintptr_t>(animationPtr));
        reinterpret_cast<QAnimationGroup *>(static_cast<uintptr_t>(ptr))->removeAnimation(animation);
    }

    void nativeAnimationGroupClear(uintptr_t ptr)
    {
        reinterpret_cast<QAnimationGroup *>(static_cast<uintptr_t>(ptr))->clear();
    }

    // ---- QSequentialAnimationGroup ----

    uintptr_t nativeSequentialAnimationGroupCreate(uintptr_t parentPtr)
    {
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QSequentialAnimationGroup(parent));
    }

    void nativeSequentialAnimationGroupDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QSequentialAnimationGroup *>(static_cast<uintptr_t>(ptr));
    }

    // ---- QParallelAnimationGroup ----

    uintptr_t nativeParallelAnimationGroupCreate(uintptr_t parentPtr)
    {
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QParallelAnimationGroup(parent));
    }

    void nativeParallelAnimationGroupDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QParallelAnimationGroup *>(static_cast<uintptr_t>(ptr));
    }

    // ---- QPauseAnimation ----

    uintptr_t nativePauseAnimationCreate(int duration, uintptr_t parentPtr)
    {
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QPauseAnimation(duration, parent));
    }

    void nativePauseAnimationDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QPauseAnimation *>(static_cast<uintptr_t>(ptr));
    }

    void nativePauseAnimationSetDuration(uintptr_t ptr, int duration)
    {
        reinterpret_cast<QPauseAnimation *>(static_cast<uintptr_t>(ptr))->setDuration(duration);
    }
}
