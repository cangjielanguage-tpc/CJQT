package qt.core

//C
foreign func nativeEventCreate(eventType: Int32): Int64
foreign func nativeEventDelete(ptr: Int64): Unit
foreign func nativeEventAccept(ptr: Int64): Unit
foreign func nativeEventIgnore(ptr: Int64): Unit
foreign func nativeEventIsAccepted(ptr: Int64): Bool
foreign func nativeEventSetAccepted(ptr: Int64, accepted: Bool): Unit
foreign func nativeEventSpontaneous(ptr: Int64): Bool
foreign func nativeEventType(ptr: Int64): Int32
foreign func nativeEventRegisterEventType(hint: Int32): Int32

public enum QEventType {
    | None // invalid event
    | Timer // timer event
    | MouseButtonPress // mouse button pressed
    | MouseButtonRelease // mouse button released
    | MouseButtonDblClick // mouse button double click
    | MouseMove // mouse move
    | KeyPress // key pressed
    | KeyRelease // key released
    | FocusIn // keyboard focus received
    | FocusOut // keyboard focus lost
    | FocusAboutToChange // keyboard focus is about to be lost
    | Enter // mouse enters widget
    | Leave // mouse leaves widget
    | Paint // paint widget
    | Move // move widget
    | Resize // resize widget
    | Create // after widget creation
    | Destroy // during widget destruction
    | Show // widget is shown
    | Hide // widget is hidden
    | Close // request to close widget
    | Quit // request to quit application
    | ParentChange // widget has been reparented
    | ParentAboutToChange // sent just before the parent change is done
    | ThreadChange // object has changed threads
    | WindowActivate // window was activated
    | WindowDeactivate // window was deactivated
    | ShowToParent // widget is shown to parent
    | HideToParent // widget is hidden to parent
    | Wheel // wheel event
    | WindowTitleChange // window title changed
    | WindowIconChange // icon changed
    | ApplicationWindowIconChange // application icon changed
    | ApplicationFontChange // application font changed
    | ApplicationLayoutDirectionChange // application layout direction changed
    | ApplicationPaletteChange // application palette changed
    | PaletteChange // widget palette changed
    | Clipboard // internal clipboard event
    | Speech // reserved for speech input
    | MetaCall // meta call event
    | SockAct // socket activation
    | WinEventAct // win event activation
    | DeferredDelete // deferred delete event
    | DragEnter // drag moves into widget
    | DragMove // drag moves in widget
    | DragLeave // drag leaves or is cancelled
    | Drop // actual drop
    | DragResponse // drag accepted/rejected
    | ChildAdded // new child widget
    | ChildPolished // polished child widget
    | ChildRemoved // deleted child widget
    | ShowWindowRequest // widget's window should be mapped
    | PolishRequest // widget should be polished
    | Polish // widget is polished
    | LayoutRequest // widget should be relayouted
    | UpdateRequest // widget should be repainted
    | UpdateLater // request update() later
    | EmbeddingControl // ActiveX embedding
    | ActivateControl // ActiveX activation
    | DeactivateControl // ActiveX deactivation
    | ContextMenu // context popup menu
    | InputMethod // input method
    | TabletMove // Wacom tablet event
    | LocaleChange // the system locale changed
    | LanguageChange // the application language changed
    | LayoutDirectionChange // the layout direction changed
    | Style // internal style event
    | TabletPress // tablet press
    | TabletRelease // tablet release
    | OkRequest // CE (Ok) button pressed
    | HelpRequest // CE (?)  button pressed
    | IconDrag // proxy icon dragged
    | FontChange // font has changed
    | EnabledChange // enabled state has changed
    | ActivationChange // window activation has changed
    | StyleChange // style has changed
    | IconTextChange // icon text has changed.  Deprecated.
    | ModifiedChange // modified state has changed
    | MouseTrackingChange // mouse tracking state has changed
    | WindowBlocked // window is about to be blocked modally
    | WindowUnblocked // windows modal blocking has ended
    | WindowStateChange
    | ReadOnlyChange // readonly state has changed
    | ToolTip
    | WhatsThis
    | StatusTip
    | ActionChanged
    | ActionAdded
    | ActionRemoved
    | FileOpen // file open request
    | Shortcut // shortcut triggered
    | ShortcutOverride // shortcut override request
    | WhatsThisClicked
    | ToolBarChange // toolbar visibility toggled
    | ApplicationActivate // deprecated. Use ApplicationStateChange instead.
    | ApplicationActivated // deprecated
    | ApplicationDeactivate // deprecated. Use ApplicationStateChange instead.
    | ApplicationDeactivated // deprecated
    | QueryWhatsThis // query what's this widget help
    | EnterWhatsThisMode
    | LeaveWhatsThisMode
    | ZOrderChange // child widget has had its z-order changed
    | HoverEnter // mouse cursor enters a hover widget
    | HoverLeave // mouse cursor leaves a hover widget
    | HoverMove // mouse cursor move inside a hover widget   

