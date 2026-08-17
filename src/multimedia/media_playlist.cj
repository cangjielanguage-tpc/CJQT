package cjqt.multimedia

import cjqt.core.*

foreign func nativeMediaPlaylistCreate(parentPtr: Int64): Int64
foreign func nativeMediaPlaylistDelete(ptr: Int64): Unit
foreign func nativeMediaPlaylistAddMediaUrl(ptr: Int64, url: CString): Bool
foreign func nativeMediaPlaylistMediaCount(ptr: Int64): Int32
foreign func nativeMediaPlaylistCurrentIndex(ptr: Int64): Int32
foreign func nativeMediaPlaylistSetCurrentIndex(ptr: Int64, index: Int32): Unit
foreign func nativeMediaPlaylistNext(ptr: Int64): Unit
foreign func nativeMediaPlaylistPrevious(ptr: Int64): Unit
foreign func nativeMediaPlaylistClear(ptr: Int64): Unit
foreign func nativeMediaPlaylistSetPlaybackMode(ptr: Int64, mode: Int32): Unit
foreign func nativeMediaPlaylistPlaybackMode(ptr: Int64): Int32

public enum QMediaPlaybackMode {
    | CurrentItemOnce
    | CurrentItemInLoop
    | Sequential
    | Loop
    | Random

    public func value(): Int32 {
        return match (this) {
            case CurrentItemOnce => 0
            case CurrentItemInLoop => 1
            case Sequential => 2
            case Loop => 3
            case Random => 4
        }
    }
}

public class QMediaPlaylist <: QObject {
    public init(ptr: Int64) {
        super(ptr)
    }

    public init() {
        super(unsafe { nativeMediaPlaylistCreate(0) })
    }

    public override func delete() {
        unsafe { nativeMediaPlaylistDelete(ptr) }
    }

    public func addMedia(url: String): Bool {
        return unsafe {
            let u = LibC.mallocCString(url)
            let r = nativeMediaPlaylistAddMediaUrl(ptr, u)
            LibC.free(u)
            r
        }
    }

    public func mediaCount(): Int64 {
        return Int64(unsafe { nativeMediaPlaylistMediaCount(ptr) })
    }

    public func currentIndex(): Int64 {
        return Int64(unsafe { nativeMediaPlaylistCurrentIndex(ptr) })
    }

    public func setCurrentIndex(index: Int64) {
        unsafe { nativeMediaPlaylistSetCurrentIndex(ptr, Int32(index)) }
    }

    public func next() {
        unsafe { nativeMediaPlaylistNext(ptr) }
    }

    public func previous() {
        unsafe { nativeMediaPlaylistPrevious(ptr) }
    }

    public func clear() {
        unsafe { nativeMediaPlaylistClear(ptr) }
    }

    public func setPlaybackMode(mode: QMediaPlaybackMode) {
        unsafe { nativeMediaPlaylistSetPlaybackMode(ptr, mode.value()) }
    }

    public func playbackMode(): QMediaPlaybackMode {
        let m = unsafe { nativeMediaPlaylistPlaybackMode(ptr) }
        return match (m) {
            case 0 => QMediaPlaybackMode.CurrentItemOnce
            case 1 => QMediaPlaybackMode.CurrentItemInLoop
            case 2 => QMediaPlaybackMode.Sequential
            case 3 => QMediaPlaybackMode.Loop
            case _ => QMediaPlaybackMode.Random
        }
    }
}
