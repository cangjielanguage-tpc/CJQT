/*
 * CJQT native bindings: QDateEdit, QDateTimeEdit, QDial, QInputDialog, QCalendarWidget
 */
#include <QDateEdit>
#include <QDateTimeEdit>
#include <QDial>
#include <QInputDialog>
#include <QCalendarWidget>
#include <QDate>
#include <QTime>
#include <QDateTime>
#include "object.h"
#include "native_string.h"

extern "C"
{
    // ---- QDateEdit ----

    uintptr_t nativeDateEditCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QDateEdit(parent));
    }

    void nativeDateEditDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QDateEdit *>(static_cast<uintptr_t>(ptr));
    }

    uintptr_t nativeDateEditDate(uintptr_t ptr)
    {
        return reinterpret_cast<uintptr_t>(new QDate(reinterpret_cast<QDateEdit *>(static_cast<uintptr_t>(ptr))->date()));
    }

    void nativeDateEditSetDate(uintptr_t ptr, int year, int month, int day)
    {
        reinterpret_cast<QDateEdit *>(static_cast<uintptr_t>(ptr))->setDate(QDate(year, month, day));
    }

    void nativeDateEditSetDateRange(uintptr_t ptr, int y1, int m1, int d1, int y2, int m2, int d2)
    {
        reinterpret_cast<QDateEdit *>(static_cast<uintptr_t>(ptr))->setDateRange(QDate(y1, m1, d1), QDate(y2, m2, d2));
    }

    void nativeDateEditSetDisplayFormat(uintptr_t ptr, const char *format)
    {
        reinterpret_cast<QDateEdit *>(static_cast<uintptr_t>(ptr))->setDisplayFormat(QString::fromUtf8(format));
    }

    // ---- QDateTimeEdit ----

    uintptr_t nativeDateTimeEditCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QDateTimeEdit(parent));
    }

    void nativeDateTimeEditDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QDateTimeEdit *>(static_cast<uintptr_t>(ptr));
    }

    uintptr_t nativeDateTimeEditDateTime(uintptr_t ptr)
    {
        return reinterpret_cast<uintptr_t>(
            new QDateTime(reinterpret_cast<QDateTimeEdit *>(static_cast<uintptr_t>(ptr))->dateTime()));
    }

    void nativeDateTimeEditSetDateTime(uintptr_t ptr, int y, int mo, int d, int h, int mi, int s)
    {
        reinterpret_cast<QDateTimeEdit *>(static_cast<uintptr_t>(ptr))->setDateTime(
            QDateTime(QDate(y, mo, d), QTime(h, mi, s)));
    }

    void nativeDateTimeEditSetDisplayFormat(uintptr_t ptr, const char *format)
    {
        reinterpret_cast<QDateTimeEdit *>(static_cast<uintptr_t>(ptr))->setDisplayFormat(QString::fromUtf8(format));
    }

    // ---- QDial ----

    uintptr_t nativeDialCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QDial(parent));
    }

    void nativeDialDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QDial *>(static_cast<uintptr_t>(ptr));
    }

    int nativeDialValue(uintptr_t ptr)
    {
        return reinterpret_cast<QDial *>(static_cast<uintptr_t>(ptr))->value();
    }

    void nativeDialSetValue(uintptr_t ptr, int value)
    {
        reinterpret_cast<QDial *>(static_cast<uintptr_t>(ptr))->setValue(value);
    }

    int nativeDialMinimum(uintptr_t ptr)
    {
        return reinterpret_cast<QDial *>(static_cast<uintptr_t>(ptr))->minimum();
    }

    int nativeDialMaximum(uintptr_t ptr)
    {
        return reinterpret_cast<QDial *>(static_cast<uintptr_t>(ptr))->maximum();
    }

    void nativeDialSetRange(uintptr_t ptr, int min, int max)
    {
        reinterpret_cast<QDial *>(static_cast<uintptr_t>(ptr))->setRange(min, max);
    }

    void nativeDialSetNotchesVisible(uintptr_t ptr, bool b)
    {
        reinterpret_cast<QDial *>(static_cast<uintptr_t>(ptr))->setNotchesVisible(b);
    }

    bool nativeDialNotchesVisible(uintptr_t ptr)
    {
        return reinterpret_cast<QDial *>(static_cast<uintptr_t>(ptr))->notchesVisible();
    }

    // ---- QInputDialog (static) ----

    char *nativeInputDialogGetText(uintptr_t parentPtr, const char *title, const char *label, const char *text)
    {
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return cjqt_to_cstring(QInputDialog::getText(parent, QString::fromUtf8(title), QString::fromUtf8(label),
                                                     QLineEdit::Normal, QString::fromUtf8(text)));
    }

    int nativeInputDialogGetInt(uintptr_t parentPtr, const char *title, const char *label, int value, int min, int max)
    {
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return QInputDialog::getInt(parent, QString::fromUtf8(title), QString::fromUtf8(label), value, min, max);
    }

    double nativeInputDialogGetDouble(uintptr_t parentPtr, const char *title, const char *label, double value,
                                      double min, double max)
    {
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return QInputDialog::getDouble(parent, QString::fromUtf8(title), QString::fromUtf8(label), value, min, max);
    }

    // ---- QCalendarWidget ----

    uintptr_t nativeCalendarWidgetCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QCalendarWidget(parent));
    }

    void nativeCalendarWidgetDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QCalendarWidget *>(static_cast<uintptr_t>(ptr));
    }

    uintptr_t nativeCalendarWidgetSelectedDate(uintptr_t ptr)
    {
        return reinterpret_cast<uintptr_t>(new QDate(
            reinterpret_cast<QCalendarWidget *>(static_cast<uintptr_t>(ptr))->selectedDate()));
    }

    void nativeCalendarWidgetSetSelectedDate(uintptr_t ptr, int year, int month, int day)
    {
        reinterpret_cast<QCalendarWidget *>(static_cast<uintptr_t>(ptr))->setSelectedDate(QDate(year, month, day));
    }

    int nativeCalendarWidgetYearShown(uintptr_t ptr)
    {
        return reinterpret_cast<QCalendarWidget *>(static_cast<uintptr_t>(ptr))->yearShown();
    }

    int nativeCalendarWidgetMonthShown(uintptr_t ptr)
    {
        return reinterpret_cast<QCalendarWidget *>(static_cast<uintptr_t>(ptr))->monthShown();
    }
}
