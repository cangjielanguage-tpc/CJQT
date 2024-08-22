#include "line_edit.h"

extern "C"
{
    // QLineEdit
    uintptr_t nativeLineEditCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        CjLineEdit *lineEdit;
        if (parentPtr == 0L)
        {
            lineEdit = new CjLineEdit();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            lineEdit = new CjLineEdit(parent);
        }
        return reinterpret_cast<uintptr_t>(lineEdit);
    }

    uintptr_t nativeLineEditCreateWithString(const char *contents, uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        CjLineEdit *lineEdit;
        if (parentPtr == 0L)
        {
            lineEdit = new CjLineEdit(QString(contents));
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            lineEdit = new CjLineEdit(QString(contents), parent);
        }
        return reinterpret_cast<uintptr_t>(lineEdit);
    }
    void nativeLineEditDelete(uintptr_t ptr)
    {
        CjLineEdit *instance = reinterpret_cast<CjLineEdit *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
#if QT_CONFIG(action)
    void nativeLineEditAddAction(uintptr_t ptr, uintptr_t actionPtr, int position)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QAction *actionObj = reinterpret_cast<QAction *>(static_cast<uintptr_t>(actionPtr));
        return lineEditObj->addAction(actionObj, QLineEdit::ActionPosition(position));
    }
    uintptr_t nativeLineEditAddActionWithIcon(uintptr_t ptr, const uintptr_t iconPtr, int position)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QIcon *iconObj = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        QAction *actionObj = lineEditObj->addAction(*iconObj, QLineEdit::ActionPosition(position));
        return reinterpret_cast<uintptr_t>(actionObj);
    }
#endif
    short nativeLineEditAlignment(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->alignment();
    }

    void nativeLineEditBackspace(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->backspace();
    }
#if QT_CONFIG(completer)
    uintptr_t nativeLineEditCompleter(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QCompleter *completerObj = lineEditObj->completer();
        return reinterpret_cast<uintptr_t>(completerObj);
    }
#endif
#ifndef QT_NO_CONTEXTMENU
    uintptr_t nativeLineEditCreateStandardContextMenu(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QMenu *menuObj = lineEditObj->createStandardContextMenu();
        return reinterpret_cast<uintptr_t>(menuObj);
    }
