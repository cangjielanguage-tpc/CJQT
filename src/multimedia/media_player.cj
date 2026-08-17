package cjqt.multimedia

import cjqt.core.*

foreign func nativeMediaPlayerCreate(parentPtr: Int64): Int64
foreign func nativeMediaPlayerDelete(ptr: Int64): Unit
foreign func nativeMediaPlayerSetMedia(ptr: Int64, contentPtr: Int64): Unit
foreign func nativeMediaPlayerPlay(ptr: Int64): Unit
foreign func nativeMediaPlayerPause(ptr: Int64): Unit
foreign func nativeMediaPlayerStop(ptr: Int64): Unit
foreign func nativeMediaPlayerSetVolume(ptr: Int64, volume: Int32): Unit
foreign func nativeMediaPlayerVolume(ptr: Int64): Int32
foreign func nativeMediaPlayerSetMuted(ptr: Int64, muted: Bool): Unit
foreign func nativeMediaPlayerIsMuted(ptr: Int64): Bool
foreign func nativeMediaPlayerState(ptr: Int64): Int32
foreign func nativeMediaPlayerMediaStatus(ptr: Int64): Int32
foreign func nativeMediaPlayerPosition(ptr: Int64): Int64
foreign func nativeMediaPlayerSetPosition(ptr: Int64, position: Int64): Unit
foreign func nativeMediaPlayerDuration(ptr: Int64): Int64
foreign func nativeMediaPlayerIsAudioAvailable(ptr: Int64): Bool
foreign func nativeMediaPlayerIsVideoAvailable(ptr: Int64): Bool
foreign func nativeMediaPlayerSetPlaylist(ptr: Int64, playlistPtr: Int64): Unit

public enum QMediaPlayerState {
    | StoppedState
    | PlayingState
    | PausedState

    public func value(): Int32 {
        return match (this) {
            case StoppedState => 0
            case PlayingState => 1
            case PausedState => 2
        }
    }
}

public enum QMediaPlayerStatus {
    | UnknownMediaStatus
    | NoMedia
    | LoadingMedia
    | LoadedMedia
    | StalledMedia
    | BufferingMedia
    | BufferedMedia
    | EndOfMedia
    | InvalidMedia

    public func value(): Int32 {
        return match (this) {
            case UnknownMediaStatus => 0
            case NoMedia => 1
            case LoadingMedia => 2
            case LoadedMedia => 3
            case StalledMedia => 4
            case BufferingMedia => 5
            case BufferedMedia => 6
            case EndOfMedia => 7
            case InvalidMedia => 8
        }
    }
}

public class QMediaPlayer <: QObject {
    public init(ptr: Int64) {
        super(ptr)
    }

    public init() {
        super(unsafe { nativeMediaPlayerCreate(0) })
    }

    public override func delete() {
        unsafe { nativeMediaPlayerDelete(ptr) }
    }

    public func setMedia(content: QMediaContent) {
        unsafe { nativeMediaPlayerSetMedia(ptr, content.ptr) }
    }

    public func play() {
        unsafe { nativeMediaPlayerPlay(ptr) }
    }

    public func pause() {
        unsafe { nativeMediaPlayerPause(ptr) }
    }

    public func stop() {
        unsafe { nativeMediaPlayerStop(ptr) }
    }

    public func setVolume(volume: Int64) {
        unsafe { nativeMediaPlayerSetVolume(ptr, Int32(volume)) }
    }

    public func volume(): Int64 {
        return Int64(unsafe { nativeMediaPlayerVolume(ptr) })
    }

    public func setMuted(muted: Bool) {
        unsafe { nativeMediaPlayerSetMuted(ptr, muted) }
    }

    public func isMuted(): Bool {
        return unsafe { nativeMediaPlayerIsMuted(ptr) }
    }

    public func state(): QMediaPlayerState {
        let s = unsafe { nativeMediaPlayerState(ptr) }
        return match (s) {
            case 0 => QMediaPlayerState.StoppedState
            case 1 => QMediaPlayerState.PlayingState
            case _ => QMediaPlayerState.PausedState
        }
    }

    public func mediaStatus(): QMediaPlayerStatus {
        let s = unsafe { nativeMediaPlayerMediaStatus(ptr) }
        return match (s) {
            case 0 => QMediaPlayerStatus.UnknownMediaStatus
            case 1 => QMediaPlayerStatus.NoMedia
            case 2 => QMediaPlayerStatus.LoadingMedia
            case 3 => QMediaPlayerStatus.LoadedMedia
            case 4 => QMediaPlayerStatus.StalledMedia
            case 5 => QMediaPlayerStatus.BufferingMedia
            case 6 => QMediaPlayerStatus.BufferedMedia
            case 7 => QMediaPlayerStatus.EndOfMedia
            case _ => QMediaPlayerStatus.InvalidMedia
        }
    }

    public func position(): Int64 {
        return unsafe { nativeMediaPlayerPosition(ptr) }
    }

    public func setPosition(position: Int64) {
        unsafe { nativeMediaPlayerSetPosition(ptr, position) }
    }

    public func duration(): Int64 {
        return unsafe { nativeMediaPlayerDuration(ptr) }
    }

    public func isAudioAvailable(): Bool {
        return unsafe { nativeMediaPlayerIsAudioAvailable(ptr) }
    }

    public func isVideoAvailable(): Bool {
        return unsafe { nativeMediaPlayerIsVideoAvailable(ptr) }
    }

    public func setPlaylist(playlist: QMediaPlaylist) {
        unsafe { nativeMediaPlayerSetPlaylist(ptr, playlist.ptr) }
    }
}
