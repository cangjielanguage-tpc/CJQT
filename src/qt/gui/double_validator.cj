package cjqt.qt.gui

import std.convert.*

//foreign C function
foreign func nativeDoubleValidatorCreate(parentPtr: Int64): Int64
foreign func nativeDoubleValidatorCreateWithBottom(bottom: Float64, top: Float64, decimals: Int32, parentPtr: Int64): Int64
foreign func nativeDoubleValidatorDelete(ptr: Int64): Unit
foreign func nativeDoubleValidatorBottom(ptr: Int64): Float64
foreign func nativeDoubleValidatorDecimals(ptr: Int64): Int32
foreign func nativeDoubleValidatorNotation(ptr: Int64): Int32
foreign func nativeDoubleValidatorSetBottom(ptr: Int64, bottom: Float64): Unit
foreign func nativeDoubleValidatorSetDecimals(ptr: Int64, decimals: Int32): Unit
foreign func nativeDoubleValidatorSetNotation(ptr: Int64, notation: Int32): Unit
foreign func nativeDoubleValidatorSetRange(ptr: Int64, minimum: Float64, maximum: Float64, decimals: Int32): Unit
foreign func nativeDoubleValidatorSetTop(ptr: Int64, top: Float64): Unit
foreign func nativeDoubleValidatorTop(ptr: Int64): Float64
foreign func nativeDoubleValidatorValidate(ptr: Int64, input: CString, pos: Int32): Int32

// f oreign C  Signal function
foreign func nativeDoubleValidatorConnectBottomChanged(
    ptr: Int64,
    code: Int64,
    callback: CFunc<(Int64, Float64) -> Unit>
): Unit
foreign func nativeDoubleValidatorConnectDecimalsChanged(
    ptr: Int64,
    code: Int64,
    callback: CFunc<(Int64, Int32) -> Unit>
): Unit
foreign func nativeDoubleValidatorConnectNotationChanged(
    ptr: Int64,
    code: Int64,
    callback: CFunc<(Int64, Int32) -> Unit>
): Unit
foreign func nativeDoubleValidatorConnectTopChanged(ptr: Int64, code: Int64, callback: CFunc<(Int64, Float64) -> Unit>): Unit

//Enum
public enum QDoubleValidatorNotation {
    StandardNotation | ScientificNotation

    public func value(): Int32 {
        match (this) {
            case StandardNotation => 0
            case ScientificNotation => 1
        }
    }

    public static func convert(notation: Int32): QDoubleValidatorNotation {
        match (notation) {
            case 0 => StandardNotation
            case 1 => ScientificNotation
            case _ => StandardNotation
        }
    }
}

public open class QDoubleValidator <: QValidator {
    public let bottomChanged: QDoubleValidatorBottomChangedSignal
    public let decimalsChanged: QDoubleValidatorDecimalsChangedSignal
    public let notationChanged: QDoubleValidatorNotationChangedSignal
    public let topChanged: QDoubleValidatorTopChangedSignal
    public init() {
        super(
            unsafe {
                nativeDoubleValidatorCreate(0)
            }
        )
        bottomChanged = QDoubleValidatorBottomChangedSignal(this.ptr)
        decimalsChanged = QDoubleValidatorDecimalsChangedSignal(this.ptr)
        notationChanged = QDoubleValidatorNotationChangedSignal(this.ptr)
        topChanged = QDoubleValidatorTopChangedSignal(this.ptr)
    }
    public init(ptr: Int64) {
        super(ptr)
        bottomChanged = QDoubleValidatorBottomChangedSignal(this.ptr)
        decimalsChanged = QDoubleValidatorDecimalsChangedSignal(this.ptr)
        notationChanged = QDoubleValidatorNotationChangedSignal(this.ptr)
        topChanged = QDoubleValidatorTopChangedSignal(this.ptr)
    }
    public init(bottom: Float64, top: Float64, decimals: Int32) {
        super(
            unsafe {
                nativeDoubleValidatorCreateWithBottom(bottom, top, decimals, 0)
            }
        )
        bottomChanged = QDoubleValidatorBottomChangedSignal(this.ptr)
        decimalsChanged = QDoubleValidatorDecimalsChangedSignal(this.ptr)
        notationChanged = QDoubleValidatorNotationChangedSignal(this.ptr)
        topChanged = QDoubleValidatorTopChangedSignal(this.ptr)
    }

    public func delete(): Unit {
        bottomChanged.remove()
        decimalsChanged.remove()
        notationChanged.remove()
        topChanged.remove()
        unsafe {
            nativeDoubleValidatorDelete(this.ptr)
        }
    }