    public func value(): Int32 {
        match (this) {
            case None => 0 // invalid event
            case Timer => 1 // timer event
            case MouseButtonPress => 2 // mouse button pressed
            case MouseButtonRelease => 3 // mouse button released
            case MouseButtonDblClick => 4 // mouse button double click
            case MouseMove => 5 // mouse move
            case KeyPress => 6 // key pressed
            case KeyRelease => 7 // key released
            case FocusIn => 8 // keyboard focus received
            case FocusOut => 9 // keyboard focus lost
            case FocusAboutToChange => 23 // keyboard focus is about to be lost
            case Enter => 10 // mouse enters widget
            case Leave => 11 // mouse leaves widget
            case Paint => 12 // paint widget
            case Move => 13 // move widget
            case Resize => 14 // resize widget
            case Create => 15 // after widget creation
            case Destroy => 16 // during widget destruction
            case Show => 17 // widget is shown
            case Hide => 18 // widget is hidden
            case Close => 19 // request to close widget
            case Quit => 20 // request to quit application
            case ParentChange => 21 // widget has been reparented
            case ParentAboutToChange => 131 // sent just before the parent change is done
            case ThreadChange => 22 // object has changed threads
            case WindowActivate => 24 // window was activated
            case WindowDeactivate => 25 // window was deactivated
            case ShowToParent => 26 // widget is shown to parent
            case HideToParent => 27 // widget is hidden to parent
            case Wheel => 31 // wheel event
            case WindowTitleChange => 33 // window title changed
            case WindowIconChange => 34 // icon changed
            case ApplicationWindowIconChange => 35 // application icon changed
            case ApplicationFontChange => 36 // application font changed
            case ApplicationLayoutDirectionChange => 37 // application layout direction changed
            case ApplicationPaletteChange => 38 // application palette changed
            case PaletteChange => 39 // widget palette changed
            case Clipboard => 40 // internal clipboard event
            case Speech => 42 // reserved for speech input
            case MetaCall => 43 // meta call event
            case SockAct => 50 // socket activation
            case WinEventAct => 132 // win event activation
            case DeferredDelete => 52 // deferred delete event
            case DragEnter => 60 // drag moves into widget
            case DragMove => 61 // drag moves in widget
            case DragLeave => 62 // drag leaves or is cancelled
            case Drop => 63 // actual drop
            case DragResponse => 64 // drag accepted/rejected
            case ChildAdded => 68 // new child widget
            case ChildPolished => 69 // polished child widget
            case ChildRemoved => 71 // deleted child widget
            case ShowWindowRequest => 73 // widget's window should be mapped
            case PolishRequest => 74 // widget should be polished
            case Polish => 75 // widget is polished
            case LayoutRequest => 76 // widget should be relayouted
            case UpdateRequest => 77 // widget should be repainted
            case UpdateLater => 78 // request update() later
            case EmbeddingControl => 79 // ActiveX embedding
            case ActivateControl => 80 // ActiveX activation
            case DeactivateControl => 81 // ActiveX deactivation
            case ContextMenu => 82 // context popup menu
            case InputMethod => 83 // input method
            case TabletMove => 87 // Wacom tablet event
            case LocaleChange => 88 // the system locale changed
            case LanguageChange => 89 // the application language changed
            case LayoutDirectionChange => 90 // the layout direction changed
            case Style => 91 // internal style event
            case TabletPress => 92 // tablet press
            case TabletRelease => 93 // tablet release
            case OkRequest => 94 // CE (Ok) button pressed
            case HelpRequest => 95 // CE (?)  button pressed
            case IconDrag => 96 // proxy icon dragged
            case FontChange => 97 // font has changed
            case EnabledChange => 98 // enabled state has changed
            case ActivationChange => 99 // window activation has changed
            case StyleChange => 100 // style has changed
            case IconTextChange => 101 // icon text has changed.  Deprecated.
            case ModifiedChange => 102 // modified state has changed
            case MouseTrackingChange => 109 // mouse tracking state has changed
            case WindowBlocked => 103 // window is about to be blocked modally
            case WindowUnblocked => 104 // windows modal blocking has ended
            case WindowStateChange => 105
            case ReadOnlyChange => 106 // readonly state has changed
            case ToolTip => 110
            case WhatsThis => 111
            case StatusTip => 112
            case ActionChanged => 113
            case ActionAdded => 114
            case ActionRemoved => 115
            case FileOpen => 116 // file open request
            case Shortcut => 117 // shortcut triggered
            case ShortcutOverride => 51 // shortcut override request
            case WhatsThisClicked => 118
            case ToolBarChange => 120 // toolbar visibility toggled
            case ApplicationActivate => 121 // deprecated. Use ApplicationStateChange instead.
            case ApplicationActivated => ApplicationActivate.value() // deprecated
            case ApplicationDeactivate => 122 // deprecated. Use ApplicationStateChange instead.
            case ApplicationDeactivated => ApplicationDeactivate.value() // deprecated
            case QueryWhatsThis => 123 // query what's this widget help
            case EnterWhatsThisMode => 124
            case LeaveWhatsThisMode => 125
            case ZOrderChange => 126 // child widget has had its z-order changed
            case HoverEnter => 127 // mouse cursor enters a hover widget
            case HoverLeave => 128 // mouse cursor leaves a hover widget
            case HoverMove => 129 // mouse cursor move inside a hover widget   
        }
    }

