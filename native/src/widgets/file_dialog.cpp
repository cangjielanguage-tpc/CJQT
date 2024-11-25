#include "file_dialog.h"
#include <QUrl>

extern "C"
{

    // QFileDialog

    uintptr_t nativeFileDialogGetOpenFileUrl(uintptr_t parentPtr, const char *caption, uintptr_t dirPtr, const char *filter)
    {
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        QUrl *dir = reinterpret_cast<QUrl *>(static_cast<uintptr_t>(dirPtr));
        QUrl url = QFileDialog::getOpenFileUrl(parent, caption, *dir, filter,
                                               Q_NULLPTR,
                                               QFileDialog::DontUseNativeDialog);
        return reinterpret_cast<uintptr_t>(&url);
    }

    const char *nativeFileDialogGetOpenFileName(uintptr_t parentPtr, const char *caption, const char *dir, const char *filter)
    {
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        QString str = QFileDialog::getOpenFileName(parent, caption, dir, filter);
        return qstrdup(str.toUtf8());
    }

    uintptr_t nativeFileDialogGetSaveFileUrl(uintptr_t parentPtr, const char *caption, uintptr_t dirPtr, const char *filter)
    {
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        QUrl *dir = reinterpret_cast<QUrl *>(static_cast<uintptr_t>(dirPtr));
        QUrl url = QFileDialog::getSaveFileUrl(parent, caption, *dir, filter,
                                               Q_NULLPTR,
                                               QFileDialog::DontUseNativeDialog);
        return reinterpret_cast<uintptr_t>(&url);
    }

    const char *nativeFileDialogGetSaveFileName(uintptr_t parentPtr, const char *caption, const char *dir, const char *filter)
    {
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        QString str = QFileDialog::getSaveFileName(parent, caption, dir, filter);
        return qstrdup(str.toUtf8());
    }
}