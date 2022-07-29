package qt.gui

// from std import ffi.c.CString

foreign func nativeKeyEventGetKey(ptr: Int64): Int32
foreign func nativeKeyEventGetCount(ptr: Int64): Int32
foreign func nativeKeyEventGetText(ptr: Int64): CString
foreign func nativeKeyEventIsAutoRepeat(ptr: Int64): Int32

public class QKeyEvent {
    let ptr: Int64

    public static let KEY_A = 65
    public static let KEY_B = 66
    public static let KEY_C = 67
    public static let KEY_D = 68
    public static let KEY_E = 69
    public static let KEY_F = 70
    public static let KEY_G = 71
    public static let KEY_H = 72
    public static let KEY_I = 73
    public static let KEY_J = 74
    public static let KEY_K = 75
    public static let KEY_L = 76
    public static let KEY_M = 77
    public static let KEY_N = 78
    public static let KEY_O = 79
    public static let KEY_P = 80
    public static let KEY_Q = 81
    public static let KEY_R = 82
    public static let KEY_S = 83
    public static let KEY_T = 84
    public static let KEY_U = 85
    public static let KEY_V = 86
    public static let KEY_W = 87
    public static let KEY_X = 88
    public static let KEY_Y = 89
    public static let KEY_Z = 90
    public static let KEY_1 = 49
    public static let KEY_2 = 50
    public static let KEY_3 = 51
    public static let KEY_4 = 52
    public static let KEY_5 = 53
    public static let KEY_6 = 54
    public static let KEY_7 = 55
    public static let KEY_8 = 56
    public static let KEY_9 = 57
    public static let KEY_0 = 48
    public static let KEY_UP = 16777235
    public static let KEY_DOWN = 16777237
    public static let KEY_LEFT = 16777234
    public static let KEY_RIGHT = 16777236
    public static let KEY_SPACE = 32

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public func key(): Int64 {
        return unsafe {
            Int64(nativeKeyEventGetKey(ptr))
        }
    }

    public func count(): Int64 {
        return unsafe {
            Int64(nativeKeyEventGetCount(ptr))
        }
    }

    public func text(): String {
        return unsafe {
            nativeKeyEventGetText(ptr).toString()
        }
    }

    public func isAutoRepeat(): Bool {
        return unsafe {
            nativeKeyEventIsAutoRepeat(ptr) == 1
        }
    }
}