    public static func convert(eventTYpe: Int32): QEventType {
        match (eventTYpe) {
            case 0 => None // invalid event
            case 1 => Timer // timer event
            case 2 => MouseButtonPress // mouse button pressed
            case 3 => MouseButtonRelease // mouse button released
            case 4 => MouseButtonDblClick // mouse button double click
            case 5 => MouseMove // mouse move
            case 6 => KeyPress // key pressed
            case 7 => KeyRelease // key released
            case 8 => FocusIn // keyboard focus received
            case 9 => FocusOut // keyboard focus lost
            case 23 => FocusAboutToChange // keyboard focus is about to be lost
            case 10 => Enter // mouse enters widget
            case 11 => Leave // mouse leaves widget
            case 12 => Paint // paint widget
            case 13 => Move // move widget
            case 14 => Resize // resize widget
            case 15 => Create // after widget creation
            case 16 => Destroy // during widget destruction
            case 17 => Show // widget is shown
            case 18 => Hide // widget is hidden
            case 19 => Close // request to close widget
            case 20 => Quit // request to quit application
            case 21 => ParentChange // widget has been reparented
            case 131 => ParentAboutToChange // sent just before the parent change is done
            case 22 => ThreadChange // object has changed threads
            case 24 => WindowActivate // window was activated
            case 25 => WindowDeactivate // window was deactivated
            case 26 => ShowToParent // widget is shown to parent
            case 27 => HideToParent // widget is hidden to parent
            case 31 => Wheel // wheel event
            case 33 => WindowTitleChange // window title changed
            case 34 => WindowIconChange // icon changed
            case 35 => ApplicationWindowIconChange // application icon changed
            case 36 => ApplicationFontChange // application font changed
            case 37 => ApplicationLayoutDirectionChange // application layout direction changed
            case 38 => ApplicationPaletteChange // application palette changed
            case 39 => PaletteChange // widget palette changed
            case 40 => Clipboard // internal clipboard event
            case 42 => Speech // reserved for speech input
            case 43 => MetaCall // meta call event
            case 50 => SockAct // socket activation
            case 132 => WinEventAct // win event activation
            case 52 => DeferredDelete // deferred delete event
            case 60 => DragEnter // drag moves into widget
            case 61 => DragMove // drag moves in widget
            case 62 => DragLeave // drag leaves or is cancelled
            case 63 => Drop // actual drop
            case 64 => DragResponse // drag accepted/rejected
            case 68 => ChildAdded // new child widget
            case 69 => ChildPolished // polished child widget
            case 71 => ChildRemoved // deleted child widget
            case 73 => ShowWindowRequest // widget's window should be mapped
            case 74 => PolishRequest // widget should be polished
            case 75 => Polish // widget is polished
            case 76 => LayoutRequest // widget should be relayouted
            case 77 => UpdateRequest // widget should be repainted
            case 78 => UpdateLater // request update() later
            case 79 => EmbeddingControl // ActiveX embedding
            case 80 => ActivateControl // ActiveX activation
            case 81 => DeactivateControl // ActiveX deactivation
            case 82 => ContextMenu // context popup menu
            case 83 => InputMethod // input method
            case 87 => TabletMove // Wacom tablet event
            case 88 => LocaleChange // the system locale changed
            case 89 => LanguageChange // the application language changed
            case 90 => LayoutDirectionChange // the layout direction changed
            case 91 => Style // internal style event
            case 92 => TabletPress // tablet press
            case 93 => TabletRelease // tablet release
            case 94 => OkRequest // CE (Ok) button pressed
            case 95 => HelpRequest // CE (?)  button pressed
            case 96 => IconDrag // proxy icon dragged
            case 97 => FontChange // font has changed
            case 98 => EnabledChange // enabled state has changed
            case 99 => ActivationChange // window activation has changed
            case 100 => StyleChange // style has changed
            case 101 => IconTextChange // icon text has changed.  Deprecated.
            case 102 => ModifiedChange // modified state has changed
            case 109 => MouseTrackingChange // mouse tracking state has changed
            case 103 => WindowBlocked // window is about to be blocked modally
            case 104 => WindowUnblocked // windows modal blocking has ended
            case 105 => WindowStateChange
            case 106 => ReadOnlyChange // readonly state has changed
            case 110 => ToolTip
            case 111 => WhatsThis
            case 112 => StatusTip
            case 113 => ActionChanged
            case 114 => ActionAdded
            case 115 => ActionRemoved
            case 116 => FileOpen // file open request
            case 117 => Shortcut // shortcut triggered
            case 51 => ShortcutOverride // shortcut override request
            case 118 => WhatsThisClicked
            case 120 => ToolBarChange // toolbar visibility toggled
            case 121 => ApplicationActivate // deprecated. Use ApplicationStateChange instead.

            //case ApplicationActivated => ApplicationActivate.value() // deprecated
            case 122 => ApplicationDeactivate // deprecated. Use ApplicationStateChange instead.

            //case ApplicationDeactivated => ApplicationDeactivate.value() // deprecated
            case 123 => QueryWhatsThis // query what's this widget help
            case 124 => EnterWhatsThisMode
            case 125 => LeaveWhatsThisMode
            case 126 => ZOrderChange // child widget has had its z-order changed
            case 127 => HoverEnter // mouse cursor enters a hover widget
            case 128 => HoverLeave // mouse cursor leaves a hover widget
            case 129 => HoverMove // mouse cursor move inside a hover widget   
            case _ => None
        }
    }
}

public open class QEvent {
    public let ptr: Int64
    public init(eventType: QEventType) {
        this.ptr = unsafe {
            nativeEventCreate(eventType.value())
        }
    }
    public init(ptr:Int64){
        this.ptr=ptr
    }
    public open func delete(): Unit {
        return unsafe {
            nativeEventDelete(this.ptr)
        }
    }
    public func accept(): Unit {
        return unsafe {
            nativeEventAccept(this.ptr)
        }
    }
    public func ignore(): Unit {
        return unsafe {
            nativeEventIgnore(this.ptr)
        }
    }
    public func isAccepted(): Bool {
        return unsafe {
            nativeEventIsAccepted(this.ptr)
        }
    }
    public func setAccepted(accepted: Bool): Unit {
        return unsafe {
            nativeEventSetAccepted(this.ptr, accepted)
        }
    }
    public func spontaneous(): Bool {
        return unsafe {
            nativeEventSpontaneous(this.ptr)
        }
    }
    public func eventType(): QEventType {
        let nType = unsafe {
            nativeEventType(this.ptr)
        }
        return QEventType.convert(nType)
    }
}
