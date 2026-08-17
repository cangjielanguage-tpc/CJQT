package qqmusic

import cjqt.core.*
import cjqt.gui.*
import cjqt.widgets.*

// 仿参考项目 VolumeTool：音量调节浮层（白色圆角面板 + 垂直滑块 + 静音按钮）
public class VolumeTool <: QWidget {
    let volumeSlider: QSlider
    let silenceBtn: QPushButton
    var volumeHandler: (Int64) -> Unit = { v => () }
    var muteHandler: (Bool) -> Unit = { m => () }
    var muted = false

    public init() {
        volumeSlider = QSlider()
        volumeSlider.setRange(0, 100)
        volumeSlider.setValue(80)
        volumeSlider.setStyleSheet(
            "QSlider::groove:vertical { width: 6px; background: #E3E3E3; border-radius: 3px; } QSlider::handle:vertical { height: 14px; margin: 0 -4px; border-radius: 7px; background: #1ECD97; } QSlider::sub-page:vertical { background: #1ECD97; border-radius: 3px; }")
        silenceBtn = QPushButton("静音")
        silenceBtn.setFixedSize(96, 40)
        silenceBtn.setStyleSheet(
            "QPushButton { color: #333333; background-color: #F0F0F0; border: none; border-radius: 6px; } QPushButton:hover { background-color: #E0E0E0; }")

        setFixedSize(120, 320)
        setStyleSheet("QWidget { background-color: #FFFFFF; border-radius: 8px; }")
        let layout = QVBoxLayout(parent: this)
        layout.setContentsMargins(12, 16, 12, 12)
        layout.setSpacing(8)
        layout.addWidget(volumeSlider)
        layout.addWidget(silenceBtn)

        silenceBtn.clicked.connect() {
            d => toggleMute()
        }
    }

    public func setVolumeHandler(handler: (Int64) -> Unit) {
        volumeHandler = handler
    }

    public func setMuteHandler(handler: (Bool) -> Unit) {
        muteHandler = handler
    }

    public func toggleMute() {
        muted = !muted
        silenceBtn.setText(if (muted) { "取消静音" } else { "静音" })
        muteHandler(muted)
    }

    public func setMuted(muted: Bool) {
        this.muted = muted
        silenceBtn.setText(if (muted) { "取消静音" } else { "静音" })
    }
}
