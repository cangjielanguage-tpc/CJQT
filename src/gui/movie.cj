package cjqt.gui

foreign func nativeMovieCreate(): Int64
foreign func nativeMovieCreateFromFile(path: CString): Int64
foreign func nativeMovieDelete(ptr: Int64): Unit
foreign func nativeMovieStart(ptr: Int64): Unit
foreign func nativeMovieStop(ptr: Int64): Unit
foreign func nativeMovieSetPaused(ptr: Int64, paused: Bool): Unit
foreign func nativeMovieIsRunning(ptr: Int64): Bool
foreign func nativeMovieFrameCount(ptr: Int64): Int32
foreign func nativeMovieCurrentFrameNumber(ptr: Int64): Int32
foreign func nativeMovieFileName(ptr: Int64): CString
foreign func nativeMovieSetFileName(ptr: Int64, path: CString): Unit

public class QMovie {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeMovieCreate() }
    }

    public init(path: String) {
        this.ptr = unsafe {
            let p = LibC.mallocCString(path)
            let r = nativeMovieCreateFromFile(p)
            LibC.free(p)
            r
        }
    }

    public func delete(): Unit {
        unsafe { nativeMovieDelete(ptr) }
    }

    public func start(): Unit {
        unsafe { nativeMovieStart(ptr) }
    }

    public func stop(): Unit {
        unsafe { nativeMovieStop(ptr) }
    }

    public func setPaused(paused: Bool): Unit {
        unsafe { nativeMovieSetPaused(ptr, paused) }
    }

    public func isRunning(): Bool {
        return unsafe { nativeMovieIsRunning(ptr) }
    }

    public func frameCount(): Int64 {
        return Int64(unsafe { nativeMovieFrameCount(ptr) })
    }

    public func currentFrameNumber(): Int64 {
        return Int64(unsafe { nativeMovieCurrentFrameNumber(ptr) })
    }

    public func fileName(): String {
        return unsafe { nativeMovieFileName(ptr).toString() }
    }

    public func setFileName(path: String): Unit {
        unsafe {
            let p = LibC.mallocCString(path)
            nativeMovieSetFileName(ptr, p)
            LibC.free(p)
        }
    }
}
