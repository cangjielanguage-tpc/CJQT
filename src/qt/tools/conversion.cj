package qt.tools

foreign func nativeCPointerToInt(pointer: CPointer<Unit>): Int32
foreign func nativeCPointerToString(pointer: CPointer<Unit>): CString
foreign func nativeCPointerToBool(pointer: CPointer<Unit>): Bool
foreign func nativeCPointerToCjDataIntInt(pointer: CPointer<Unit>): CjDataIntInt

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
}

@c
public struct CjDataIntInt {
    public var p1: Int32 = 0
    public var p2: Int32 = 0
}
