package cjqt.core

foreign func nativeCoreAppApplicationName(): CString
foreign func nativeCoreAppSetApplicationName(name: CString): Unit
foreign func nativeCoreAppApplicationDirPath(): CString
foreign func nativeCoreAppApplicationFilePath(): CString
foreign func nativeCoreAppApplicationVersion(): CString
foreign func nativeCoreAppSetApplicationVersion(version: CString): Unit
foreign func nativeCoreAppProcessEvents(): Unit

public class QCoreApplication {
    public static func applicationName(): String {
        return unsafe { nativeCoreAppApplicationName().toString() }
    }

    public static func setApplicationName(name: String): Unit {
        unsafe {
            let n = LibC.mallocCString(name)
            nativeCoreAppSetApplicationName(n)
            LibC.free(n)
        }
    }

    public static func applicationDirPath(): String {
        return unsafe { nativeCoreAppApplicationDirPath().toString() }
    }

    public static func applicationFilePath(): String {
        return unsafe { nativeCoreAppApplicationFilePath().toString() }
    }

    public static func applicationVersion(): String {
        return unsafe { nativeCoreAppApplicationVersion().toString() }
    }

    public static func setApplicationVersion(version: String): Unit {
        unsafe {
            let v = LibC.mallocCString(version)
            nativeCoreAppSetApplicationVersion(v)
            LibC.free(v)
        }
    }

    public static func processEvents(): Unit {
        unsafe { nativeCoreAppProcessEvents() }
    }
}
