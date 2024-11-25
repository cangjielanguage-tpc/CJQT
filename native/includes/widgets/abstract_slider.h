#ifndef __ABSTRACT_SLIDER_H_
#define __ABSTRACT_SLIDER_H_
#include <QAbstractSlider>

class CjAbstractSlider : public QAbstractSlider
{
    Q_OBJECT
public:
    CjAbstractSlider(QWidget *parent = nullptr) : QAbstractSlider(parent) {}

public:
    virtual bool doEvent(QEvent *e)
    {
        return event(e);
    }
};

#endif