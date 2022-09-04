#include "line_edit.h"

extern "C"
{
    // QLineEdit
    long nativeLineEditCreate(long parentPtr)
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
        return reinterpret_cast<long>(lineEdit);
    }

    long nativeLineEditCreateWithString(const char *contents, long parentPtr)
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
        return reinterpret_cast<long>(lineEdit);
    }
    void nativeLineEditDelete(long ptr)
    {
        CjLineEdit *instance = reinterpret_cast<CjLineEdit *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
#if QT_CONFIG(action)
    void nativeLineEditAddAction(long ptr, long actionPtr, int position)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QAction *actionObj = reinterpret_cast<QAction *>(static_cast<uintptr_t>(actionPtr));
        return lineEditObj->addAction(actionObj, QLineEdit::ActionPosition(position));
    }
    long nativeLineEditAddActionWithIcon(long ptr, const long iconPtr, int position)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QIcon *iconObj = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        QAction *actionObj = lineEditObj->addAction(*iconObj, QLineEdit::ActionPosition(position));
        return reinterpret_cast<long>(actionObj);
    }
#endif
    short nativeLineEditAlignment(long ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->alignment();
    }

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
    int nativeLineEditEchMode(long ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->echoMode();
    }
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
    bool nativeLineEditHasFrame(long ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->hasFrame();
    }
    bool nativeLineEditHasSelectedText(long ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->hasSelectedText();
    }
    void nativeLineEditHome(long ptr, bool mark)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->home(mark);
    }
    char *nativeLineEditInputMask(long ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QString str = lineEditObj->inputMask();
        QByteArray ba = str.toUtf8();
        return ba.data();
    }
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
    bool nativeLineEditIsModified(long ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->isModified();
    }
    bool nativeLineEditIsReadOnly(long ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->isReadOnly();
    }
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
    int nativeLineEditMaxLength(long ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->maxLength();
    }
    char *nativeLineEditPlaceholderText(long ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QString str = lineEditObj->placeholderText();
        QByteArray ba = str.toUtf8();
        return ba.data();
    }
    char *nativeLineEditSelectedText(long ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QString str = lineEditObj->selectedText();
        QByteArray ba = str.toUtf8();
        return ba.data();
    }
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
    void nativeLineEditSetAlignment(long ptr, short flag)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setAlignment(Qt::Alignment(flag));
    }
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
    void nativeLineEditSetEchMode(long ptr, int echMode)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setEchoMode(QLineEdit::EchoMode(echMode));
    }
    void nativeLineEditSetFrame(long ptr, bool b)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setFrame(b);
    }
    void nativeLineEditSetInputMask(long ptr, const char *inputMask)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setInputMask(QString(inputMask));
    }
    void nativeLineEditSetMaxLength(long ptr, int length)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setMaxLength(length);
    }
    void nativeLineEditSetModified(long ptr, bool b)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setModified(b);
    }
    void nativeLineEditSetPlaceholderText(long ptr, const char *ch)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setPlaceholderText(QString(ch));
    }
    void nativeLineEditSetReadOnly(long ptr, bool b)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setReadOnly(b);
    }
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
#ifndef QT_NO_VALIDATOR
    void nativeLineEditSetValidator(long ptr, const long varPtr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QValidator *varObj = reinterpret_cast<QValidator *>(static_cast<uintptr_t>(varPtr));
        return lineEditObj->setValidator(varObj);
    }
#endif
    char *nativeLineEditText(long ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QString str = lineEditObj->text();
        QByteArray ba = str.toUtf8();
        return ba.data();
    }
    long nativeLineEditTextMargins(long ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QMargins margins = lineEditObj->textMargins();
        QMargins *pMargins = new QMargins(margins);
        return reinterpret_cast<long>(pMargins);
    }
#ifndef QT_NO_VALIDATOR
    long nativeLineEditValidator(long ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        const QValidator *v = lineEditObj->validator();
        return reinterpret_cast<long>(v);
    }
#endif
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
    // Public Slots
    void nativeLineEditClear(long ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->clear();
    }
#ifndef QT_NO_CLIPBOARD
    void nativeLineEditCopy(long ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->copy();
    }
    void nativeLineEditCut(long ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->cut();
    }
    void nativeLineEditPaste(long ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->paste();
    }
#endif
    void nativeLineEditRedo(long ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->redo();
    }
    void nativeLineEditUndo(long ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->undo();
    }
    void nativeLineEditSelectAll(long ptr)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->selectAll();
    }
    void nativeLineEditSetText(long ptr, const char *ch)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        return lineEditObj->setText(QString(ch));
    }
    // Signals Function
    void nativeLineEditConnectCursorPositionChanged(long ptr, long code, nativeConnectCallbackIntInt callback)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QObject::connect(lineEditObj, &QLineEdit::cursorPositionChanged, [=](int oldPos, int newPos)
                         { callback(code, oldPos, newPos); });
    }
    void nativeLineEditConnectEditingFinished(long ptr, long code, nativeConnectCallback callback)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QObject::connect(lineEditObj, &QLineEdit::editingFinished, [=]()
                         { callback(code); });
    }
    void nativeLineEditConnectInputRejected(long ptr, long code, nativeConnectCallback callback)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QObject::connect(lineEditObj, &QLineEdit::inputRejected, [=]()
                         { callback(code); });
    }
    void nativeLineEditConnectReturnPressed(long ptr, long code, nativeConnectCallback callback)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QObject::connect(lineEditObj, &QLineEdit::returnPressed, [=]()
                         { callback(code); });
    }
    void nativeLineEditConnectSelectionChanged(long ptr, long code, nativeConnectCallback callback)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QObject::connect(lineEditObj, &QLineEdit::selectionChanged, [=]()
                         { callback(code); });
    }
    void nativeLineEditConnectTextChanged(long ptr, long code, nativeConnectCallbackChar callback)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QObject::connect(lineEditObj, &QLineEdit::textChanged, [=](QString text)
                         {QByteArray ba=text.toUtf8() ; callback(code,ba.data()); });
    }
    void nativeLineEditConnectTextEdited(long ptr, long code, nativeConnectCallbackChar callback)
    {
        QLineEdit *lineEditObj = reinterpret_cast<QLineEdit *>(static_cast<uintptr_t>(ptr));
        QObject::connect(lineEditObj, &QLineEdit::textEdited, [=](const QString text)
                         {QByteArray ba=text.toUtf8() ; callback(code,ba.data()); });
    }
}
