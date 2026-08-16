/*
 * CJQT native bindings: QProcess, QSettings
 */
#include <QProcess>
#include <QSettings>
#include <QStringList>
#include "native_string.h"

extern "C"
{
    // ---- QProcess ----

    uintptr_t nativeProcessCreate(uintptr_t parentPtr)
    {
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QProcess(parent));
    }

    void nativeProcessDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QProcess *>(static_cast<uintptr_t>(ptr));
    }

    void nativeProcessStart(uintptr_t ptr, const char *program, uintptr_t argsPtr)
    {
        QProcess *proc = reinterpret_cast<QProcess *>(static_cast<uintptr_t>(ptr));
        QStringList *args = reinterpret_cast<QStringList *>(static_cast<uintptr_t>(argsPtr));
        if (args != nullptr)
        {
            proc->start(QString::fromUtf8(program), *args);
        }
        else
        {
            proc->start(QString::fromUtf8(program));
        }
    }

    bool nativeProcessWaitForStarted(uintptr_t ptr, int msecs)
    {
        return reinterpret_cast<QProcess *>(static_cast<uintptr_t>(ptr))->waitForStarted(msecs);
    }

    bool nativeProcessWaitForFinished(uintptr_t ptr, int msecs)
    {
        return reinterpret_cast<QProcess *>(static_cast<uintptr_t>(ptr))->waitForFinished(msecs);
    }

    char *nativeProcessReadAllStandardOutput(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QProcess *>(static_cast<uintptr_t>(ptr))->readAllStandardOutput());
    }

    char *nativeProcessReadAllStandardError(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QProcess *>(static_cast<uintptr_t>(ptr))->readAllStandardError());
    }

    void nativeProcessWrite(uintptr_t ptr, const char *data)
    {
        reinterpret_cast<QProcess *>(static_cast<uintptr_t>(ptr))->write(data);
    }

    void nativeProcessKill(uintptr_t ptr)
    {
        reinterpret_cast<QProcess *>(static_cast<uintptr_t>(ptr))->kill();
    }

    void nativeProcessTerminate(uintptr_t ptr)
    {
        reinterpret_cast<QProcess *>(static_cast<uintptr_t>(ptr))->terminate();
    }

    int nativeProcessExitCode(uintptr_t ptr)
    {
        return reinterpret_cast<QProcess *>(static_cast<uintptr_t>(ptr))->exitCode();
    }

    int nativeProcessState(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QProcess *>(static_cast<uintptr_t>(ptr))->state());
    }

    // ---- QSettings ----

    uintptr_t nativeSettingsCreate(const char *organization, const char *app)
    {
        return reinterpret_cast<uintptr_t>(new QSettings(QString::fromUtf8(organization), QString::fromUtf8(app)));
    }

    void nativeSettingsDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QSettings *>(static_cast<uintptr_t>(ptr));
    }

    char *nativeSettingsValue(uintptr_t ptr, const char *key)
    {
        return cjqt_to_cstring(reinterpret_cast<QSettings *>(static_cast<uintptr_t>(ptr))->value(QString::fromUtf8(key)).toString());
    }

    void nativeSettingsSetValue(uintptr_t ptr, const char *key, const char *value)
    {
        reinterpret_cast<QSettings *>(static_cast<uintptr_t>(ptr))->setValue(QString::fromUtf8(key),
                                                                             QString::fromUtf8(value));
    }

    bool nativeSettingsContains(uintptr_t ptr, const char *key)
    {
        return reinterpret_cast<QSettings *>(static_cast<uintptr_t>(ptr))->contains(QString::fromUtf8(key));
    }

    void nativeSettingsRemove(uintptr_t ptr, const char *key)
    {
        reinterpret_cast<QSettings *>(static_cast<uintptr_t>(ptr))->remove(QString::fromUtf8(key));
    }

    void nativeSettingsSync(uintptr_t ptr)
    {
        reinterpret_cast<QSettings *>(static_cast<uintptr_t>(ptr))->sync();
    }

    uintptr_t nativeSettingsAllKeys(uintptr_t ptr)
    {
        QSettings *settings = reinterpret_cast<QSettings *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(new QStringList(settings->allKeys()));
    }
}
