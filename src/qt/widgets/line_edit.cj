/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.widgets

import qt.gui.QValidator

// foreign C Functions
foreign func nativeLineEditCreate(parentPtr: Int64): Int64
foreign func nativeLineEditCreateWithString(contents: CString, parentPtr: Int64): Int64
foreign func nativeLineEditDelete(ptr: Int64): Unit
foreign func nativeLineEditAddAction(ptr: Int64, actionPtr: Int64, position: Int32): Unit
foreign func nativeLineEditAddActionWithIcon(ptr: Int64, iconPtr: Int64, position: Int32): Int64
foreign func nativeLineEditAlignment(ptr: Int64): Int16

/********************************


   void nativeLineEditBackspace(long ptr)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->backspace();
   }
   #if QT_CONFIG(completer)
   long nativeLineEditCompleter(long ptr)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       QCompleter *completerObj = lineEditObj->completer();
       return reinterpret_cast<long>(completerObj);
   }
   #endif
   #ifndef QT_NO_CONTEXTMENU
   long nativeLineEditCreateStandardContextMenu(long ptr)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       QMenu *menuObj = lineEditObj->createStandardContextMenu();
       return reinterpret_cast<long>(menuObj);
   }
   #endif
   void nativeLineEditCursorBackward(long ptr, bool mark, int steps)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->cursorBackward(mark, steps);
   }
   void nativeLineEditCursorForward(long ptr, bool mark, int steps)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->cursorForward(mark, steps);
   }
   int nativeLineEditCursorMoveStyle(long ptr)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->cursorMoveStyle();
   }
   int nativeLineEditCursorPosition(long ptr)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->cursorPosition();
   }
   int nativeLineEditCursorPositionAt(long ptr, const long pointPrt)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       QPoint *pointObj = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(pointPrt));
       return lineEditObj->cursorPositionAt(*pointObj);
   }
   void nativeLineEditCursorWordBackword(long ptr, bool mark)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->cursorWordBackward(mark);
   }
   void nativeLineEditCursorWordForward(long ptr, bool mark)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->cursorWordForward(mark);
   }
   void nativeLineEditDel(long ptr)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->del();
   }
   void nativeLineEditDeselect(long ptr)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->deselect();
   }
   char *nativeLineEditDisplayText(long ptr)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       QString str = lineEditObj->displayText();
       QByteArray ba = str.toUtf8();
       return ba.data();
   }
   bool nativeLineEditDragEnabled(long ptr)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->dragEnabled();
   }
 * ***************/
foreign func nativeLineEditEchMode(ptr: Int64): Int32

/***************

   void nativeLineEditEnd(long ptr, bool mark)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->end(mark);
   }
   bool nativeLineEditHasAcceptableInput(long ptr)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->hasAcceptableInput();
   }

   void nativeLineEditHome(long ptr, bool mark)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->home(mark);
   }
 * **********************/
foreign func nativeLineEditHasFrame(ptr: Int64): Bool
foreign func nativeLineEditHasSelectedText(ptr: Int64): Bool
foreign func nativeLineEditInputMask(ptr: Int64): CString

/*********************

   void nativeLineEditInsert(long ptr, const char *newText)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->insert(QString(newText));
   }
   bool nativeLineEditIsClearButtonEnabled(long ptr)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->isClearButtonEnabled();
   }
 * ****************/
foreign func nativeLineEditIsModified(ptr: Int64): Bool
foreign func nativeLineEditIsReadOnly(ptr: Int64): Bool

/*******************

   bool nativeLineEditIsRedoAvailable(long ptr)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->isRedoAvailable();
   }
   bool nativeLineEditIsUndoAvailable(long ptr)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->isUndoAvailable();
   }
 * **********************/
foreign func nativeLineEditMaxLength(ptr: Int64): Int32
foreign func nativeLineEditPlaceholderText(ptr: Int64): CString
foreign func nativeLineEditSelectedText(ptr: Int64): CString

/************************


   int nativeLineEditSelectionEnd(long ptr)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->selectionEnd();
   }
   int nativeLineEditSelectionLength(long ptr)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->selectionLength();
   }
   int nativeLineEditSelectionStart(long ptr)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->selectionStart();
   }
 * **********************/
