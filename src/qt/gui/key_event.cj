/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.qt.gui

foreign func nativeKeyEventGetKey(ptr: Int64): Int32
foreign func nativeKeyEventGetCount(ptr: Int64): Int32
foreign func nativeKeyEventGetText(ptr: Int64): CString
foreign func nativeKeyEventIsAutoRepeat(ptr: Int64): Int32

/**
 * The class is QKeyEvent
 * @author wathinst
 */
public class QKeyEvent {
    /* let member ptr type is Int64 */
    public let ptr: Int64

    /** let member KEY_A */
    public static let KEY_A = 65
    /** let member KEY_B */
    public static let KEY_B = 66
    /** let member KEY_C */
    public static let KEY_C = 67
    /** let member KEY_D */
    public static let KEY_D = 68
    /** let member KEY_E */
    public static let KEY_E = 69
    /** let member KEY_F */
    public static let KEY_F = 70
    /** let member KEY_G */
    public static let KEY_G = 71
    /** let member KEY_H */
    public static let KEY_H = 72
    /** let member KEY_I */
    public static let KEY_I = 73
    /** let member KEY_J */
    public static let KEY_J = 74
    /** let member KEY_K */
    public static let KEY_K = 75
    /** let member KEY_L */
    public static let KEY_L = 76
    /** let member KEY_M */
    public static let KEY_M = 77
    /** let member KEY_N */
    public static let KEY_N = 78
    /** let member KEY_O */
    public static let KEY_O = 79
    /** let member KEY_P */
    public static let KEY_P = 80
    /** let member KEY_Q */
    public static let KEY_Q = 81
    /** let member KEY_R */
    public static let KEY_R = 82
    /** let member KEY_S */
    public static let KEY_S = 83
    /** let member KEY_T */
    public static let KEY_T = 84
    /** let member KEY_U */
    public static let KEY_U = 85
    /** let member KEY_V */
    public static let KEY_V = 86
    /** let member KEY_W */
    public static let KEY_W = 87
    /** let member KEY_X */
    public static let KEY_X = 88
    /** let member KEY_Y */
    public static let KEY_Y = 89
    /** let member KEY_Z */
    public static let KEY_Z = 90
    /** let member KEY_1 */
    public static let KEY_1 = 49
    /** let member KEY_2 */
    public static let KEY_2 = 50
    /** let member KEY_3 */
    public static let KEY_3 = 51
    /** let member KEY_4 */
    public static let KEY_4 = 52
    /** let member KEY_5 */
    public static let KEY_5 = 53
    /** let member KEY_6 */
    public static let KEY_6 = 54
    /** let member KEY_7 */
    public static let KEY_7 = 55
    /** let member KEY_8 */
    public static let KEY_8 = 56
    /** let member KEY_9 */
    public static let KEY_9 = 57
    /** let member KEY_0 */
    public static let KEY_0 = 48
    /** let member KEY_UP */
    public static let KEY_UP = 16777235
    /** let member KEY_DOWN */
    public static let KEY_DOWN = 16777237
    /** let member KEY_LEFT */
    public static let KEY_LEFT = 16777234
    /** let member KEY_RIGHT */
    public static let KEY_RIGHT = 16777236
    /** let member KEY_SPACE */
    public static let KEY_SPACE = 32

    /**
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        this.ptr = ptr
    }

    /**
     * The Function is key
     *
     * @return Type of Int64
     */
    public func key(): Int64 {
        return unsafe {
            Int64(nativeKeyEventGetKey(ptr))
        }
    }

    /**
     * The Function is count
     *
     * @return Type of Int64
     */
    public func count(): Int64 {
        return unsafe {
            Int64(nativeKeyEventGetCount(ptr))
        }
    }

    /**
     * The Function is text
     *
     * @return Type of String
     */
    public func text(): String {
        return unsafe {
            nativeKeyEventGetText(ptr).toString()
        }
    }

    /**
     * The Function is isAutoRepeat
     *
     * @return Type of Bool
     */
    public func isAutoRepeat(): Bool {
        return unsafe {
            nativeKeyEventIsAutoRepeat(ptr) == 1
        }
    }
}
