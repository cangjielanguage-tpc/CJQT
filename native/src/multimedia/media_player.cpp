/*
 * CJQT native bindings: QMediaContent, QMediaPlayer, QMediaPlaylist, QMediaMetaData
 */
#include <QMediaContent>
#include <QMediaPlayer>
#include <QMediaPlaylist>
#include <QMediaMetaData>
#include <QUrl>
#include <QDir>
#include <QDateTime>
#include <QImage>
#include "config.h"
#include "native_string.h"

// QMediaPlayer 子类：捕获 metaDataChanged 信号转发给注册的回调
class CjQtMediaPlayer : public QMediaPlayer
{
public:
    CjQtMediaPlayer(QObject *parent = nullptr) : QMediaPlayer(parent) {}

    void setMetaDataChangedCallback(nativeConnectCallbackPointer cb)
    {
        metaCb = cb;
        QObject::connect(this, QOverload<>::of(&QMediaPlayer::metaDataChanged), this,
                         [this]() {
                             if (metaCb != nullptr)
                             {
                                 metaCb(reinterpret_cast<uintptr_t>(this), nullptr);
                             }
                         });
    }

private:
    nativeConnectCallbackPointer metaCb = nullptr;
};

extern "C"
{
    // ---- QMediaContent ----

    uintptr_t nativeMediaContentCreate(const char *url)
    {
        return reinterpret_cast<uintptr_t>(new QMediaContent(QUrl(QString::fromUtf8(url))));
    }

    void nativeMediaContentDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QMediaContent *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeMediaContentIsNull(uintptr_t ptr)
    {
        return reinterpret_cast<QMediaContent *>(static_cast<uintptr_t>(ptr))->isNull();
    }

    char *nativeMediaContentCanonicalUrl(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QMediaContent *>(static_cast<uintptr_t>(ptr))->canonicalUrl().toString());
    }

    char *nativeMediaContentRequestUrl(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QMediaContent *>(static_cast<uintptr_t>(ptr))->request().url().toString());
    }

    // ---- QMediaPlayer ----

    uintptr_t nativeMediaPlayerCreate(uintptr_t parentPtr)
    {
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new CjQtMediaPlayer(parent));
    }

    void nativeMediaPlayerSetMetaDataChanged(uintptr_t ptr, nativeConnectCallbackPointer callback)
    {
        CjQtMediaPlayer *player = reinterpret_cast<CjQtMediaPlayer *>(static_cast<uintptr_t>(ptr));
        player->setMetaDataChangedCallback(callback);
    }

    void nativeMediaPlayerDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QMediaPlayer *>(static_cast<uintptr_t>(ptr));
    }

    void nativeMediaPlayerSetMedia(uintptr_t ptr, uintptr_t contentPtr)
    {
        QMediaContent *content = reinterpret_cast<QMediaContent *>(static_cast<uintptr_t>(contentPtr));
        reinterpret_cast<QMediaPlayer *>(static_cast<uintptr_t>(ptr))->setMedia(*content);
    }

    void nativeMediaPlayerPlay(uintptr_t ptr)
    {
        reinterpret_cast<QMediaPlayer *>(static_cast<uintptr_t>(ptr))->play();
    }

    void nativeMediaPlayerPause(uintptr_t ptr)
    {
        reinterpret_cast<QMediaPlayer *>(static_cast<uintptr_t>(ptr))->pause();
    }

    void nativeMediaPlayerStop(uintptr_t ptr)
    {
        reinterpret_cast<QMediaPlayer *>(static_cast<uintptr_t>(ptr))->stop();
    }

    void nativeMediaPlayerSetVolume(uintptr_t ptr, int volume)
    {
        reinterpret_cast<QMediaPlayer *>(static_cast<uintptr_t>(ptr))->setVolume(volume);
    }

    int nativeMediaPlayerVolume(uintptr_t ptr)
    {
        return reinterpret_cast<QMediaPlayer *>(static_cast<uintptr_t>(ptr))->volume();
    }

    void nativeMediaPlayerSetMuted(uintptr_t ptr, bool muted)
    {
        reinterpret_cast<QMediaPlayer *>(static_cast<uintptr_t>(ptr))->setMuted(muted);
    }

    bool nativeMediaPlayerIsMuted(uintptr_t ptr)
    {
        return reinterpret_cast<QMediaPlayer *>(static_cast<uintptr_t>(ptr))->isMuted();
    }

    int nativeMediaPlayerState(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QMediaPlayer *>(static_cast<uintptr_t>(ptr))->state());
    }

    int nativeMediaPlayerMediaStatus(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QMediaPlayer *>(static_cast<uintptr_t>(ptr))->mediaStatus());
    }

    intptr_t nativeMediaPlayerPosition(uintptr_t ptr)
    {
        return reinterpret_cast<QMediaPlayer *>(static_cast<uintptr_t>(ptr))->position();
    }

    void nativeMediaPlayerSetPosition(uintptr_t ptr, intptr_t position)
    {
        reinterpret_cast<QMediaPlayer *>(static_cast<uintptr_t>(ptr))->setPosition(position);
    }

    intptr_t nativeMediaPlayerDuration(uintptr_t ptr)
    {
        return reinterpret_cast<QMediaPlayer *>(static_cast<uintptr_t>(ptr))->duration();
    }

    bool nativeMediaPlayerIsAudioAvailable(uintptr_t ptr)
    {
        return reinterpret_cast<QMediaPlayer *>(static_cast<uintptr_t>(ptr))->isAudioAvailable();
    }

    bool nativeMediaPlayerIsVideoAvailable(uintptr_t ptr)
    {
        return reinterpret_cast<QMediaPlayer *>(static_cast<uintptr_t>(ptr))->isVideoAvailable();
    }

    void nativeMediaPlayerSetPlaylist(uintptr_t ptr, uintptr_t playlistPtr)
    {
        QMediaPlaylist *playlist = reinterpret_cast<QMediaPlaylist *>(static_cast<uintptr_t>(playlistPtr));
        reinterpret_cast<QMediaPlayer *>(static_cast<uintptr_t>(ptr))->setPlaylist(playlist);
    }

    // 读取播放器元数据封面（GStreamer 用 CoverArtImage，部分后端用 ThumbnailImage），
    // 保存为临时 PNG 并返回路径；无封面返回空串
    const char *nativeMediaPlayerThumbnail(uintptr_t ptr)
    {
        QMediaPlayer *player = reinterpret_cast<QMediaPlayer *>(static_cast<uintptr_t>(ptr));
        QImage image;
        QVariant cover = player->metaData(QMediaMetaData::CoverArtImage);
        if (cover.isValid())
        {
            image = cover.value<QImage>();
        }
        if (image.isNull())
        {
            QVariant thumb = player->metaData(QMediaMetaData::ThumbnailImage);
            if (thumb.isValid())
            {
                image = thumb.value<QImage>();
            }
        }
        if (!image.isNull())
        {
            QString path = QDir::tempPath() + QString("/cjqt_cover_%1.png").arg(QDateTime::currentMSecsSinceEpoch());
            if (image.save(path))
            {
                return cjqt_to_cstring(path);
            }
        }
        return cjqt_to_cstring(QString());
    }

    // ---- QMediaPlaylist ----

    uintptr_t nativeMediaPlaylistCreate(uintptr_t parentPtr)
    {
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QMediaPlaylist(parent));
    }

    void nativeMediaPlaylistDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QMediaPlaylist *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeMediaPlaylistAddMediaUrl(uintptr_t ptr, const char *url)
    {
        return reinterpret_cast<QMediaPlaylist *>(static_cast<uintptr_t>(ptr))->addMedia(
            QMediaContent(QUrl(QString::fromUtf8(url))));
    }

    int nativeMediaPlaylistMediaCount(uintptr_t ptr)
    {
        return reinterpret_cast<QMediaPlaylist *>(static_cast<uintptr_t>(ptr))->mediaCount();
    }

    int nativeMediaPlaylistCurrentIndex(uintptr_t ptr)
    {
        return reinterpret_cast<QMediaPlaylist *>(static_cast<uintptr_t>(ptr))->currentIndex();
    }

    void nativeMediaPlaylistSetCurrentIndex(uintptr_t ptr, int index)
    {
        reinterpret_cast<QMediaPlaylist *>(static_cast<uintptr_t>(ptr))->setCurrentIndex(index);
    }

    void nativeMediaPlaylistNext(uintptr_t ptr)
    {
        reinterpret_cast<QMediaPlaylist *>(static_cast<uintptr_t>(ptr))->next();
    }

    void nativeMediaPlaylistPrevious(uintptr_t ptr)
    {
        reinterpret_cast<QMediaPlaylist *>(static_cast<uintptr_t>(ptr))->previous();
    }

    void nativeMediaPlaylistClear(uintptr_t ptr)
    {
        reinterpret_cast<QMediaPlaylist *>(static_cast<uintptr_t>(ptr))->clear();
    }

    void nativeMediaPlaylistSetPlaybackMode(uintptr_t ptr, int mode)
    {
        reinterpret_cast<QMediaPlaylist *>(static_cast<uintptr_t>(ptr))->setPlaybackMode(
            static_cast<QMediaPlaylist::PlaybackMode>(mode));
    }

    int nativeMediaPlaylistPlaybackMode(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QMediaPlaylist *>(static_cast<uintptr_t>(ptr))->playbackMode());
    }
}
