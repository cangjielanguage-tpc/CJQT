/*
 * CJQT native bindings: QStackedWidget, QToolBox, QButtonGroup
 */
#include <QStackedWidget>
#include <QToolBox>
#include <QButtonGroup>
#include "object.h"
#include "native_string.h"

extern "C"
{
    // ---- QStackedWidget ----

    uintptr_t nativeStackedWidgetCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QStackedWidget(parent));
    }

    void nativeStackedWidgetDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QStackedWidget *>(static_cast<uintptr_t>(ptr));
    }

    int nativeStackedWidgetAddWidget(uintptr_t ptr, uintptr_t widgetPtr)
    {
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        return reinterpret_cast<QStackedWidget *>(static_cast<uintptr_t>(ptr))->addWidget(widget);
    }

    int nativeStackedWidgetCount(uintptr_t ptr)
    {
        return reinterpret_cast<QStackedWidget *>(static_cast<uintptr_t>(ptr))->count();
    }

    int nativeStackedWidgetCurrentIndex(uintptr_t ptr)
    {
        return reinterpret_cast<QStackedWidget *>(static_cast<uintptr_t>(ptr))->currentIndex();
    }

    void nativeStackedWidgetSetCurrentIndex(uintptr_t ptr, int index)
    {
        reinterpret_cast<QStackedWidget *>(static_cast<uintptr_t>(ptr))->setCurrentIndex(index);
    }

    void nativeStackedWidgetSetCurrentWidget(uintptr_t ptr, uintptr_t widgetPtr)
    {
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        reinterpret_cast<QStackedWidget *>(static_cast<uintptr_t>(ptr))->setCurrentWidget(widget);
    }

    uintptr_t nativeStackedWidgetWidget(uintptr_t ptr, int index)
    {
        return reinterpret_cast<uintptr_t>(reinterpret_cast<QStackedWidget *>(static_cast<uintptr_t>(ptr))->widget(index));
    }

    void nativeStackedWidgetRemoveWidget(uintptr_t ptr, uintptr_t widgetPtr)
    {
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        reinterpret_cast<QStackedWidget *>(static_cast<uintptr_t>(ptr))->removeWidget(widget);
    }

    // ---- QToolBox ----

    uintptr_t nativeToolBoxCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QToolBox(parent));
    }

    void nativeToolBoxDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QToolBox *>(static_cast<uintptr_t>(ptr));
    }

    int nativeToolBoxAddItem(uintptr_t ptr, uintptr_t widgetPtr, const char *text)
    {
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        return reinterpret_cast<QToolBox *>(static_cast<uintptr_t>(ptr))->addItem(widget, QString::fromUtf8(text));
    }

    int nativeToolBoxCount(uintptr_t ptr)
    {
        return reinterpret_cast<QToolBox *>(static_cast<uintptr_t>(ptr))->count();
    }

    int nativeToolBoxCurrentIndex(uintptr_t ptr)
    {
        return reinterpret_cast<QToolBox *>(static_cast<uintptr_t>(ptr))->currentIndex();
    }

    void nativeToolBoxSetCurrentIndex(uintptr_t ptr, int index)
    {
        reinterpret_cast<QToolBox *>(static_cast<uintptr_t>(ptr))->setCurrentIndex(index);
    }

    char *nativeToolBoxItemText(uintptr_t ptr, int index)
    {
        return cjqt_to_cstring(reinterpret_cast<QToolBox *>(static_cast<uintptr_t>(ptr))->itemText(index));
    }

    void nativeToolBoxSetItemText(uintptr_t ptr, int index, const char *text)
    {
        reinterpret_cast<QToolBox *>(static_cast<uintptr_t>(ptr))->setItemText(index, QString::fromUtf8(text));
    }

    void nativeToolBoxRemoveItem(uintptr_t ptr, int index)
    {
        reinterpret_cast<QToolBox *>(static_cast<uintptr_t>(ptr))->removeItem(index);
    }

    // ---- QButtonGroup ----

    uintptr_t nativeButtonGroupCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QButtonGroup(parent));
    }

    void nativeButtonGroupDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QButtonGroup *>(static_cast<uintptr_t>(ptr));
    }

    void nativeButtonGroupAddButton(uintptr_t ptr, uintptr_t buttonPtr, int id)
    {
        QAbstractButton *button = reinterpret_cast<QAbstractButton *>(static_cast<uintptr_t>(buttonPtr));
        reinterpret_cast<QButtonGroup *>(static_cast<uintptr_t>(ptr))->addButton(button, id);
    }

    void nativeButtonGroupRemoveButton(uintptr_t ptr, uintptr_t buttonPtr)
    {
        QAbstractButton *button = reinterpret_cast<QAbstractButton *>(static_cast<uintptr_t>(buttonPtr));
        reinterpret_cast<QButtonGroup *>(static_cast<uintptr_t>(ptr))->removeButton(button);
    }

    int nativeButtonGroupCheckedId(uintptr_t ptr)
    {
        return reinterpret_cast<QButtonGroup *>(static_cast<uintptr_t>(ptr))->checkedId();
    }

    void nativeButtonGroupSetExclusive(uintptr_t ptr, bool exclusive)
    {
        reinterpret_cast<QButtonGroup *>(static_cast<uintptr_t>(ptr))->setExclusive(exclusive);
    }

    bool nativeButtonGroupIsExclusive(uintptr_t ptr)
    {
        return reinterpret_cast<QButtonGroup *>(static_cast<uintptr_t>(ptr))->exclusive();
    }
}