#endif
    void nativeLineEditCursorBackward(uintptr_t ptr, bool mark, int steps)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->cursorBackward(mark, steps);
    }
    void nativeLineEditCursorForward(uintptr_t ptr, bool mark, int steps)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->cursorForward(mark, steps);
    }
    int nativeLineEditCursorMoveStyle(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->cursorMoveStyle();
    }
    int nativeLineEditCursorPosition(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->cursorPosition();
    }
    int nativeLineEditCursorPositionAt(uintptr_t ptr, const uintptr_t pointPrt)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QPoint *pointObj = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(pointPrt));
        return lineEditObj->cursorPositionAt(*pointObj);
    }
    void nativeLineEditCursorWordBackword(uintptr_t ptr, bool mark)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->cursorWordBackward(mark);
    }
    void nativeLineEditCursorWordForward(uintptr_t ptr, bool mark)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->cursorWordForward(mark);
    }
    void nativeLineEditDel(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->del();
    }
    void nativeLineEditDeselect(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->deselect();
    }
    char *nativeLineEditDisplayText(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QString str = lineEditObj->displayText();
        QByteArray ba = str.toUtf8();
        return ba.data();
    }
    bool nativeLineEditDragEnabled(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->dragEnabled();
    }
    int nativeLineEditEchMode(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->echoMode();
    }
    void nativeLineEditEnd(uintptr_t ptr, bool mark)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->end(mark);
    }
    bool nativeLineEditHasAcceptableInput(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->hasAcceptableInput();
    }
    bool nativeLineEditHasFrame(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->hasFrame();
    }
    bool nativeLineEditHasSelectedText(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->hasSelectedText();
    }
    void nativeLineEditHome(uintptr_t ptr, bool mark)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->home(mark);
    }
    char *nativeLineEditInputMask(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QString str = lineEditObj->inputMask();
        QByteArray ba = str.toUtf8();
        return ba.data();
    }
    void nativeLineEditInsert(uintptr_t ptr, const char *newText)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->insert(QString(newText));
    }
    bool nativeLineEditIsClearButtonEnabled(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->isClearButtonEnabled();
    }
    bool nativeLineEditIsModified(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->isModified();
    }
    bool nativeLineEditIsReadOnly(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->isReadOnly();
    }
    bool nativeLineEditIsRedoAvailable(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->isRedoAvailable();
    }
    bool nativeLineEditIsUndoAvailable(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->isUndoAvailable();
    }
    int nativeLineEditMaxLength(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->maxLength();
    }
    char *nativeLineEditPlaceholderText(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QString str = lineEditObj->placeholderText();
        QByteArray ba = str.toUtf8();
        return ba.data();
    }
    char *nativeLineEditSelectedText(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QString str = lineEditObj->selectedText();
        QByteArray ba = str.toUtf8();
        return ba.data();
    }
    int nativeLineEditSelectionEnd(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->selectionEnd();
    }
    int nativeLineEditSelectionLength(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->selectionLength();
    }
    int nativeLineEditSelectionStart(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->selectionStart();
    }
    void nativeLineEditSetAlignment(uintptr_t ptr, short flag)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setAlignment(Qt::Alignment(flag));
    }
    void nativeLineEditSetClearButtonEnabled(uintptr_t ptr, bool enable)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setClearButtonEnabled(enable);
    }
#if QT_CONFIG(completer)
    void nativeLineEditSetCompleter(uintptr_t ptr, uintptr_t completerPtr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QCompleter *completerObj = reinterpret_cast<QCompleter *>(static_cast<uintptr_t>(completerPtr));
        return lineEditObj->setCompleter(completerObj);
    }
#endif
    void nativeLineEditSetCursorMoveStyle(uintptr_t ptr, int style)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setCursorMoveStyle(Qt::CursorMoveStyle(style));
    }
    void nativeLineEditSetCursorPosition(uintptr_t ptr, int position)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setCursorPosition(position);
    }
    void nativeLineEditSetDragEnabled(uintptr_t ptr, bool b)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setDragEnabled(b);
    }
    void nativeLineEditSetEchMode(uintptr_t ptr, int echMode)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setEchoMode(QLineEdit::EchoMode(echMode));
    }
    void nativeLineEditSetFrame(uintptr_t ptr, bool b)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setFrame(b);
    }
    void nativeLineEditSetInputMask(uintptr_t ptr, const char *inputMask)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setInputMask(QString(inputMask));
    }
    void nativeLineEditSetMaxLength(uintptr_t ptr, int length)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setMaxLength(length);
    }
    void nativeLineEditSetModified(uintptr_t ptr, bool b)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setModified(b);
    }
    void nativeLineEditSetPlaceholderText(uintptr_t ptr, const char *ch)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setPlaceholderText(QString(ch));
    }
    void nativeLineEditSetReadOnly(uintptr_t ptr, bool b)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setReadOnly(b);
    }
    void nativeLineEditSetSelection(uintptr_t ptr, int start, int length)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setSelection(start, length);
    }
    void nativeLineEditSetTextMargins(uintptr_t ptr, int left, int stop, int right, int bottom)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setTextMargins(left, stop, right, bottom);
    }
    void nativeLineEditSetTextMarginsWithMargins(uintptr_t ptr, const uintptr_t marginsPtr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QMargins *marginsObj = reinterpret_cast<QMargins *>(static_cast<uintptr_t>(marginsPtr));
        return lineEditObj->setTextMargins(*marginsObj);
    }
