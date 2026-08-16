package cjqt.core

foreign func nativeLocaleCreate(language: CString): Int64
foreign func nativeLocaleSystem(): Int64
foreign func nativeLocaleDelete(ptr: Int64): Unit
foreign func nativeLocaleName(ptr: Int64): CString
foreign func nativeLocaleLanguage(ptr: Int64): CString
foreign func nativeLocaleCountry(ptr: Int64): CString
foreign func nativeLocaleToString(ptr: Int64, value: Float64, precision: Int32): CString

public class QLocale {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(language: String) {
        this.ptr = unsafe {
            let l = LibC.mallocCString(language)
            let r = nativeLocaleCreate(l)
            LibC.free(l)
            r
        }
    }

    public static func system(): QLocale {
        return QLocale(unsafe { nativeLocaleSystem() })
    }

    public func delete(): Unit {
        unsafe {
            nativeLocaleDelete(ptr)
        }
    }

    public func name(): String {
        return unsafe {
            nativeLocaleName(ptr).toString()
        }
    }

    public func language(): String {
        return unsafe {
            nativeLocaleLanguage(ptr).toString()
        }
    }

    public func country(): String {
        return unsafe {
            nativeLocaleCountry(ptr).toString()
        }
    }

    public func toString(value: Float64, precision!: Int64 = 6): String {
        return unsafe {
            nativeLocaleToString(ptr, value, Int32(precision)).toString()
        }
    }
}
