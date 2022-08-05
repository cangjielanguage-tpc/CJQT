#ifndef __TIMER_H_
#define __TIMER_H_

#include <QTimer>

typedef void (*nativeTimerCallback)();

class CjQtTimer : public QTimer
{
    Q_OBJECT
public:
    nativeTimerCallback callback = nullptr;
    CjQtTimer(nativeTimerCallback onTick)
    {
        callback = onTick;
        connect(this, SIGNAL(timeout()), this, SLOT(tick()));
    }
private Q_SLOTS:
    void tick()
    {
        if (callback != nullptr){
            callback();
        }
    }
};

#endif