foreign func nativeLineEditSetAlignment(ptr: Int64, flag: Int16): Unit

/********************

   void nativeLineEditSetClearButtonEnabled(long ptr, bool enable)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->setClearButtonEnabled(enable);
   }
   #if QT_CONFIG(completer)
   void nativeLineEditSetCompleter(long ptr, long completerPtr)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       QCompleter *completerObj = reinterpret_cast<QCompleter *>(static_cast<uintptr_t>(completerPtr));
       return lineEditObj->setCompleter(completerObj);
   }
   #endif
   void nativeLineEditSetCursorMoveStyle(long ptr, int style)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->setCursorMoveStyle(Qt::CursorMoveStyle(style));
   }
   void nativeLineEditSetCursorPosition(long ptr, int position)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->setCursorPosition(position);
   }
   void nativeLineEditSetDragEnabled(long ptr, bool b)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->setDragEnabled(b);
   }
 * **********************/
foreign func nativeLineEditSetEchMode(ptr: Int64, echMode: Int32): Unit
foreign func nativeLineEditSetInputMask(ptr: Int64, inputMask: CString): Unit
foreign func nativeLineEditSetFrame(ptr: Int64, b: Bool): Unit
foreign func nativeLineEditSetMaxLength(ptr: Int64, length: Int32): Unit
foreign func nativeLineEditSetModified(ptr: Int64, b: Bool): Unit
foreign func nativeLineEditSetPlaceholderText(ptr: Int64, str: CString): Unit
foreign func nativeLineEditSetReadOnly(ptr: Int64, b: Bool): Unit

/***************************


   void nativeLineEditSetSelection(long ptr, int start, int length)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->setSelection(start, length);
   }
   void nativeLineEditSetTextMargins(long ptr, int left, int stop, int right, int bottom)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       return lineEditObj->setTextMargins(left, stop, right, bottom);
   }
   void nativeLineEditSetTextMarginsWithMargins(long ptr, const long marginsPtr)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       QMargins *marginsObj = reinterpret_cast<QMargins *>(static_cast<uintptr_t>(marginsPtr));
       return lineEditObj->setTextMargins(*marginsObj);
   }

 * *************/
foreign func nativeLineEditSetValidator(ptr: Int64, validatorPtr: Int64): Unit
foreign func nativeLineEditText(ptr: Int64): CString

/*********************
   long nativeLineEditTextMargins(long ptr)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       QMargins margins = lineEditObj->textMargins();
       QMargins *pMargins = new QMargins(margins);
       return reinterpret_cast<long>(pMargins);
   }
 * ***************/
foreign func nativeLineEditValidator(ptr: Int64): Int64

/**************************

   // Reimplemented Public Functions
   bool nativeLineEditEven(long ptr, long eventPtr)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       QEvent *eventObj = reinterpret_cast<QEvent *>(static_cast<uintptr_t>(eventPtr));
       return lineEditObj->event(eventObj);
   }
   long nativeLineEditInputMethodQuery(long ptr, long property)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       QVariant variant = lineEditObj->inputMethodQuery(Qt::InputMethodQuery(property));
       QVariant *pVariant = new QVariant(variant);
       return reinterpret_cast<long>(pVariant);
   }
   long nativeLineEditMinimumSizeHint(long ptr)
   {
       QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
       QSize size = lineEditObj->minimumSizeHint();
       QSize *pSize = new QSize(size);
       return reinterpret_cast<long>(pSize);
   }
 * ********************/

// Public Slots
foreign func nativeLineEditClear(ptr: Int64): Unit
foreign func nativeLineEditCopy(ptr: Int64): Unit
foreign func nativeLineEditCut(ptr: Int64): Unit
foreign func nativeLineEditPaste(ptr: Int64): Unit
foreign func nativeLineEditRedo(ptr: Int64): Unit
foreign func nativeLineEditUndo(ptr: Int64): Unit
foreign func nativeLineEditSelectAll(ptr: Int64): Unit
foreign func nativeLineEditSetText(ptr: Int64, str: CString): Unit

