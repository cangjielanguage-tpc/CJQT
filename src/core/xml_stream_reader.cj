package cjqt.core

foreign func nativeXmlReaderCreate(data: CString): Int64
foreign func nativeXmlReaderDelete(ptr: Int64): Unit
foreign func nativeXmlReaderReadNext(ptr: Int64): Int32
foreign func nativeXmlReaderIsStartElement(ptr: Int64): Bool
foreign func nativeXmlReaderIsEndElement(ptr: Int64): Bool
foreign func nativeXmlReaderName(ptr: Int64): CString
foreign func nativeXmlReaderText(ptr: Int64): CString
foreign func nativeXmlReaderAtEnd(ptr: Int64): Bool

public class QXmlStreamReader {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(data: String) {
        this.ptr = unsafe {
            let d = LibC.mallocCString(data)
            let r = nativeXmlReaderCreate(d)
            LibC.free(d)
            r
        }
    }

    public func delete(): Unit {
        unsafe { nativeXmlReaderDelete(ptr) }
    }

    public func readNext(): Int64 {
        return Int64(unsafe { nativeXmlReaderReadNext(ptr) })
    }

    public func isStartElement(): Bool {
        return unsafe { nativeXmlReaderIsStartElement(ptr) }
    }

    public func isEndElement(): Bool {
        return unsafe { nativeXmlReaderIsEndElement(ptr) }
    }

    public func name(): String {
        return unsafe { nativeXmlReaderName(ptr).toString() }
    }

    public func text(): String {
        return unsafe { nativeXmlReaderText(ptr).toString() }
    }

    public func atEnd(): Bool {
        return unsafe { nativeXmlReaderAtEnd(ptr) }
    }
}
