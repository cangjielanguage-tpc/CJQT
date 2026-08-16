/*
 * CJQT native bindings: QFileSystemModel, QFontComboBox, QErrorMessage, QCommandLinkButton
 */
#include <QFileSystemModel>
#include <QFontComboBox>
#include <QErrorMessage>
#include <QCommandLinkButton>
#include <QFont>
#include "object.h"
#include "native_string.h"

extern "C"
{
    // ---- QFileSystemModel ----

    uintptr_t nativeFileSystemModelCreate(uintptr_t parentPtr)
    {
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QFileSystemModel(parent));
    }

    void nativeFileSystemModelDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QFileSystemModel *>(static_cast<uintptr_t>(ptr));
    }

    void nativeFileSystemModelSetRootPath(uintptr_t ptr, const char *path)
    {
        reinterpret_cast<QFileSystemModel *>(static_cast<uintptr_t>(ptr))->setRootPath(QString::fromUtf8(path));
    }

    char *nativeFileSystemModelRootPath(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QFileSystemModel *>(static_cast<uintptr_t>(ptr))->rootPath());
    }

    int nativeFileSystemModelRowCount(uintptr_t ptr)
    {
        return reinterpret_cast<QFileSystemModel *>(static_cast<uintptr_t>(ptr))->rowCount();
    }

    // ---- QFontComboBox ----

    uintptr_t nativeFontComboBoxCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QFontComboBox(parent));
    }

    void nativeFontComboBoxDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QFontComboBox *>(static_cast<uintptr_t>(ptr));
    }

    char *nativeFontComboBoxCurrentFontFamily(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QFontComboBox *>(static_cast<uintptr_t>(ptr))->currentFont().family());
    }

    void nativeFontComboBoxSetCurrentFont(uintptr_t ptr, uintptr_t fontPtr)
    {
        QFont *font = reinterpret_cast<QFont *>(static_cast<uintptr_t>(fontPtr));
        reinterpret_cast<QFontComboBox *>(static_cast<uintptr_t>(ptr))->setCurrentFont(*font);
    }

    uintptr_t nativeFontComboBoxCurrentFont(uintptr_t ptr)
    {
        return reinterpret_cast<uintptr_t>(
            new QFont(reinterpret_cast<QFontComboBox *>(static_cast<uintptr_t>(ptr))->currentFont()));
    }

    // ---- QErrorMessage ----

    uintptr_t nativeErrorMessageCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QErrorMessage(parent));
    }

    void nativeErrorMessageDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QErrorMessage *>(static_cast<uintptr_t>(ptr));
    }

    void nativeErrorMessageShowMessage(uintptr_t ptr, const char *message)
    {
        reinterpret_cast<QErrorMessage *>(static_cast<uintptr_t>(ptr))->showMessage(QString::fromUtf8(message));
    }

    // ---- QCommandLinkButton ----

    uintptr_t nativeCommandLinkButtonCreate(const char *text, uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QCommandLinkButton(QString::fromUtf8(text), parent));
    }

    void nativeCommandLinkButtonDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QCommandLinkButton *>(static_cast<uintptr_t>(ptr));
    }

    void nativeCommandLinkButtonSetText(uintptr_t ptr, const char *text)
    {
        reinterpret_cast<QCommandLinkButton *>(static_cast<uintptr_t>(ptr))->setText(QString::fromUtf8(text));
    }

    char *nativeCommandLinkButtonText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QCommandLinkButton *>(static_cast<uintptr_t>(ptr))->text());
    }

    void nativeCommandLinkButtonSetDescription(uintptr_t ptr, const char *description)
    {
        reinterpret_cast<QCommandLinkButton *>(static_cast<uintptr_t>(ptr))->setDescription(QString::fromUtf8(description));
    }

    char *nativeCommandLinkButtonDescription(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QCommandLinkButton *>(static_cast<uintptr_t>(ptr))->description());
    }
}
