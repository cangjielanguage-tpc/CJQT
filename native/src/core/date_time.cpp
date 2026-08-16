/*
 * CJQT native bindings: QDate, QTime, QDateTime
 */
#include <QDate>
#include <QTime>
#include <QDateTime>
#include "native_string.h"

extern "C"
{
    // ---- QDate ----

    uintptr_t nativeDateCreate(int year, int month, int day)
    {
        return reinterpret_cast<uintptr_t>(new QDate(year, month, day));
    }

    void nativeDateDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QDate *>(static_cast<uintptr_t>(ptr));
    }

    int nativeDateYear(uintptr_t ptr)
    {
        return reinterpret_cast<QDate *>(static_cast<uintptr_t>(ptr))->year();
    }

    int nativeDateMonth(uintptr_t ptr)
    {
        return reinterpret_cast<QDate *>(static_cast<uintptr_t>(ptr))->month();
    }

    int nativeDateDay(uintptr_t ptr)
    {
        return reinterpret_cast<QDate *>(static_cast<uintptr_t>(ptr))->day();
    }

    int nativeDateDayOfWeek(uintptr_t ptr)
    {
        return reinterpret_cast<QDate *>(static_cast<uintptr_t>(ptr))->dayOfWeek();
    }

    bool nativeDateIsValid(uintptr_t ptr)
    {
        return reinterpret_cast<QDate *>(static_cast<uintptr_t>(ptr))->isValid();
    }

    char *nativeDateToString(uintptr_t ptr, const char *format)
    {
        QDate *date = reinterpret_cast<QDate *>(static_cast<uintptr_t>(ptr));
        return cjqt_to_cstring(date->toString(QString::fromUtf8(format)));
    }

    uintptr_t nativeDateCurrentDate()
    {
        return reinterpret_cast<uintptr_t>(new QDate(QDate::currentDate()));
    }

    uintptr_t nativeDateAddDays(uintptr_t ptr, intptr_t days)
    {
        QDate *date = reinterpret_cast<QDate *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(new QDate(date->addDays(days)));
    }

    intptr_t nativeDateDaysTo(uintptr_t ptr, uintptr_t otherPtr)
    {
        QDate *date = reinterpret_cast<QDate *>(static_cast<uintptr_t>(ptr));
        QDate *other = reinterpret_cast<QDate *>(static_cast<uintptr_t>(otherPtr));
        return date->daysTo(*other);
    }

    // ---- QTime ----

    uintptr_t nativeTimeCreate(int hour, int minute, int second, int msec)
    {
        return reinterpret_cast<uintptr_t>(new QTime(hour, minute, second, msec));
    }

    void nativeTimeDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QTime *>(static_cast<uintptr_t>(ptr));
    }

    int nativeTimeHour(uintptr_t ptr)
    {
        return reinterpret_cast<QTime *>(static_cast<uintptr_t>(ptr))->hour();
    }

    int nativeTimeMinute(uintptr_t ptr)
    {
        return reinterpret_cast<QTime *>(static_cast<uintptr_t>(ptr))->minute();
    }

    int nativeTimeSecond(uintptr_t ptr)
    {
        return reinterpret_cast<QTime *>(static_cast<uintptr_t>(ptr))->second();
    }

    int nativeTimeMsec(uintptr_t ptr)
    {
        return reinterpret_cast<QTime *>(static_cast<uintptr_t>(ptr))->msec();
    }

    bool nativeTimeIsValid(uintptr_t ptr)
    {
        return reinterpret_cast<QTime *>(static_cast<uintptr_t>(ptr))->isValid();
    }

    char *nativeTimeToString(uintptr_t ptr, const char *format)
    {
        QTime *time = reinterpret_cast<QTime *>(static_cast<uintptr_t>(ptr));
        return cjqt_to_cstring(time->toString(QString::fromUtf8(format)));
    }

    uintptr_t nativeTimeCurrentTime()
    {
        return reinterpret_cast<uintptr_t>(new QTime(QTime::currentTime()));
    }

    uintptr_t nativeTimeAddSecs(uintptr_t ptr, int secs)
    {
        QTime *time = reinterpret_cast<QTime *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(new QTime(time->addSecs(secs)));
    }

    // ---- QDateTime ----

    uintptr_t nativeDateTimeCreate(int year, int month, int day, int hour, int minute, int second, int msec)
    {
        QDate date(year, month, day);
        QTime time(hour, minute, second, msec);
        return reinterpret_cast<uintptr_t>(new QDateTime(date, time));
    }

    void nativeDateTimeDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QDateTime *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeDateTimeIsValid(uintptr_t ptr)
    {
        return reinterpret_cast<QDateTime *>(static_cast<uintptr_t>(ptr))->isValid();
    }

    char *nativeDateTimeToString(uintptr_t ptr, const char *format)
    {
        QDateTime *dt = reinterpret_cast<QDateTime *>(static_cast<uintptr_t>(ptr));
        return cjqt_to_cstring(dt->toString(QString::fromUtf8(format)));
    }

    uintptr_t nativeDateTimeCurrentDateTime()
    {
        return reinterpret_cast<uintptr_t>(new QDateTime(QDateTime::currentDateTime()));
    }

    uintptr_t nativeDateTimeDate(uintptr_t ptr)
    {
        QDateTime *dt = reinterpret_cast<QDateTime *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(new QDate(dt->date()));
    }

    uintptr_t nativeDateTimeTime(uintptr_t ptr)
    {
        QDateTime *dt = reinterpret_cast<QDateTime *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(new QTime(dt->time()));
    }

    uintptr_t nativeDateTimeAddDays(uintptr_t ptr, intptr_t days)
    {
        QDateTime *dt = reinterpret_cast<QDateTime *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(new QDateTime(dt->addDays(days)));
    }
}
