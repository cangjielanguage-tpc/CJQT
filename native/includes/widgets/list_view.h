#ifndef __LIST_VIEW_H_
#define __LIST_VIEW_H_

#include <QListView>
#include "widget.h"
#include "object.h"

class CjListView : public QListView
{
    Q_OBJECT
public:
    CjListView(QWidget *parent = nullptr) : QListView(parent) {}

protected:
    PAINT_EVENT(QListView::paintEvent(event))

    MOUSE_PRESS_EVENT(QListView::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QListView::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QListView::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QListView::keyPressEvent(event))

    void wheelEvent(QWheelEvent *e){
        QListView::wheelEvent(e);
    }

    void rowsInserted(const QModelIndex &parent, int start, int end)
    {
        QListView::rowsInserted(parent, start, end);
    }

    void rowsAboutToBeRemoved(const QModelIndex &parent, int start, int end)
    {
        QListView::rowsAboutToBeRemoved(parent, start, end);
    }
};

#endif