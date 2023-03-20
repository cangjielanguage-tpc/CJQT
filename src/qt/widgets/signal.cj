package qt.widgets


public open class QWidgetSignal<T> {
    /* let member ptr type is Int64 */
    protected let ptr: Int64

    /* let member signalType type is String */
    protected let signalType: String

    private var connectCb: ?(Int64, CFunc<(Int64, CPointer<Unit>) -> Unit>) -> Unit = None

    /**
     * The Function is init constructor
     *
     * @param signalType of String
     * @param ptr of Int64
     */
    public init(
        signalType: String,
        ptr: Int64,
        connectCb!: ?(Int64, CFunc<(Int64, CPointer<Unit>) -> Unit>) -> Unit = None
    ) {
        this.ptr = ptr
        this.signalType = signalType
        this.connectCb = connectCb
    }

    /**
     * The Function is connect
     *
     * @param callback of (T)->Unit
     */
    public func connect(callback: (T) -> Unit) {
        QCallbackMap.connectAny.put(QMapKey(signalType, ptr).hashCode(), callback)

        let connectCPointerCallback: CFunc<(Int64, CPointer<Unit>) -> Unit> = {
            code, pointer => try {
                let callback = QCallbackMap.connectAny[code]
                match {
                    case (callback is (Unit) -> Unit) => (callback as (Unit) -> Unit).getOrThrow()(())
                    case (callback is (Int64) -> Unit) =>
                        (callback as (Int64) -> Unit).getOrThrow()(QConversion.cPointerToInt(pointer))
                    case (callback is (String) -> Unit) =>
                        (callback as (String) -> Unit).getOrThrow()(QConversion.cPointerToString(pointer))
                    case (callback is (Bool) -> Unit) =>
                        (callback as (Bool) -> Unit).getOrThrow()(QConversion.cPointerToBool(pointer))
                    case (callback is ((Int64, Int64)) -> Unit) =>
                        let dataIntInt = QConversion.cPointerToCjDataIntInt(pointer)
                        (callback as ((Int64, Int64)) -> Unit).getOrThrow()((Int64(dataIntInt.p1), Int64(dataIntInt.p2))
                        )
                    case _ => ()
                }
            } catch (e: Exception) {
                println("connectCPointerCallback: ${e}")
            }
        }

        match (connectCb) {
            case Some(cb) => cb(QMapKey(signalType, ptr).hashCode(), connectCPointerCallback)
            case None => nativeConnect(QMapKey(signalType, ptr).hashCode(), connectCPointerCallback)
        }
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64)->Unit>
     */
    public open func nativeConnect(code: Int64, cb: CFunc<(Int64, CPointer<Unit>) -> Unit>) {}

    /**
     * The Function is remove
     *
     */
    public func remove() {
        QCallbackMap.connectAny.remove(QMapKey(signalType, ptr).hashCode())
        return
    }
}
