/*
 * CJQT native bindings: QAudioFormat, QAudioDeviceInfo, QAudioInput, QAudioOutput, QSound
 */
#include <QAudioFormat>
#include <QAudioDeviceInfo>
#include <QAudioInput>
#include <QAudioOutput>
#include <QSound>
#include <QObject>
#include "native_string.h"

extern "C"
{
    // ---- QAudioFormat ----

    uintptr_t nativeAudioFormatCreate()
    {
        return reinterpret_cast<uintptr_t>(new QAudioFormat());
    }

    void nativeAudioFormatDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QAudioFormat *>(static_cast<uintptr_t>(ptr));
    }

    void nativeAudioFormatSetSampleRate(uintptr_t ptr, int rate)
    {
        reinterpret_cast<QAudioFormat *>(static_cast<uintptr_t>(ptr))->setSampleRate(rate);
    }

    int nativeAudioFormatSampleRate(uintptr_t ptr)
    {
        return reinterpret_cast<QAudioFormat *>(static_cast<uintptr_t>(ptr))->sampleRate();
    }

    void nativeAudioFormatSetChannelCount(uintptr_t ptr, int count)
    {
        reinterpret_cast<QAudioFormat *>(static_cast<uintptr_t>(ptr))->setChannelCount(count);
    }

    int nativeAudioFormatChannelCount(uintptr_t ptr)
    {
        return reinterpret_cast<QAudioFormat *>(static_cast<uintptr_t>(ptr))->channelCount();
    }

    void nativeAudioFormatSetSampleSize(uintptr_t ptr, int size)
    {
        reinterpret_cast<QAudioFormat *>(static_cast<uintptr_t>(ptr))->setSampleSize(size);
    }

    int nativeAudioFormatSampleSize(uintptr_t ptr)
    {
        return reinterpret_cast<QAudioFormat *>(static_cast<uintptr_t>(ptr))->sampleSize();
    }

    bool nativeAudioFormatIsValid(uintptr_t ptr)
    {
        return reinterpret_cast<QAudioFormat *>(static_cast<uintptr_t>(ptr))->isValid();
    }

    // ---- QAudioDeviceInfo ----

    uintptr_t nativeAudioDeviceInfoDefaultInput()
    {
        return reinterpret_cast<uintptr_t>(new QAudioDeviceInfo(QAudioDeviceInfo::defaultInputDevice()));
    }

    uintptr_t nativeAudioDeviceInfoDefaultOutput()
    {
        return reinterpret_cast<uintptr_t>(new QAudioDeviceInfo(QAudioDeviceInfo::defaultOutputDevice()));
    }

    void nativeAudioDeviceInfoDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QAudioDeviceInfo *>(static_cast<uintptr_t>(ptr));
    }

    char *nativeAudioDeviceInfoDeviceName(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QAudioDeviceInfo *>(static_cast<uintptr_t>(ptr))->deviceName());
    }

    bool nativeAudioDeviceInfoIsNull(uintptr_t ptr)
    {
        return reinterpret_cast<QAudioDeviceInfo *>(static_cast<uintptr_t>(ptr))->isNull();
    }

    bool nativeAudioDeviceInfoIsFormatSupported(uintptr_t ptr, uintptr_t formatPtr)
    {
        QAudioFormat *format = reinterpret_cast<QAudioFormat *>(static_cast<uintptr_t>(formatPtr));
        return reinterpret_cast<QAudioDeviceInfo *>(static_cast<uintptr_t>(ptr))->isFormatSupported(*format);
    }

    // ---- QAudioInput ----

    uintptr_t nativeAudioInputCreate(uintptr_t devicePtr, uintptr_t formatPtr, uintptr_t parentPtr)
    {
        QAudioDeviceInfo *device = reinterpret_cast<QAudioDeviceInfo *>(static_cast<uintptr_t>(devicePtr));
        QAudioFormat *format = reinterpret_cast<QAudioFormat *>(static_cast<uintptr_t>(formatPtr));
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QAudioInput(*device, *format, parent));
    }

    void nativeAudioInputDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QAudioInput *>(static_cast<uintptr_t>(ptr));
    }

    void nativeAudioInputStart(uintptr_t ptr)
    {
        reinterpret_cast<QAudioInput *>(static_cast<uintptr_t>(ptr))->start();
    }

    void nativeAudioInputStop(uintptr_t ptr)
    {
        reinterpret_cast<QAudioInput *>(static_cast<uintptr_t>(ptr))->stop();
    }

    int nativeAudioInputState(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QAudioInput *>(static_cast<uintptr_t>(ptr))->state());
    }

    void nativeAudioInputSetVolume(uintptr_t ptr, double volume)
    {
        reinterpret_cast<QAudioInput *>(static_cast<uintptr_t>(ptr))->setVolume(volume);
    }

    double nativeAudioInputVolume(uintptr_t ptr)
    {
        return reinterpret_cast<QAudioInput *>(static_cast<uintptr_t>(ptr))->volume();
    }

    // ---- QAudioOutput ----

    uintptr_t nativeAudioOutputCreate(uintptr_t devicePtr, uintptr_t formatPtr, uintptr_t parentPtr)
    {
        QAudioDeviceInfo *device = reinterpret_cast<QAudioDeviceInfo *>(static_cast<uintptr_t>(devicePtr));
        QAudioFormat *format = reinterpret_cast<QAudioFormat *>(static_cast<uintptr_t>(formatPtr));
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QAudioOutput(*device, *format, parent));
    }

    void nativeAudioOutputDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QAudioOutput *>(static_cast<uintptr_t>(ptr));
    }

    void nativeAudioOutputStart(uintptr_t ptr)
    {
        reinterpret_cast<QAudioOutput *>(static_cast<uintptr_t>(ptr))->start();
    }

    void nativeAudioOutputStop(uintptr_t ptr)
    {
        reinterpret_cast<QAudioOutput *>(static_cast<uintptr_t>(ptr))->stop();
    }

    int nativeAudioOutputState(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QAudioOutput *>(static_cast<uintptr_t>(ptr))->state());
    }

    void nativeAudioOutputSetVolume(uintptr_t ptr, double volume)
    {
        reinterpret_cast<QAudioOutput *>(static_cast<uintptr_t>(ptr))->setVolume(volume);
    }

    double nativeAudioOutputVolume(uintptr_t ptr)
    {
        return reinterpret_cast<QAudioOutput *>(static_cast<uintptr_t>(ptr))->volume();
    }

    // ---- QSound ----

    uintptr_t nativeSoundCreate(const char *path, uintptr_t parentPtr)
    {
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QSound(QString::fromUtf8(path), parent));
    }

    void nativeSoundDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QSound *>(static_cast<uintptr_t>(ptr));
    }

    void nativeSoundPlay(uintptr_t ptr)
    {
        reinterpret_cast<QSound *>(static_cast<uintptr_t>(ptr))->play();
    }

    void nativeSoundStop(uintptr_t ptr)
    {
        reinterpret_cast<QSound *>(static_cast<uintptr_t>(ptr))->stop();
    }

    void nativeSoundSetLoops(uintptr_t ptr, int loops)
    {
        reinterpret_cast<QSound *>(static_cast<uintptr_t>(ptr))->setLoops(loops);
    }

    int nativeSoundLoops(uintptr_t ptr)
    {
        return reinterpret_cast<QSound *>(static_cast<uintptr_t>(ptr))->loops();
    }

    bool nativeSoundIsFinished(uintptr_t ptr)
    {
        return reinterpret_cast<QSound *>(static_cast<uintptr_t>(ptr))->isFinished();
    }

    void nativeSoundPlayWav(const char *path)
    {
        QSound::play(QString::fromUtf8(path));
    }
}
