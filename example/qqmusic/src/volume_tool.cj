package qqmusic

import cjqt.core.*
import cjqt.gui.*
import cjqt.widgets.*
import cjqt.tools.*

// 仿参考项目 VolumeTool：自定义绘制音量浮层
// 白色圆角面板 + 灰色槽线 + 绿色已调音量条 + 圆形滑块 + 百分比 + 静音按钮
// 窗口本体即为白色面板（Popup + 无边框），避免透明背景在无合成器环境显示为黑色
public class VolumeTool <: QWidget {
    let inLine: QFrame
    let outLine: QFrame
    let silderBtn: QPushButton
    let volumeRatioLabel: QLabel
    let silenceBtn: QPushButton
    var volumeRatio: Int64 = 20
    var muted = false
    var volumeHandler: (Int64) -> Unit = { v => () }
    var muteHandler: (Bool) -> Unit = { m => () }

    public init() {
        inLine = QFrame()
        outLine = QFrame()
        silderBtn = QPushButton()
        volumeRatioLabel = QLabel()
        silenceBtn = QPushButton()

        setWindowFlag(WindowType.Popup.value(), true)
        setWindowFlag(WindowType.FramelessWindowHint.value(), true)
        setFixedSize(100, 300)
        setStyleSheet(
            "QWidget { background-color: #FFFFFF; border-radius: 5px; border: 1px solid #D8D8D8; }")

        // 灰色槽线（面板内 y25 高180）
        inLine.setParent(this)
        inLine.setGeometry(48, 25, 4, 180)
        inLine.setStyleSheet("QFrame { background-color: #ECECEC; border: none; }")

        // 绿色已调音量条
        outLine.setParent(this)
        outLine.setStyleSheet("QFrame { background-color: #1ECC94; border: none; }")

        // 圆形滑块
        silderBtn.setParent(this)
        silderBtn.setFixedSize(14, 14)
        silderBtn.setStyleSheet("QPushButton { border-radius: 7px; background-color: #1ECC94; border: none; }")

        // 音量百分比
        volumeRatioLabel.setParent(this)
        volumeRatioLabel.setFixedHeight(30)
        volumeRatioLabel.setStyleSheet(
            "QLabel { color: #333333; font-size: 13px; qproperty-alignment: 'AlignCenter'; background: transparent; }")

        // 静音按钮（图标）
        silenceBtn.setParent(this)
        silenceBtn.setFixedSize(80, 45)
        silenceBtn.setStyleSheet(muteStyle())

        // 静音按钮/百分比位置
        silenceBtn.move(10, 235)
        volumeRatioLabel.setGeometry(10, 205, 80, 30)

        updateVolumeUI()
        setupMouse()

        silenceBtn.clicked.connect() {
            d => toggleMute()
        }
    }

    // 鼠标按下/拖动调节音量（仿参考项目 calcVolume，y范围25-205）
    func setupMouse() {
        setMousePressEvent() {
            e => handleVolumeEvent()
        }
        setMouseMoveEvent() {
            e => handleVolumeEvent()
        }
        setMouseReleaseEvent() {
            e => volumeHandler(volumeRatio)
        }
    }

    func handleVolumeEvent() {
        let pos = QCursor.pos()
        // 窗口全局y = 面板y（窗口即面板，无偏移）
        var y = Int64(pos.y) - globalY()
        if (y < 25) {
            y = 25
        }
        if (y > 205) {
            y = 205
        }
        let h = 205 - y
        outLine.setGeometry(48, Int32(y), 4, Int32(h))
        silderBtn.move(43, Int32(y - 7))
        volumeRatio = h * 100 / 180
        if (volumeRatio > 100) {
            volumeRatio = 100
        }
        volumeRatioLabel.setText("${volumeRatio}%")
        volumeHandler(volumeRatio)
    }

    func globalY(): Int64 {
        let p = mapToGlobal()
        return Int64(p.y)
    }

    func updateVolumeUI() {
        let h = volumeRatio * 180 / 100
        let y = 205 - h
        outLine.setGeometry(48, Int32(y), 4, Int32(h))
        silderBtn.move(43, Int32(y - 7))
        volumeRatioLabel.setText("${volumeRatio}%")
    }

    public func setVolumeHandler(handler: (Int64) -> Unit) {
        volumeHandler = handler
    }

    public func setMuteHandler(handler: (Bool) -> Unit) {
        muteHandler = handler
    }

    public func toggleMute() {
        muted = !muted
        silenceBtn.setStyleSheet(muteStyle())
        muteHandler(muted)
    }

    public func setMuted(muted: Bool) {
        this.muted = muted
        silenceBtn.setStyleSheet(muteStyle())
    }

    public func setVolume(v: Int64) {
        volumeRatio = v
        updateVolumeUI()
    }

    func muteStyle(): String {
        let icon = if (muted) { "images/silent.png" } else { "images/volumn.png" }
        return "QPushButton { border: none; background-image: url(${icon}); background-repeat: no-repeat; background-position: center center; } QPushButton:hover { background-color: #E0E0E0; }"
    }
}
