#include "file_dialog.h"
#include <QUrl>

extern "C"
{

    // QFileDialog

    long nativeFileDialogGetOpenFileUrl(long parentPtr, const char *caption, long dirPtr, const char *filter)
    {
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        QUrl *dir = reinterpret_cast<QUrl *>(static_cast<uintptr_t>(dirPtr));
        QUrl url = QFileDialog::getOpenFileUrl(parent, caption, *dir, filter,
                                               Q_NULLPTR,
                                               QFileDialog::DontUseNativeDialog);
        return reinterpret_cast<long>(&url);
    }

    const char *nativeFileDialogGetOpenFileName(long parentPtr, const char *caption, const char *dir, const char *filter)
    {
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        QString str = QFileDialog::getOpenFileName(parent, caption, dir, filter);
        return qstrdup(str.toUtf8());
    }

    long nativeFileDialogGetSaveFileUrl(long parentPtr, const char *caption, long dirPtr, const char *filter)
    {
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        QUrl *dir = reinterpret_cast<QUrl *>(static_cast<uintptr_t>(dirPtr));
        QUrl url = QFileDialog::getSaveFileUrl(parent, caption, *dir, filter,
                                               Q_NULLPTR,
                                               QFileDialog::DontUseNativeDialog);
        return reinterpret_cast<long>(&url);
    }

    const char *nativeFileDialogGetSaveFileName(long parentPtr, const char *caption, const char *dir, const char *filter)
    {
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        QString str = QFileDialog::getSaveFileName(parent, caption, dir, filter);
        return qstrdup(str.toUtf8());
    }
}