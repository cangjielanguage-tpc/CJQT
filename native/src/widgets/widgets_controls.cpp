/*
 * CJQT native bindings: QComboBox, QSlider, QProgressBar, QSpinBox
 */
#include <QComboBox>
#include <QSlider>
#include <QProgressBar>
#include <QSpinBox>
#include "object.h"
#include "native_string.h"

extern "C"
{
    // ---- QComboBox ----

    uintptr_t nativeComboBoxCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QComboBox(parent));
    }

    void nativeComboBoxDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QComboBox *>(static_cast<uintptr_t>(ptr));
    }

    void nativeComboBoxAddItem(uintptr_t ptr, const char *text)
    {
        reinterpret_cast<QComboBox *>(static_cast<uintptr_t>(ptr))->addItem(QString::fromUtf8(text));
    }

    void nativeComboBoxAddItemWithIcon(uintptr_t ptr, uintptr_t iconPtr, const char *text)
    {
        QIcon *icon = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        reinterpret_cast<QComboBox *>(static_cast<uintptr_t>(ptr))->addItem(*icon, QString::fromUtf8(text));
    }

    void nativeComboBoxInsertItem(uintptr_t ptr, int index, const char *text)
    {
        reinterpret_cast<QComboBox *>(static_cast<uintptr_t>(ptr))->insertItem(index, QString::fromUtf8(text));
    }

    int nativeComboBoxCount(uintptr_t ptr)
    {
        return reinterpret_cast<QComboBox *>(static_cast<uintptr_t>(ptr))->count();
    }

    int nativeComboBoxCurrentIndex(uintptr_t ptr)
    {
        return reinterpret_cast<QComboBox *>(static_cast<uintptr_t>(ptr))->currentIndex();
    }

    void nativeComboBoxSetCurrentIndex(uintptr_t ptr, int index)
    {
        reinterpret_cast<QComboBox *>(static_cast<uintptr_t>(ptr))->setCurrentIndex(index);
    }

    char *nativeComboBoxCurrentText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QComboBox *>(static_cast<uintptr_t>(ptr))->currentText());
    }

    void nativeComboBoxSetCurrentText(uintptr_t ptr, const char *text)
    {
        reinterpret_cast<QComboBox *>(static_cast<uintptr_t>(ptr))->setCurrentText(QString::fromUtf8(text));
    }

    char *nativeComboBoxItemText(uintptr_t ptr, int index)
    {
        return cjqt_to_cstring(reinterpret_cast<QComboBox *>(static_cast<uintptr_t>(ptr))->itemText(index));
    }

    void nativeComboBoxSetEditable(uintptr_t ptr, bool editable)
    {
        reinterpret_cast<QComboBox *>(static_cast<uintptr_t>(ptr))->setEditable(editable);
    }

    bool nativeComboBoxIsEditable(uintptr_t ptr)
    {
        return reinterpret_cast<QComboBox *>(static_cast<uintptr_t>(ptr))->isEditable();
    }

    void nativeComboBoxClear(uintptr_t ptr)
    {
        reinterpret_cast<QComboBox *>(static_cast<uintptr_t>(ptr))->clear();
    }

    void nativeComboBoxRemoveItem(uintptr_t ptr, int index)
    {
        reinterpret_cast<QComboBox *>(static_cast<uintptr_t>(ptr))->removeItem(index);
    }

    // ---- QSlider ----

    uintptr_t nativeSliderCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QSlider(parent));
    }

    uintptr_t nativeSliderCreateWithOrientation(int orientation, uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QSlider(static_cast<Qt::Orientation>(orientation), parent));
    }

    void nativeSliderDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QSlider *>(static_cast<uintptr_t>(ptr));
    }

    int nativeSliderValue(uintptr_t ptr)
    {
        return reinterpret_cast<QSlider *>(static_cast<uintptr_t>(ptr))->value();
    }

    void nativeSliderSetValue(uintptr_t ptr, int value)
    {
        reinterpret_cast<QSlider *>(static_cast<uintptr_t>(ptr))->setValue(value);
    }

    int nativeSliderMinimum(uintptr_t ptr)
    {
        return reinterpret_cast<QSlider *>(static_cast<uintptr_t>(ptr))->minimum();
    }

    int nativeSliderMaximum(uintptr_t ptr)
    {
        return reinterpret_cast<QSlider *>(static_cast<uintptr_t>(ptr))->maximum();
    }

    void nativeSliderSetRange(uintptr_t ptr, int min, int max)
    {
        reinterpret_cast<QSlider *>(static_cast<uintptr_t>(ptr))->setRange(min, max);
    }

    int nativeSliderOrientation(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QSlider *>(static_cast<uintptr_t>(ptr))->orientation());
    }

    void nativeSliderSetOrientation(uintptr_t ptr, int orientation)
    {
        reinterpret_cast<QSlider *>(static_cast<uintptr_t>(ptr))->setOrientation(static_cast<Qt::Orientation>(orientation));
    }

    void nativeSliderSetTickInterval(uintptr_t ptr, int interval)
    {
        reinterpret_cast<QSlider *>(static_cast<uintptr_t>(ptr))->setTickInterval(interval);
    }

    void nativeSliderSetSingleStep(uintptr_t ptr, int step)
    {
        reinterpret_cast<QSlider *>(static_cast<uintptr_t>(ptr))->setSingleStep(step);
    }

    // ---- QProgressBar ----

    uintptr_t nativeProgressBarCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QProgressBar(parent));
    }

    void nativeProgressBarDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QProgressBar *>(static_cast<uintptr_t>(ptr));
    }

    int nativeProgressBarValue(uintptr_t ptr)
    {
        return reinterpret_cast<QProgressBar *>(static_cast<uintptr_t>(ptr))->value();
    }

    void nativeProgressBarSetValue(uintptr_t ptr, int value)
    {
        reinterpret_cast<QProgressBar *>(static_cast<uintptr_t>(ptr))->setValue(value);
    }

    int nativeProgressBarMinimum(uintptr_t ptr)
    {
        return reinterpret_cast<QProgressBar *>(static_cast<uintptr_t>(ptr))->minimum();
    }

    int nativeProgressBarMaximum(uintptr_t ptr)
    {
        return reinterpret_cast<QProgressBar *>(static_cast<uintptr_t>(ptr))->maximum();
    }

    void nativeProgressBarSetRange(uintptr_t ptr, int min, int max)
    {
        reinterpret_cast<QProgressBar *>(static_cast<uintptr_t>(ptr))->setRange(min, max);
    }

    char *nativeProgressBarText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QProgressBar *>(static_cast<uintptr_t>(ptr))->text());
    }

    void nativeProgressBarSetFormat(uintptr_t ptr, const char *format)
    {
        reinterpret_cast<QProgressBar *>(static_cast<uintptr_t>(ptr))->setFormat(QString::fromUtf8(format));
    }

    void nativeProgressBarSetTextVisible(uintptr_t ptr, bool visible)
    {
        reinterpret_cast<QProgressBar *>(static_cast<uintptr_t>(ptr))->setTextVisible(visible);
    }

    bool nativeProgressBarIsTextVisible(uintptr_t ptr)
    {
        return reinterpret_cast<QProgressBar *>(static_cast<uintptr_t>(ptr))->isTextVisible();
    }

    // ---- QSpinBox ----

    uintptr_t nativeSpinBoxCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QSpinBox(parent));
    }

    void nativeSpinBoxDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QSpinBox *>(static_cast<uintptr_t>(ptr));
    }

    int nativeSpinBoxValue(uintptr_t ptr)
    {
        return reinterpret_cast<QSpinBox *>(static_cast<uintptr_t>(ptr))->value();
    }

    void nativeSpinBoxSetValue(uintptr_t ptr, int value)
    {
        reinterpret_cast<QSpinBox *>(static_cast<uintptr_t>(ptr))->setValue(value);
    }

    int nativeSpinBoxMinimum(uintptr_t ptr)
    {
        return reinterpret_cast<QSpinBox *>(static_cast<uintptr_t>(ptr))->minimum();
    }

    int nativeSpinBoxMaximum(uintptr_t ptr)
    {
        return reinterpret_cast<QSpinBox *>(static_cast<uintptr_t>(ptr))->maximum();
    }

    void nativeSpinBoxSetRange(uintptr_t ptr, int min, int max)
    {
        reinterpret_cast<QSpinBox *>(static_cast<uintptr_t>(ptr))->setRange(min, max);
    }

    char *nativeSpinBoxText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QSpinBox *>(static_cast<uintptr_t>(ptr))->text());
    }

    void nativeSpinBoxSetPrefix(uintptr_t ptr, const char *prefix)
    {
        reinterpret_cast<QSpinBox *>(static_cast<uintptr_t>(ptr))->setPrefix(QString::fromUtf8(prefix));
    }

    void nativeSpinBoxSetSuffix(uintptr_t ptr, const char *suffix)
    {
        reinterpret_cast<QSpinBox *>(static_cast<uintptr_t>(ptr))->setSuffix(QString::fromUtf8(suffix));
    }

    void nativeSpinBoxSetSingleStep(uintptr_t ptr, int step)
    {
        reinterpret_cast<QSpinBox *>(static_cast<uintptr_t>(ptr))->setSingleStep(step);
    }
}
