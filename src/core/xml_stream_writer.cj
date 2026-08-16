package cjqt.core

foreign func nativeXmlWriterCreate(): Int64
foreign func nativeXmlWriterDelete(ptr: Int64): Unit
foreign func nativeXmlWriterSetAutoFormatting(ptr: Int64, b: Bool): Unit
foreign func nativeXmlWriterWriteStartDocument(ptr: Int64): Unit
foreign func nativeXmlWriterWriteEndDocument(ptr: Int64): Unit
foreign func nativeXmlWriterWriteStartElement(ptr: Int64, name: CString): Unit
foreign func nativeXmlWriterWriteEndElement(ptr: Int64): Unit
foreign func nativeXmlWriterWriteCharacters(ptr: Int64, text: CString): Unit
foreign func nativeXmlWriterWriteTextElement(ptr: Int64, name: CString, text: CString): Unit
foreign func nativeXmlWriterToString(ptr: Int64): CString

public class QXmlStreamWriter {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeXmlWriterCreate() }
    }

    public func delete(): Unit {
        unsafe { nativeXmlWriterDelete(ptr) }
    }

    public func setAutoFormatting(b: Bool) {
        unsafe { nativeXmlWriterSetAutoFormatting(ptr, b) }
    }

    public func writeStartDocument() {
        unsafe { nativeXmlWriterWriteStartDocument(ptr) }
    }

    public func writeEndDocument() {
        unsafe { nativeXmlWriterWriteEndDocument(ptr) }
    }

    public func writeStartElement(name: String) {
        unsafe {
            let n = LibC.mallocCString(name)
            nativeXmlWriterWriteStartElement(ptr, n)
            LibC.free(n)
        }
    }

    public func writeEndElement() {
        unsafe { nativeXmlWriterWriteEndElement(ptr) }
    }

    public func writeCharacters(text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeXmlWriterWriteCharacters(ptr, t)
            LibC.free(t)
        }
    }

    public func writeTextElement(name: String, text: String) {
        unsafe {
            let n = LibC.mallocCString(name)
            let t = LibC.mallocCString(text)
            nativeXmlWriterWriteTextElement(ptr, n, t)
            LibC.free(n)
            LibC.free(t)
        }
    }

    public func toString(): String {
        return unsafe { nativeXmlWriterToString(ptr).toString() }
    }
}
