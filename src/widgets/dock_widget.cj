/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.widgets

foreign func nativeDockWidgetCreate(parentPtr: Int64): Int64
foreign func nativeDockWidgetCreateText(text: CString,ptr: Int64): Int64
foreign func nativeDockWidgetSetWidget(ptr: Int64,widgetPtr: Int64):Unit
foreign func nativeDockWidgetSetTitleBarWidget(ptr: Int64,widgetPtr: Int64):Unit

public enum DockWidgetArea {
    LeftDockWidgetArea | RightDockWidgetArea | TopDockWidgetArea | BottomDockWidgetArea|AllDockWidgetAreas|NoDockWidgetArea

    /**
     * The Function is value
     *
     * @return Type  of  Int32
     */
    public func value(): Int16 {
        match (this) {
            case NoDockWidgetArea => 0
            case LeftDockWidgetArea => 1
            case RightDockWidgetArea => 2
            case TopDockWidgetArea => 4
            case BottomDockWidgetArea => 8
            case AllDockWidgetAreas => 0xf
        }
    }

    /**
     * The Function is conver
     *
     * @param echoMode of Int32
     *
     * @return Type  of   Enum EchoMode
     */
    public static func convert(area: Int16): DockWidgetArea {
        match (area) {
            case 0 => NoDockWidgetArea
            case 1 => LeftDockWidgetArea
            case 2 => RightDockWidgetArea
            case 4 => TopDockWidgetArea
            case 8 => BottomDockWidgetArea
            case 0xf => AllDockWidgetAreas
            case _ => NoDockWidgetArea
        }
    }
}
public class QDockWidget <: QWidget {
    /**
     * The Function is init constructor
     *
     * @param text of String, and the Default value is ""
     * @param parent of QWidget, and the Default value is QWidget(0)
     */
    public init(text: String , parent: QWidget) {
        super(
            unsafe {
                nativeDockWidgetCreate(parent.ptr)
            }
        )
        setWindowTitle(text)
    }

    public init(parent: QWidget) {
        super(
            unsafe {
                nativeDockWidgetCreate(parent.ptr)
            }
        )
    }
    

    public init(ptr:Int64) {
        super(ptr)
    }

    public func  setWidget(widget: QWidget){
        unsafe {
            nativeDockWidgetSetWidget(ptr, widget.ptr)
        }
    }

    /**
     * The Function is isChecked
     *
     * @return Type of Bool
     */
     public func setTitleBarWidget(widget: QWidget){
        unsafe {
            nativeDockWidgetSetTitleBarWidget(ptr,widget.ptr)
        }
    }

}