    public func bottom(): Float64 {
        return unsafe {
            nativeDoubleValidatorBottom(this.ptr)
        }
    }
    public func decimals(): Int64 {
        let decimals = unsafe {
            nativeDoubleValidatorDecimals(this.ptr)
        }
        return Int64(decimals)
    }
    public func notation(): QDoubleValidatorNotation {
        let notation = unsafe {
            nativeDoubleValidatorNotation(this.ptr)
        }
        return QDoubleValidatorNotation.convert(notation)
    }
    public func setBottom(bottom: Float64): Unit {
        unsafe {
            nativeDoubleValidatorSetBottom(this.ptr, bottom)
        }
    }
    public func setDecimals(decimals: Int64): Unit {
        unsafe {
            nativeDoubleValidatorSetDecimals(this.ptr, Int32(decimals))
        }
    }
    public func setNotation(notation: QDoubleValidatorNotation): Unit {
        unsafe {
            nativeDoubleValidatorSetNotation(this.ptr, notation.value())
        }
    }
    public open func setRange(minimum: Float64, maximum: Float64, decimals: Int64): Unit {
        unsafe {
            nativeDoubleValidatorSetRange(this.ptr, minimum, maximum, Int32(decimals))
        }
    }
    public func setTop(top: Float64): Unit {
        unsafe {
            nativeDoubleValidatorSetTop(this.ptr, top)
        }
    }
    public func top(): Float64 {
        return unsafe {
            nativeDoubleValidatorTop(this.ptr)
        }
    }
            /************
    public open func validate(input: String, pos: Int64): QValidatorState {

        if (input.isEmpty()) {
            return QValidatorState.Intermediate
        }
        if (bottom() >= 0.0 && input.startsWith("-")) {
            return QValidatorState.Invalid
        }
        let dotPos = input.indexOf(".")
        if (dotPos == None) {
            return QValidatorState.Invalid
        }
        let npos = dotPos.getOrThrow()
        if (npos > 0 && (input.substring(npos - 1).size > decimals())) {
            return QValidatorState.Invalid
        }
        let val = parseFloat64(input).getOrThrow()
        if (val <= top() && val >= bottom()) {
            return QValidatorState.Acceptable
        }
        if (val >= 0.0) {
            if (val > top() && -(val) < bottom()) {
                return QValidatorState.Invalid
            } else {
                return QValidatorState.Intermediate
            }
        } else {
            if (val < bottom()) {
                return QValidatorState.Invalid
            } else {
                return QValidatorState.Intermediate
            }
        }

        var strInput = LibC.mallocCString(input)
        let num = unsafe {
            nativeDoubleValidatorValidate(this.ptr, strInput, Int32(pos))
        }
        return QValidatorState.convert(num)
    }
            ******************/
}

/**
 * The class is QDoubleValidatorBottomChangedSignal inherited from QSignalFloat64
 * @author helin
 */
public class QDoubleValidatorBottomChangedSignal <: QSignalFloat64 {
    /*
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        super("bottomChanged", ptr)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64,Float64)->Unit>
     */
    public override func nativeConnect(code: Int64, cb: CFunc<(Int64, Float64) -> Unit>): Unit {
        unsafe {
            nativeDoubleValidatorConnectBottomChanged(ptr, code, cb)
        }
    }
}

/**
 * The class is QDoubleValidatorDecimalsChangedSignal inherited from QSignalInt64
 * @author helin
 */
public class QDoubleValidatorDecimalsChangedSignal <: QSignalInt64 {
    /*
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        super("decimalsChanged", ptr)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64,Int32)->Unit>
     */
    public override func nativeConnect(code: Int64, cb: CFunc<(Int64, Int32) -> Unit>): Unit {
        unsafe {
            nativeDoubleValidatorConnectDecimalsChanged(ptr, code, cb)
        }
    }
}

/**
 * The class is QDoubleValidatorNotationChangedSignal inherited from QSignalInt64
 * @author helin
 */
public class QDoubleValidatorNotationChangedSignal <: QSignalInt64 {
    /*
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        super("notationChanged", ptr)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64,Int32)->Unit>
     */
    public override func nativeConnect(code: Int64, cb: CFunc<(Int64, Int32) -> Unit>): Unit {
        unsafe {
            nativeDoubleValidatorConnectNotationChanged(ptr, code, cb)
        }
    }
}

/**
 * The class is QDoubleValidatorTopChangedSignal inherited from QSignalFloat64
 * @author helin
 */
public class QDoubleValidatorTopChangedSignal <: QSignalFloat64 {
    /*
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        super("topChanged", ptr)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64,Float64)->Unit>
     */
    public override func nativeConnect(code: Int64, cb: CFunc<(Int64, Float64) -> Unit>): Unit {
        unsafe {
            nativeDoubleValidatorConnectTopChanged(ptr, code, cb)
        }
    }
}