#ifndef QT_NO_VALIDATOR
    void nativeLineEditSetValidator(uintptr_t ptr, const uintptr_t varPtr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QValidator *varObj = reinterpret_cast<QValidator *>(static_cast<uintptr_t>(varPtr));
        return lineEditObj->setValidator(varObj);
    }
#endif
    char *nativeLineEditText(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QString str = lineEditObj->text();
        QByteArray ba = str.toUtf8();
        return ba.data();
    }
    uintptr_t nativeLineEditTextMargins(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QMargins margins = lineEditObj->textMargins();
        QMargins *pMargins = new QMargins(margins);
        return reinterpret_cast<uintptr_t>(pMargins);
    }
#ifndef QT_NO_VALIDATOR
    uintptr_t nativeLineEditValidator(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        const QValidator *v = lineEditObj->validator();
        return reinterpret_cast<uintptr_t>(v);
    }
#endif
    // Reimplemented Public Functions
    bool nativeLineEditEven(uintptr_t ptr, uintptr_t eventPtr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QEvent *eventObj = reinterpret_cast<QEvent *>(static_cast<uintptr_t>(eventPtr));
        return lineEditObj->event(eventObj);
    }
    uintptr_t nativeLineEditInputMethodQuery(uintptr_t ptr, uintptr_t property)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QVariant variant = lineEditObj->inputMethodQuery(Qt::InputMethodQuery(property));
        QVariant *pVariant = new QVariant(variant);
        return reinterpret_cast<uintptr_t>(pVariant);
    }
    uintptr_t nativeLineEditMinimumSizeHint(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QSize size = lineEditObj->minimumSizeHint();
        QSize *pSize = new QSize(size);
        return reinterpret_cast<uintptr_t>(pSize);
    }
    // Public Slots
    void nativeLineEditClear(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->clear();
    }
#ifndef QT_NO_CLIPBOARD
    void nativeLineEditCopy(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->copy();
    }
    void nativeLineEditCut(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->cut();
    }
    void nativeLineEditPaste(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->paste();
    }
#endif
    void nativeLineEditRedo(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->redo();
    }
    void nativeLineEditUndo(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->undo();
    }
    void nativeLineEditSelectAll(uintptr_t ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->selectAll();
    }
    void nativeLineEditSetText(uintptr_t ptr, const char *ch)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setText(QString(ch));
    }
    // Signals Function
    void nativeLineEditConnectCursorPositionChanged(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QObject::connect(lineEditObj, &QLineEdit::cursorPositionChanged, [=](int oldPos, int newPos)
                         { 
                            CjDataIntInt  data = {    
 	                            .p1= oldPos,    
 	                            .p2 = newPos
                            };
                            callback(code, (void *)&data); });
    }
    void nativeLineEditConnectEditingFinished(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QObject::connect(lineEditObj, &QLineEdit::editingFinished, [=]()
                         { callback(code, (void *)0); });
    }
    void nativeLineEditConnectInputRejected(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QObject::connect(lineEditObj, &QLineEdit::inputRejected, [=]()
                         { callback(code, (void *)0); });
    }
    void nativeLineEditConnectReturnPressed(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QObject::connect(lineEditObj, &QLineEdit::returnPressed, [=]()
                         { callback(code, (void *)0); });
    }
    void nativeLineEditConnectSelectionChanged(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QObject::connect(lineEditObj, &QLineEdit::selectionChanged, [=]()
                         { callback(code, (void *)0); });
    }
    void nativeLineEditConnectTextChanged(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QObject::connect(lineEditObj, &QLineEdit::textChanged, [=](QString text)
                         {QByteArray ba=text.toUtf8() ; callback(code,ba.data()); });
    }
    void nativeLineEditConnectTextEdited(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QObject::connect(lineEditObj, &QLineEdit::textEdited, [=](const QString text)
                         {QByteArray ba=text.toUtf8() ; callback(code,ba.data()); });
    }
}
