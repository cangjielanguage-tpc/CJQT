package cjqt.core

import cjqt.tools.QConversion

//foreign function
foreign func nativeVariantCreate(): CPointer<Unit>
foreign func nativeVariantCreateWithValue(typeVal: Int32, value: CPointer<Unit>): CPointer<Unit>
foreign func nativeVariantDelete(ptr: CPointer<Unit>): Unit

foreign func nativeVariantSetValue(ptr: CPointer<Unit>, typeVal: Int32, value: CPointer<Unit>): Unit

foreign func nativeVariantIsValid(ptr: CPointer<Unit>): Bool
foreign func nativeVariantIsNull(ptr: CPointer<Unit>): Bool

foreign func nativeVariantToInt(ptr: CPointer<Unit>): Int32
foreign func nativeVariantToBool(ptr: CPointer<Unit>): Bool
foreign func nativeVariantToString(ptr: CPointer<Unit>): CString

public open class QVariant {
    public let ptr: CPointer<Unit>
    
    public init(ptr: CPointer<Unit>) {
        this.ptr = ptr
    }
    public init() {
        this.ptr = unsafe { nativeVariantCreate() }
    }

    public init(d: Int64) {
        this.ptr = unsafe { nativeVariantCreateWithValue(QVariantType.QInt.value(), QConversion.intToCPointer(d)) }
    }

    public init(d: Bool) {
        this.ptr = unsafe { nativeVariantCreateWithValue(QVariantType.QBool.value(), QConversion.boolToCPointer(d)) }
    }

    public init(d: String) {
        this.ptr = unsafe { nativeVariantCreateWithValue(QVariantType.QString.value(), QConversion.stringToCPointer(d)) }
    }

    public open func delete(): Unit {
        unsafe { nativeVariantDelete(this.ptr) }
    }

    public func setValue<T>(value: T): Unit where T <: Any {
        try {
            let ptrVal = match {
                case (value is Int64) => QConversion.intToCPointer((value as Int64).getOrThrow())
                case (value is Bool) => QConversion.boolToCPointer((value as Bool).getOrThrow())
                case (value is String) => QConversion.stringToCPointer((value as String).getOrThrow())
                case _ => CPointer<Unit>()
            }
            let ptrType = match {
                case (value is Int64) => QVariantType.QInt.value()
                case (value is Bool) => QVariantType.QBool.value()
                case (value is String) => QVariantType.QString.value()
                case _ => QVariantType.Invalid.value()
            }
            unsafe { nativeVariantSetValue(this.ptr, ptrType, ptrVal) }
        } catch (e: Exception) {
            println("QVariant setValue Exception: ${e}")
        }
    }

    public func isValid(): Bool {
        let result = unsafe { nativeVariantIsValid(this.ptr) }
        return result
    }

    public func isNull(): Bool {
        let result = unsafe { nativeVariantIsNull(this.ptr) }
        return result
    }

    public func toInt(): Int64 {
        let result = unsafe { nativeVariantToInt(this.ptr) }
        return Int64(result)
    }

    public func toBool(): Bool {
        let result = unsafe { nativeVariantToBool(this.ptr) }
        return result
    }

    public func toString(): String {
        let result = unsafe { nativeVariantToString(this.ptr) }
        return result.toString()
    }

}

public enum QVariantType {
    | Invalid
    | QBool
    | QInt
    | QString

    public func value(): Int32 {
        return match (this) {
            case Invalid => 0
            case QBool => 1
            case QInt => 2
            case QString => 10
        }
    }
}