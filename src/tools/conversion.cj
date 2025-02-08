package cjqt.tools

foreign func nativeCPointerToInt(pointer: CPointer<Unit>): Int64
foreign func nativeCPointerToString(pointer: CPointer<Unit>): CString
foreign func nativeCPointerToBool(pointer: CPointer<Unit>): Bool
foreign func nativeCPointerToCjDataIntInt(pointer: CPointer<Unit>): CjDataIntInt
foreign func nativeCPointerToCjDataLongInt(pointer: CPointer<Unit>): CjDataLongInt
foreign func nativeCPointerToCjDataLongLong(pointer: CPointer<Unit>): CjDataLongLong
foreign func nativeCPointerToCjDataLongLongLong(pointer: CPointer<Unit>): CjDataLongLongLong

foreign func nativeIntToCPointer(data: Int64): CPointer<Unit>
foreign func nativeStringToCPointer(data: CString): CPointer<Unit>
foreign func nativeBoolToCPointer(data: Bool): CPointer<Unit>

public class QConversion {
    public static func cPointerToInt(pointer: CPointer<Unit>): Int64 {
        let result = unsafe {
            nativeCPointerToInt(pointer)
        }
        return Int64(result)
    }

    public static func cPointerToString(pointer: CPointer<Unit>): String {
        let result = unsafe {
            nativeCPointerToString(pointer)
        }
        return result.toString()
    }

    public static func cPointerToBool(pointer: CPointer<Unit>): Bool {
        let result = unsafe {
            nativeCPointerToBool(pointer)
        }
        return result
    }

    public static func cPointerToCjDataIntInt(pointer: CPointer<Unit>): CjDataIntInt {
        let result = unsafe {
            nativeCPointerToCjDataIntInt(pointer)
        }
        return result
    }

    public static func cPointerToCjDataLongInt(pointer: CPointer<Unit>): CjDataLongInt {
        let result = unsafe {
            nativeCPointerToCjDataLongInt(pointer)
        }
        return result
    }

    public static func cPointerToCjDataLongLong(pointer: CPointer<Unit>): CjDataLongLong {
        let result = unsafe {
            nativeCPointerToCjDataLongLong(pointer)
        }
        return result
    }

    public static func cPointerToCjDataLongLongLong(pointer: CPointer<Unit>): CjDataLongLongLong {
        let result = unsafe {
            nativeCPointerToCjDataLongLongLong(pointer)
        }
        return result
    }

    public static func intToCPointer(data: Int64): CPointer<Unit> {
        let result = unsafe {
            // println("data:${data}")
            // println(Int32(data))
            nativeIntToCPointer(Int64(data))
        }
        return result
    }

    public static func stringToCPointer(data: String): CPointer<Unit> {
         unsafe {
            let d =LibC.mallocCString(data) 
            let result =nativeStringToCPointer(d)
            LibC.free(d)
            return result
        }
        
    }

    public static func boolToCPointer(data: Bool): CPointer<Unit> {
        let result = unsafe {
            nativeBoolToCPointer(data)
        }
        return result
    }
}

@C
public struct CjDataIntInt {
    public var p1: Int32 = 0
    public var p2: Int32 = 0
}

@C
public struct CjDataLongInt {
    public var p1: Int64 = 0
    public var p2: Int32 = 0
}

@C
public struct CjDataLongLong {
    public var p1: Int64 = 0
    public var p2: Int64 = 0
}

@C
public struct CjDataLongLongLong {
    public var p1: Int64 = 0
    public var p2: Int64 = 0
    public var p3: Int64 = 0
}
