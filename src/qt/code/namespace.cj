/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.code

/**
 * The enum is Alignment
 * @author helin
 */
public enum Alignment {
    AlignLeft |
    AlignRight |
    AlignHCenter |
    AlignJustify |
    AlignAbsolute |
    AlignTop |
    AlignBottom |
    AlignVCenter |
    AlignBaseline |
    AlignCenter

    /**
     * The Function is value
     *
     * @return Type  is  Int16
     */
    public func value(): Int16 {
        match (this) {
            case AlignLeft => 0x0001
            case AlignRight => 0x0002
            case AlignHCenter => 0x0004
            case AlignJustify => 0x0008
            case AlignAbsolute => 0x0010
            case AlignTop => 0x0020
            case AlignBottom => 0x0040
            case AlignVCenter => 0x0080
            case AlignBaseline => 0x0100
            case AlignCenter => 0x0004 | 0x0080
        }
    }

    /**
     * The Static Function is conver
     *
     * @return Type  is  Int16
     */
    static public func conver(num: Int16): Alignment {
        match (num) {
            case 0x0001 => AlignLeft
            case 0x0002 => AlignRight
            case 0x0004 => AlignHCenter
            case 0x0008 => AlignJustify
            case 0x0010 => AlignAbsolute
            case 0x0020 => AlignTop
            case 0x0040 => AlignBottom
            case 0x0080 => AlignVCenter
            case 0x0100 => AlignBaseline
            case _ => AlignCenter
        }
    }
}
