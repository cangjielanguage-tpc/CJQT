package cjqt.gui

foreign func nativePixmapCacheInsert(key: CString, pixmapPtr: Int64): Bool
foreign func nativePixmapCacheRemove(key: CString): Unit
foreign func nativePixmapCacheClear(): Unit
foreign func nativePixmapCacheCacheLimit(): Int32
foreign func nativePixmapCacheSetCacheLimit(limit: Int32): Unit

public class QPixmapCache {
    public static func insert(key: String, pixmap: QPixmap): Bool {
        return unsafe {
            let k = LibC.mallocCString(key)
            let r = nativePixmapCacheInsert(k, pixmap.ptr)
            LibC.free(k)
            r
        }
    }

    public static func remove(key: String): Unit {
        unsafe {
            let k = LibC.mallocCString(key)
            nativePixmapCacheRemove(k)
            LibC.free(k)
        }
    }

    public static func clear(): Unit {
        unsafe { nativePixmapCacheClear() }
    }

    public static func cacheLimit(): Int64 {
        return Int64(unsafe { nativePixmapCacheCacheLimit() })
    }

    public static func setCacheLimit(limit: Int64): Unit {
        unsafe { nativePixmapCacheSetCacheLimit(Int32(limit)) }
    }
}
