/*
 * CJQT native bindings: QPlainTextEdit, QToolButton, QTimeEdit, QDoubleSpinBox,
 * QLCDNumber, QFormLayout, QColorDialog
 */
#include <QPlainTextEdit>
#include <QToolButton>
#include <QTimeEdit>
#include <QDoubleSpinBox>
#include <QLCDNumber>
#include <QFormLayout>
#include <QColorDialog>
#include <QTime>
#include "object.h"
#include "native_string.h"

extern "C"
{
    // ---- QPlainTextEdit ----

    uintptr_t nativePlainTextEditCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QPlainTextEdit(parent));
    }

    void nativePlainTextEditDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QPlainTextEdit *>(static_cast<uintptr_t>(ptr));
    }

    void nativePlainTextEditSetPlainText(uintptr_t ptr, const char *text)
    {
        reinterpret_cast<QPlainTextEdit *>(static_cast<uintptr_t>(ptr))->setPlainText(QString::fromUtf8(text));
    }

    char *nativePlainTextEditToPlainText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QPlainTextEdit *>(static_cast<uintptr_t>(ptr))->toPlainText());
    }

    void nativePlainTextEditAppendPlainText(uintptr_t ptr, const char *text)
    {
        reinterpret_cast<QPlainTextEdit *>(static_cast<uintptr_t>(ptr))->appendPlainText(QString::fromUtf8(text));
    }

    void nativePlainTextEditClear(uintptr_t ptr)
    {
        reinterpret_cast<QPlainTextEdit *>(static_cast<uintptr_t>(ptr))->clear();
    }

    void nativePlainTextEditSetReadOnly(uintptr_t ptr, bool b)
    {
        reinterpret_cast<QPlainTextEdit *>(static_cast<uintptr_t>(ptr))->setReadOnly(b);
    }

    bool nativePlainTextEditIsReadOnly(uintptr_t ptr)
    {
        return reinterpret_cast<QPlainTextEdit *>(static_cast<uintptr_t>(ptr))->isReadOnly();
    }

    void nativePlainTextEditSetPlaceholderText(uintptr_t ptr, const char *text)
    {
        reinterpret_cast<QPlainTextEdit *>(static_cast<uintptr_t>(ptr))->setPlaceholderText(QString::fromUtf8(text));
    }

    char *nativePlainTextEditPlaceholderText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QPlainTextEdit *>(static_cast<uintptr_t>(ptr))->placeholderText());
    }

    // ---- QToolButton ----

    uintptr_t nativeToolButtonCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QToolButton(parent));
    }

    void nativeToolButtonDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QToolButton *>(static_cast<uintptr_t>(ptr));
    }

    void nativeToolButtonSetText(uintptr_t ptr, const char *text)
    {
        reinterpret_cast<QToolButton *>(static_cast<uintptr_t>(ptr))->setText(QString::fromUtf8(text));
    }

    char *nativeToolButtonText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QToolButton *>(static_cast<uintptr_t>(ptr))->text());
    }

    void nativeToolButtonSetIcon(uintptr_t ptr, uintptr_t iconPtr)
    {
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        reinterpret_cast<QToolButton *>(static_cast<uintptr_t>(ptr))->setIcon(*icon);
    }

    void nativeToolButtonSetAutoRaise(uintptr_t ptr, bool b)
    {
        reinterpret_cast<QToolButton *>(static_cast<uintptr_t>(ptr))->setAutoRaise(b);
    }

    bool nativeToolButtonAutoRaise(uintptr_t ptr)
    {
        return reinterpret_cast<QToolButton *>(static_cast<uintptr_t>(ptr))->autoRaise();
    }

    // ---- QTimeEdit ----

    uintptr_t nativeTimeEditCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QTimeEdit(parent));
    }

    void nativeTimeEditDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QTimeEdit *>(static_cast<uintptr_t>(ptr));
    }

    int nativeTimeEditHour(uintptr_t ptr)
    {
        return reinterpret_cast<QTimeEdit *>(static_cast<uintptr_t>(ptr))->time().hour();
    }

    int nativeTimeEditMinute(uintptr_t ptr)
    {
        return reinterpret_cast<QTimeEdit *>(static_cast<uintptr_t>(ptr))->time().minute();
    }

    int nativeTimeEditSecond(uintptr_t ptr)
    {
        return reinterpret_cast<QTimeEdit *>(static_cast<uintptr_t>(ptr))->time().second();
    }

    void nativeTimeEditSetTime(uintptr_t ptr, int hour, int minute, int second)
    {
        reinterpret_cast<QTimeEdit *>(static_cast<uintptr_t>(ptr))->setTime(QTime(hour, minute, second));
    }

    void nativeTimeEditSetTimeRange(uintptr_t ptr, int h1, int m1, int h2, int m2)
    {
        reinterpret_cast<QTimeEdit *>(static_cast<uintptr_t>(ptr))->setTimeRange(QTime(h1, m1), QTime(h2, m2));
    }

    void nativeTimeEditSetDisplayFormat(uintptr_t ptr, const char *format)
    {
        reinterpret_cast<QTimeEdit *>(static_cast<uintptr_t>(ptr))->setDisplayFormat(QString::fromUtf8(format));
    }

    // ---- QDoubleSpinBox ----

    uintptr_t nativeDoubleSpinBoxCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QDoubleSpinBox(parent));
    }

    void nativeDoubleSpinBoxDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QDoubleSpinBox *>(static_cast<uintptr_t>(ptr));
    }

    double nativeDoubleSpinBoxValue(uintptr_t ptr)
    {
        return reinterpret_cast<QDoubleSpinBox *>(static_cast<uintptr_t>(ptr))->value();
    }

    void nativeDoubleSpinBoxSetValue(uintptr_t ptr, double value)
    {
        reinterpret_cast<QDoubleSpinBox *>(static_cast<uintptr_t>(ptr))->setValue(value);
    }

    double nativeDoubleSpinBoxMinimum(uintptr_t ptr)
    {
        return reinterpret_cast<QDoubleSpinBox *>(static_cast<uintptr_t>(ptr))->minimum();
    }

    double nativeDoubleSpinBoxMaximum(uintptr_t ptr)
    {
        return reinterpret_cast<QDoubleSpinBox *>(static_cast<uintptr_t>(ptr))->maximum();
    }

    void nativeDoubleSpinBoxSetRange(uintptr_t ptr, double min, double max)
    {
        reinterpret_cast<QDoubleSpinBox *>(static_cast<uintptr_t>(ptr))->setRange(min, max);
    }

    void nativeDoubleSpinBoxSetDecimals(uintptr_t ptr, int decimals)
    {
        reinterpret_cast<QDoubleSpinBox *>(static_cast<uintptr_t>(ptr))->setDecimals(decimals);
    }

    int nativeDoubleSpinBoxDecimals(uintptr_t ptr)
    {
        return reinterpret_cast<QDoubleSpinBox *>(static_cast<uintptr_t>(ptr))->decimals();
    }

    char *nativeDoubleSpinBoxText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QDoubleSpinBox *>(static_cast<uintptr_t>(ptr))->text());
    }

    void nativeDoubleSpinBoxSetPrefix(uintptr_t ptr, const char *prefix)
    {
        reinterpret_cast<QDoubleSpinBox *>(static_cast<uintptr_t>(ptr))->setPrefix(QString::fromUtf8(prefix));
    }

    // ---- QLCDNumber ----

    uintptr_t nativeLcdNumberCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QLCDNumber(parent));
    }

    void nativeLcdNumberDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QLCDNumber *>(static_cast<uintptr_t>(ptr));
    }

    void nativeLcdNumberDisplay(uintptr_t ptr, int number)
    {
        reinterpret_cast<QLCDNumber *>(static_cast<uintptr_t>(ptr))->display(number);
    }

    int nativeLcdNumberValue(uintptr_t ptr)
    {
        return reinterpret_cast<QLCDNumber *>(static_cast<uintptr_t>(ptr))->intValue();
    }

    void nativeLcdNumberSetDigitCount(uintptr_t ptr, int count)
    {
        reinterpret_cast<QLCDNumber *>(static_cast<uintptr_t>(ptr))->setDigitCount(count);
    }

    int nativeLcdNumberDigitCount(uintptr_t ptr)
    {
        return reinterpret_cast<QLCDNumber *>(static_cast<uintptr_t>(ptr))->digitCount();
    }

    // ---- QFormLayout ----

    uintptr_t nativeFormLayoutCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QFormLayout(parent));
    }

    void nativeFormLayoutDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QFormLayout *>(static_cast<uintptr_t>(ptr));
    }

    void nativeFormLayoutAddRow(uintptr_t ptr, const char *label, uintptr_t fieldPtr)
    {
        QWidget *field = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(fieldPtr));
        reinterpret_cast<QFormLayout *>(static_cast<uintptr_t>(ptr))->addRow(QString::fromUtf8(label), field);
    }

    void nativeFormLayoutAddRowWidget(uintptr_t ptr, uintptr_t labelPtr, uintptr_t fieldPtr)
    {
        QWidget *labelW = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(labelPtr));
        QWidget *field = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(fieldPtr));
        reinterpret_cast<QFormLayout *>(static_cast<uintptr_t>(ptr))->addRow(labelW, field);
    }

    void nativeFormLayoutAddRowSpanning(uintptr_t ptr, uintptr_t widgetPtr)
    {
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        reinterpret_cast<QFormLayout *>(static_cast<uintptr_t>(ptr))->addRow(widget);
    }

    int nativeFormLayoutRowCount(uintptr_t ptr)
    {
        return reinterpret_cast<QFormLayout *>(static_cast<uintptr_t>(ptr))->rowCount();
    }

    // ---- QColorDialog ----

    uintptr_t nativeColorDialogCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QColorDialog(parent));
    }

    void nativeColorDialogDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QColorDialog *>(static_cast<uintptr_t>(ptr));
    }

    void nativeColorDialogSetCurrentColor(uintptr_t ptr, unsigned int rgba)
    {
        reinterpret_cast<QColorDialog *>(static_cast<uintptr_t>(ptr))->setCurrentColor(QColor::fromRgba(rgba));
    }

    unsigned int nativeColorDialogCurrentColor(uintptr_t ptr)
    {
        return reinterpret_cast<QColorDialog *>(static_cast<uintptr_t>(ptr))->currentColor().rgba();
    }

    unsigned int nativeColorDialogGetColor(unsigned int rgba)
    {
        return QColorDialog::getColor(QColor::fromRgba(rgba)).rgba();
    }
}
