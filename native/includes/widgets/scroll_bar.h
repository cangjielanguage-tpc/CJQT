#ifndef __SCROLL_BAR_H_
#define __SCROLL_BAR_H_
#include <QScrollBar>
#include "object.h"

typedef bool (*eventCallback)(long, long);

class CjScrollBar : public QScrollBar
{
    Q_OBJECT
public:
    CjScrollBar(QWidget *parent = nullptr) : QScrollBar(parent) {}
    CjScrollBar(Qt::Orientation orientation, QWidget *parent = nullptr) : QScrollBar(orientation, parent) {}
    void setEvent(eventCallback callBack)
    {
        if (callBack != nullptr)
        {
            m_pEventCallBack = callBack;
        }
    }
    void doMousePressEvent(QMouseEvent *event)
    {
        return QScrollBar::mousePressEvent(event);
    }

protected:
    virtual bool event(QEvent *event)
    {
        if (event != nullptr)
        {
            long eventPtr = reinterpret_cast<long>(event);
            long receivePtr = reinterpret_cast<long>(this);
            if (!m_pEventCallBack(receivePtr, eventPtr))
            {
                QScrollBar::event(event);
            }
        }
        QScrollBar::event(event);
    }

protected:
    eventCallback m_pEventCallBack = nullptr;
};

#endif