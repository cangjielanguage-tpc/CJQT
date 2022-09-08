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
    | AlignLeft
    | AlignRight
    | AlignHCenter
    | AlignJustify
    | AlignAbsolute
    | AlignTop
    | AlignBottom
    | AlignVCenter
    | AlignBaseline
    | AlignCenter

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
    public static func conver(num: Int16): Alignment {
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

public enum WindowType {
    | Widget
    | Window
    | Dialog
    | Sheet
    | Drawer
    | Popup
    | Tool
    | ToolTip
    | SplashScreen
    | Desktop
    | SubWindow
    | ForeignWindow
    | CoverWindow
    | WindowType_Mask
    | MSWindowsFixedSizeDialogHint
    | MSWindowsOwnDC
    | BypassWindowManagerHint
    | X11BypassWindowManagerHint
    | FramelessWindowHint
    | WindowTitleHint
    | WindowSystemMenuHint
    | WindowMinimizeButtonHint
    | WindowMaximizeButtonHint
    | WindowMinMaxButtonsHint
    | WindowContextHelpButtonHint
    | WindowShadeButtonHint
    | WindowStaysOnTopHint
    | WindowTransparentForInput
    | WindowOverridesSystemGestures
    | WindowDoesNotAcceptFocus
    | MaximizeUsingFullscreenGeometryHint
    | CustomizeWindowHint
    | WindowStaysOnBottomHint
    | WindowCloseButtonHint
    | MacWindowToolBarButtonHint
    | BypassGraphicsProxyWidget
    | NoDropShadowWindowHint
    | WindowFullscreenButtonHint

    public func value(): UInt32 {
        match (this) {
            case Widget => 0x00000000
            case Window => 0x00000001
            case Dialog => 0x00000002 | Window.value()
            case Sheet => 0x00000004 | Window.value()
            case Drawer => Sheet.value() | Dialog.value()
            case Popup => 0x00000008 | Window.value()
            case Tool => Popup.value() | Dialog.value()
            case ToolTip => Popup.value() | Sheet.value()
            case SplashScreen => ToolTip.value() | Dialog.value()
            case Desktop => 0x00000010 | Window.value()
            case SubWindow => 0x00000012
            case ForeignWindow => 0x00000020 | Window.value()
            case CoverWindow => 0x00000040 | Window.value()
            case WindowType_Mask => 0x000000ff
            case MSWindowsFixedSizeDialogHint => 0x00000100
            case MSWindowsOwnDC => 0x00000200
            case BypassWindowManagerHint => 0x00000400
            case X11BypassWindowManagerHint => BypassWindowManagerHint.value()
            case FramelessWindowHint => 0x00000800
            case WindowTitleHint => 0x00001000
            case WindowSystemMenuHint => 0x00002000
            case WindowMinimizeButtonHint => 0x00004000
            case WindowMaximizeButtonHint => 0x00008000
            case WindowMinMaxButtonsHint => WindowMinimizeButtonHint.value() | WindowMaximizeButtonHint.value()
            case WindowContextHelpButtonHint => 0x00010000
            case WindowShadeButtonHint => 0x00020000
            case WindowStaysOnTopHint => 0x00040000
            case WindowTransparentForInput => 0x00080000
            case WindowOverridesSystemGestures => 0x00100000
            case WindowDoesNotAcceptFocus => 0x00200000
            case MaximizeUsingFullscreenGeometryHint => 0x00400000
            case CustomizeWindowHint => 0x02000000
            case WindowStaysOnBottomHint => 0x04000000
            case WindowCloseButtonHint => 0x08000000
            case MacWindowToolBarButtonHint => 0x10000000
            case BypassGraphicsProxyWidget => 0x20000000
            case NoDropShadowWindowHint => 0x40000000
            case WindowFullscreenButtonHint => 0x80000000
        }
    }
}

public enum Orientation {
    | Horizontal
    | Vertical

    public func value(): Int32 {
        match (this) {
            case Horizontal => 0x1i32
            case Vertical => 0x2i32
        }
    }
}
