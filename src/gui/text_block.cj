package cjqt.gui

foreign func nativeTextDocumentFirstBlock(docPtr: Int64): Int64
foreign func nativeTextDocumentFindBlockByNumber(docPtr: Int64, blockNumber: Int32): Int64
foreign func nativeTextBlockDelete(ptr: Int64): Unit
foreign func nativeTextBlockText(ptr: Int64): CString
foreign func nativeTextBlockBlockNumber(ptr: Int64): Int32
foreign func nativeTextBlockLength(ptr: Int64): Int32
foreign func nativeTextBlockIsValid(ptr: Int64): Bool

public class QTextBlock {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public func delete(): Unit {
        unsafe { nativeTextBlockDelete(ptr) }
    }

    public func text(): String {
        return unsafe { nativeTextBlockText(ptr).toString() }
    }

    public func blockNumber(): Int64 {
        return Int64(unsafe { nativeTextBlockBlockNumber(ptr) })
    }

    public func length(): Int64 {
        return Int64(unsafe { nativeTextBlockLength(ptr) })
    }

    public func isValid(): Bool {
        return unsafe { nativeTextBlockIsValid(ptr) }
    }

    public static func firstBlock(document: QTextDocument): QTextBlock {
        return QTextBlock(unsafe { nativeTextDocumentFirstBlock(document.ptr) })
    }

    public static func findBlockByNumber(document: QTextDocument, blockNumber: Int64): QTextBlock {
        return QTextBlock(unsafe { nativeTextDocumentFindBlockByNumber(document.ptr, Int32(blockNumber)) })
    }
}
