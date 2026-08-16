package cjqt.core

foreign func nativeCommandLineParserCreate(): Int64
foreign func nativeCommandLineParserDelete(ptr: Int64): Unit
foreign func nativeCommandLineParserSetApplicationDescription(ptr: Int64, description: CString): Unit
foreign func nativeCommandLineParserAddOption(ptr: Int64, name: CString): Unit
foreign func nativeCommandLineParserIsSet(ptr: Int64, name: CString): Bool
foreign func nativeCommandLineParserValue(ptr: Int64, name: CString): CString
foreign func nativeCommandLineParserPositionalArguments(ptr: Int64): Int64
foreign func nativeCommandLineParserProcess(ptr: Int64, argsPtr: Int64): Unit

public class QCommandLineParser {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeCommandLineParserCreate() }
    }

    public func delete(): Unit {
        unsafe { nativeCommandLineParserDelete(ptr) }
    }

    public func setApplicationDescription(description: String) {
        unsafe {
            let d = LibC.mallocCString(description)
            nativeCommandLineParserSetApplicationDescription(ptr, d)
            LibC.free(d)
        }
    }

    public func addOption(name: String) {
        unsafe {
            let n = LibC.mallocCString(name)
            nativeCommandLineParserAddOption(ptr, n)
            LibC.free(n)
        }
    }

    public func isSet(name: String): Bool {
        return unsafe {
            let n = LibC.mallocCString(name)
            let r = nativeCommandLineParserIsSet(ptr, n)
            LibC.free(n)
            r
        }
    }

    public func value(name: String): String {
        return unsafe {
            let n = LibC.mallocCString(name)
            let r = nativeCommandLineParserValue(ptr, n).toString()
            LibC.free(n)
            r
        }
    }

    public func positionalArguments(): QStringList {
        return QStringList(ptr: unsafe { nativeCommandLineParserPositionalArguments(ptr) })
    }

    public func process(args: QStringList) {
        unsafe { nativeCommandLineParserProcess(ptr, args.ptr) }
    }
}