// Signals Function
foreign func nativeLineEditConnectCursorPositionChanged(
    ptr: Int64,
    code: Int64,
    callback: CFunc<(Int64, CPointer<Unit>) -> Unit>
): Unit
foreign func nativeLineEditConnectEditingFinished(ptr: Int64, code: Int64, 
    callback: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit
foreign func nativeLineEditConnectInputRejected(ptr: Int64, code: Int64, 
    callback: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit
foreign func nativeLineEditConnectReturnPressed(ptr: Int64, code: Int64, 
    callback: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit
foreign func nativeLineEditConnectSelectionChanged(ptr: Int64, code: Int64, 
    callback: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit
foreign func nativeLineEditConnectTextChanged(ptr: Int64, code: Int64, callback: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit
foreign func nativeLineEditConnectTextEdited(ptr: Int64, code: Int64, callback: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit

/**
 * The enum is ActionPosition
 * @author helin
 */
public enum ActionPosition {
    LeadingPosition | TrailingPosition

    /**
     * The Function is value
     *
     * @return Type  is  Int32
     */
    public func value(): Int32 {
        match (this) {
            case LeadingPosition => 0
            case TrailingPosition => 1
        }
    }
}

/**
 * The enum is EchoMode
 * @author helin
 */
public enum EchoMode {
    Normal | NoEcho | Password | PasswordEchoOnEdit

    /**
     * The Function is value
     *
     * @return Type  of  Int32
     */
    public func value(): Int32 {
        match (this) {
            case Normal => 0
            case NoEcho => 1
            case Password => 2
            case PasswordEchoOnEdit => 3
        }
    }

    /**
     * The Function is conver
     *
     * @param echoMode of Int32
     *
     * @return Type  of   Enum EchoMode
     */
    public static func convert(echoMode: Int32): EchoMode {
        match (echoMode) {
            case 0 => Normal
            case 1 => NoEcho
            case 2 => Password
            case 3 => PasswordEchoOnEdit
            case _ => Normal
        }
    }
}

/**
 * The class is QLineEdit
 * @author helin
 */
public open class QLineEdit <: QWidget {
    /** let member cursorPositionChanged type is QLineEditCursorPositionChangedSignal */
    public let cursorPositionChanged: QLineEditCursorPositionChangedSignal<(Int64, Int64)>

    /** let member editingFinished type is QLineEditEditingFinishedSignal */
    public let editingFinished: QLineEditEditingFinishedSignal<Unit>

    /** let member inputRejected type is QLineEditInputRejectedSignal */
    public let inputRejected: QLineEditInputRejectedSignal<Unit>

    /** let member returnPressed type is QLineEditReturnPressedSignal */
    public let returnPressed: QLineEditReturnPressedSignal<Unit>

    /** let member selectionChanged type is QLineEditSelectionChangedSignal */
    public let selectionChanged: QLineEditSelectionChangedSignal<Unit>

    /** let member textChanged type is QLineEditTextChangedSignal */
    public let textChanged: QLineEditTextChangedSignal<String>

    /** let member textEdited type is QLineEditTextEditedSignal */
    public let textEdited: QLineEditTextEditedSignal<String>

    /**
     * The Function is init constructor
     *
     */
    public init() {
        super(
            unsafe {
                nativeLineEditCreate(0)
            }
        )
        cursorPositionChanged = QLineEditCursorPositionChangedSignal(this.ptr)
        editingFinished = QLineEditEditingFinishedSignal(this.ptr)
        inputRejected = QLineEditInputRejectedSignal(this.ptr)
        returnPressed = QLineEditReturnPressedSignal(this.ptr)
        selectionChanged = QLineEditSelectionChangedSignal(this.ptr)
        textChanged = QLineEditTextChangedSignal(this.ptr)
        textEdited = QLineEditTextEditedSignal(this.ptr)
    }

    /**
     * The Function is init constructor
     *
     * @param parent of QWidget
     */
    public init(parent: QWidget) {
        super(
            unsafe {
                nativeLineEditCreate(parent.ptr)
            }
        )
        cursorPositionChanged = QLineEditCursorPositionChangedSignal(this.ptr)
        editingFinished = QLineEditEditingFinishedSignal(this.ptr)
        inputRejected = QLineEditInputRejectedSignal(this.ptr)
        returnPressed = QLineEditReturnPressedSignal(this.ptr)
        selectionChanged = QLineEditSelectionChangedSignal(this.ptr)
        textChanged = QLineEditTextChangedSignal(this.ptr)
        textEdited = QLineEditTextEditedSignal(this.ptr)
    }

    /**
     * The Function is init constructor
     *
     * @param contents of String
     */
    public init(contents: String) {
        super(
            unsafe {
                nativeLineEditCreateWithString(CString(contents), 0)
            }
        )
        cursorPositionChanged = QLineEditCursorPositionChangedSignal(this.ptr)
        editingFinished = QLineEditEditingFinishedSignal(this.ptr)
        inputRejected = QLineEditInputRejectedSignal(this.ptr)
        returnPressed = QLineEditReturnPressedSignal(this.ptr)
        selectionChanged = QLineEditSelectionChangedSignal(this.ptr)
        textChanged = QLineEditTextChangedSignal(this.ptr)
        textEdited = QLineEditTextEditedSignal(this.ptr)
    }

    /**
     * The Function is init constructor
     *
     * @param contents of String
     * @param parent of QWidget
     */
    public init(contents: String, parent: QWidget) {
        super(
            unsafe {
                nativeLineEditCreateWithString(CString(contents), parent.ptr)
            }
        )
        cursorPositionChanged = QLineEditCursorPositionChangedSignal(this.ptr)
        editingFinished = QLineEditEditingFinishedSignal(this.ptr)
        inputRejected = QLineEditInputRejectedSignal(this.ptr)
        returnPressed = QLineEditReturnPressedSignal(this.ptr)
        selectionChanged = QLineEditSelectionChangedSignal(this.ptr)
        textChanged = QLineEditTextChangedSignal(this.ptr)
        textEdited = QLineEditTextEditedSignal(this.ptr)
    }

    /**
     * The Function is delete
     *
     */
    public override func delete(): Unit {
        cursorPositionChanged.remove()
        editingFinished.remove()
        inputRejected.remove()
        returnPressed.remove()
        selectionChanged.remove()
        textChanged.remove()
        textEdited.remove()
        unsafe {
            nativeLineEditDelete(this.ptr)
        }
    }

    /**
     * The Function is addAction
     *
     * @param action of QAction
     * @param position of enum ActionPosition
     */
    public func addAction(action: QAction, position: ActionPosition): Unit {
        unsafe {
            nativeLineEditAddAction(this.ptr, action.ptr, position.value())
        }
    }

    /**
     * The Function is addAction
     *
     * @param icon of QIcon
     * @param position of enum ActionPosition
     *
     * @return Type of QAction
     */
    public func addAction(icon: QIcon, position: ActionPosition): QAction {
        var actionPtr = unsafe {
            nativeLineEditAddActionWithIcon(this.ptr, icon.ptr, position.value())
        }
        return QAction(actionPtr)
    }

    /**
     * The Function is text
     *
     * @return Type of String
     */
    public func text(): String {
        var str = unsafe {
            nativeLineEditText(this.ptr)
        }
        return str.toString()
    }

    /**
     * The Function is placeholderText
     *
     * @return Type of String
     */
    public func placeholderText(): String {
        var str = unsafe {
            nativeLineEditPlaceholderText(this.ptr)
        }
        return str.toString()
    }

    /**
     * The Function is setPlaceholderText
     *
     * @param str of Stringss
     */
    public func setPlaceholderText(str: String): Unit {
        unsafe {
            nativeLineEditSetPlaceholderText(this.ptr, CString(str))
        }
    }

    /**
     * The Function is setEchMod
     *
     * @param echMode of Enum EchoMode
     */
    public func setEchMod(echMode: EchoMode): Unit {
        unsafe {
            nativeLineEditSetEchMode(this.ptr, echMode.value())
        }
    }

    /**
     * The Function is echMode
     *
     * @return Type of Enum EchoMode
     */
    public func echMode(): EchoMode {
        let num = unsafe {
            nativeLineEditEchMode(this.ptr)
        }
        return EchoMode.convert(num)
    }

    /**
     * The Function is setReadOnly
     *
     * @param b of Bool
     */
    public func setReadOnly(b: Bool): Unit {
        unsafe {
            nativeLineEditSetReadOnly(this.ptr, b)
        }
    }

    /**
     * The Function is isReadOnly
     *
     * @return Type of Bool
     */
    public func isReadOnly(): Bool {
        return unsafe {
            nativeLineEditIsReadOnly(this.ptr)
        }
    }

    /**
     * The Function is setInputMask
     *
     * @param inputMark of String
     */
    public func setInputMask(inputMark: String): Unit {
        unsafe {
            nativeLineEditSetInputMask(this.ptr, CString(inputMark))
        }
    }

    /**
     * The Function is inputMask
     *
     * @return Type of String
     */
    public func inputMask(): String {
        let str = unsafe {
            nativeLineEditInputMask(this.ptr)
        }
        return str.toString()
    }

    /**
     * The Function is setFrame
     *
     * @param b of Bool
     */
    public func setFrame(b: Bool): Unit {
        unsafe {
            nativeLineEditSetFrame(this.ptr, b)
        }
    }

    /**
     * The Function is hasFrame
     *
     * @return Type of Bool
     */
    public func hasFrame(): Bool {
        unsafe {
            nativeLineEditHasFrame(this.ptr)
        }
    }

    /**
     * The Function is selectedText
     *
     * @return Type  of String
     */
    public func selectedText(): String {
        let str = unsafe {
            nativeLineEditSelectedText(this.ptr)
        }
        return str.toString()
    }

    /**
     * The Function is hasSelectedText
     *
     * @return Type of Bool
     */
    public func hasSelectedText(): Bool {
        unsafe {
            nativeLineEditHasSelectedText(this.ptr)
        }
    }

    /**
     * The Function is setMaxLengt
     *
     * @param length of Int64
     */
    public func setMaxLengt(length: Int64): Unit {
        unsafe {
            nativeLineEditSetMaxLength(this.ptr, Int32(length))
        }
    }

    /**
     * The Function is maxLength
     *
     * @return Type of Int64
     */
    public func maxLength(): Int64 {
        let length = unsafe {
            nativeLineEditMaxLength(this.ptr)
        }
        return Int64(length)
    }

    /**
     * The Function is setModified
     *
     * @param b of Bool
     */
    public func setModified(b: Bool): Unit {
        unsafe {
            nativeLineEditSetModified(this.ptr, b)
        }
    }

    /**
     * The Function is modified
     *
     * @return Type of Bool
     */
    public func modified(): Bool {
        return unsafe {
            nativeLineEditIsModified(this.ptr)
        }
    }

    /**
     * The Function is setMaxLengt
     *
     * @param length of Int64
     */
    public func setAlignmen(flag: Alignment): Unit {
        unsafe {
            nativeLineEditSetAlignment(this.ptr, flag.value())
        }
    }

    /**
     * The Function is alignment
     *
     * @return Type of enum  Alignment
     */
    public func alignment(): Alignment {
        let num = unsafe {
            nativeLineEditAlignment(this.ptr)
        }
        return Alignment.convert(num)
    }

    /**
     * The Function is setValidator
     *
     * @param validator of QValidator
     */
    public func setValidator(validator: QValidator): Unit {
        unsafe {
            nativeLineEditSetValidator(this.ptr, validator.ptr)
        }
    }

    /**
     * The Function is validator
     *
     * @return Type of QValidator class
     */
    public func validator(): QValidator {
        let validatorPtr = unsafe {
            nativeLineEditValidator(this.ptr)
        }
        return QValidator(validatorPtr)
    }

    /**
     * The Slots Function is clear
     *
     */
    public func clear(): Unit {
        unsafe {
            nativeLineEditClear(this.ptr)
        }
    }

    /**
     * The Slots Function is copy
     *
     */
    public func copy(): Unit {
        unsafe {
            nativeLineEditCopy(this.ptr)
        }
    }

    /**
     * The Slots Function is cut
     *
     */
    public func cut(): Unit {
        unsafe {
            nativeLineEditCut(this.ptr)
        }
    }

    /**
     * The Slots Function is paste
     *
     */
    public func paste(): Unit {
        unsafe {
            nativeLineEditPaste(this.ptr)
        }
    }

    /**
     * The Slots Function is redo
     *
     */
    public func redo(): Unit {
        unsafe {
            nativeLineEditRedo(this.ptr)
        }
    }

    /**
     * The Slots Function is undo
     *
     */
    public func undo(): Unit {
        unsafe {
            nativeLineEditUndo(this.ptr)
        }
    }

    /**
     * The Slots Function is selectAll
     *
     */
    public func selectAll(): Unit {
        unsafe {
            nativeLineEditSelectAll(this.ptr)
        }
    }

    /**
     * The Slots Function is setText
     *
     */
    public func setText(str: String): Unit {
        unsafe {
            nativeLineEditSetText(this.ptr, CString(str))
        }
    }
}

/**
 * The class is QLineEditCursorPositionChangedSignal inherited from QWidgetSignal<T>
 * @author helin
 */
public class QLineEditCursorPositionChangedSignal<T> <: QWidgetSignal<T> {
    /*
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        super("cursorPositionChanged", ptr)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64,Int32,Int32)->Unit>
     */
    public override func nativeConnect(code: Int64, cb: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit {
        unsafe {
            nativeLineEditConnectCursorPositionChanged(ptr, code, cb)
        }
    }
}

/**
 * The class is QLineEditEditingFinishedSignal inherited from QWidgetSignal<T>
 * @author helin
 */
public class QLineEditEditingFinishedSignal<T> <: QWidgetSignal<T> {
    /*
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        super("editingFinished", ptr)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64)->Unit>
     */
    public override func nativeConnect(code: Int64, cb: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit {
        unsafe {
            nativeLineEditConnectEditingFinished(ptr, code, cb)
        }
    }
}

/**
 * The class is QLineEditInputRejectedSignal inherited from QWidgetSignal<T>
 * @author helin
 */
public class QLineEditInputRejectedSignal<T> <: QWidgetSignal<T> {
    /*
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        super("inputRejected", ptr)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64)->Unit>
     */
    public override func nativeConnect(code: Int64, cb: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit {
        unsafe {
            nativeLineEditConnectInputRejected(ptr, code, cb)
        }
    }
}

/**
 * The class is QLineEditReturnPressedSignal inherited from QWidgetSignal<T>
 * @author helin
 */
public class QLineEditReturnPressedSignal<T> <: QWidgetSignal<T> {
    /*
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        super("returnPressed", ptr)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64)->Unit>
     */
    public override func nativeConnect(code: Int64, cb: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit {
        unsafe {
            nativeLineEditConnectReturnPressed(ptr, code, cb)
        }
    }
}

/**
 * The class is QLineEditSelectionChangedSignal inherited from QWidgetSignal<T>
 * @author helin
 */
public class QLineEditSelectionChangedSignal<T> <: QWidgetSignal<T> {
    /*
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        super("selectionChanged", ptr)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64)->Unit>
     */
    public override func nativeConnect(code: Int64, cb: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit {
        unsafe {
            nativeLineEditConnectSelectionChanged(ptr, code, cb)
        }
    }
}

/**
 * The class is QLineEditTextChangedSignal inherited from QSignalCString
 * @author helin
 */
public class QLineEditTextChangedSignal<T> <: QWidgetSignal<T> {
    /*
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        super("textChanged", ptr)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64,CString)->Unit>
     */
    public override func nativeConnect(code: Int64, cb: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit {
        unsafe {
            nativeLineEditConnectTextChanged(ptr, code, cb)
        }
    }
}

/**
 * The class is QLineEditTextEditedSignal inherited from QSignalCString
 * @author helin
 */
public class QLineEditTextEditedSignal<T> <: QWidgetSignal<T> {
    /*
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        super("textEdited", ptr)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64,CString)->Unit>
     */
    public override func nativeConnect(code: Int64, cb: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit {
        unsafe {
            nativeLineEditConnectTextEdited(ptr, code, cb)
        }
    }
}
