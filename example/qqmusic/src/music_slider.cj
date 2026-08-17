package qqmusic

import cjqt.core.*
import cjqt.gui.*
import cjqt.widgets.*

// 仿参考项目 MusicSlider：自定义播放进度条
// 使用样式化的 QSlider 呈现（灰槽圆角、绿色滑块）
public class MusicSlider <: QWidget {
    let slider: QSlider

    public init() {
        slider = QSlider()
        slider.setRange(0, 100)
        setFixedHeight(30)
        setStyleSheet("QWidget { background-color: #F5F5F5; }")
        let layout = QVBoxLayout(parent: this)
        layout.setContentsMargins(8, 0, 8, 0)
        layout.setSpacing(0)
        slider.setValue(0)
        slider.setStyleSheet(
            "QSlider::groove:horizontal { height: 6px; background: #E3E3E3; border-radius: 3px; } QSlider::handle:horizontal { width: 14px; margin: -4px 0; border-radius: 7px; background: #1ECD97; } QSlider::sub-page:horizontal { background: #1ECD97; border-radius: 3px; }")
        layout.addWidget(slider)
    }

    public func setProgress(ratio: Float64) {
        let value = Int64(ratio * 100.0)
        slider.setValue(value)
    }

    public func value(): Int64 {
        return slider.value()
    }
}
