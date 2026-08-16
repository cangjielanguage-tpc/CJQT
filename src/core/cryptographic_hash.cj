package cjqt.core

foreign func nativeHashCreate(algorithm: Int32): Int64
foreign func nativeHashDelete(ptr: Int64): Unit
foreign func nativeHashAddData(ptr: Int64, data: CString): Unit
foreign func nativeHashResult(ptr: Int64): CString

public enum QHashAlgorithm {
    | Md4
    | Md5
    | Sha1
    | Sha224
    | Sha256
    | Sha384
    | Sha512

    public func value(): Int32 {
        return match (this) {
            case Md4 => 0
            case Md5 => 1
            case Sha1 => 2
            case Sha224 => 3
            case Sha256 => 4
            case Sha384 => 5
            case Sha512 => 6
        }
    }
}

public class QCryptographicHash {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(algorithm: QHashAlgorithm) {
        this.ptr = unsafe {
            nativeHashCreate(algorithm.value())
        }
    }

    public func delete(): Unit {
        unsafe { nativeHashDelete(ptr) }
    }

    public func addData(data: String): Unit {
        unsafe {
            let d = LibC.mallocCString(data)
            nativeHashAddData(ptr, d)
            LibC.free(d)
        }
    }

    public func result(): String {
        return unsafe {
            nativeHashResult(ptr).toString()
        }
    }
}
