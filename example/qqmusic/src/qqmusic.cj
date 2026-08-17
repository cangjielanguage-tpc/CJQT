package qqmusic

import cjqt.core.*
import cjqt.gui.*
import cjqt.widgets.*
import cjqt.multimedia.*
import std.collection.*

public class QQMusicWindow <: QWidget {
    let library = MusicLibrary()
    let stack: QStackedWidget
    let musicListWidget: QListWidget
    let lyricsEdit: QTextEdit
    let statusLabel: QLabel
    let player: QMediaPlayer
    let playlist: QMediaPlaylist
    let progressSlider: QSlider
    let volumeSlider: QSlider
    let timeLabel: QLabel
    let playButton: QPushButton
    let modeButton: QPushButton
    let timer: QTimer
    var playbackModeIndex = 0
    var isPlaying = false
    let musicDir = "musics"

    public init() {
        stack = QStackedWidget()
        musicListWidget = QListWidget()
        lyricsEdit = QTextEdit()
        statusLabel = QLabel()
        player = QMediaPlayer()
        playlist = QMediaPlaylist()
        progressSlider = QSlider()
        volumeSlider = QSlider()
        timeLabel = QLabel()
        playButton = QPushButton()
        modeButton = QPushButton()
        timer = QTimer()

        setWindowTitle("QQ音乐 · 仓颉版")
        setFixedSize(900, 600)
        setStyleSheet(QQMusicStyle.MainStyle)

        let mainLayout = QVBoxLayout(parent: this)
        mainLayout.setContentsMargins(0, 0, 0, 0)
        mainLayout.setSpacing(0)

        mainLayout.addWidget(createHeadBar())
        mainLayout.addWidget(createBody())
        mainLayout.addWidget(createPlayerBar())

        player.setPlaylist(playlist)
        volumeSlider.setRange(0, 100)
        volumeSlider.setValue(80)
        player.setVolume(80)

        timer.start()

        scanMusics()
    }

    func createHeadBar(): QWidget {
        let head = QWidget()
        head.setFixedHeight(60)
        let layout = QHBoxLayout(parent: head)
        layout.setContentsMargins(16, 0, 16, 0)
        let title = QLabel("QQ音乐 · 仓颉版")
        title.setFontSize(20)
        title.setFontColor(QColor.White)
        layout.addWidget(title)
        layout.addStretch(1)
        let closeBtn = QPushButton("关闭")
        closeBtn.setFixedSize(70, 30)
        closeBtn.setStyleSheet(QQMusicStyle.CloseBtnStyle)
        closeBtn.clicked.connect() {
            d => QApplication.quit()
        }
        layout.addWidget(closeBtn)
        return head
    }

    func createBody(): QWidget {
        let body = QWidget()
        let layout = QHBoxLayout(parent: body)
        layout.setSpacing(0)
        layout.setContentsMargins(0, 0, 0, 0)
        layout.addWidget(createNavBar())
        layout.addWidget(stack)

        // 推荐页
        let recommend = QWidget()
        let recLayout = QVBoxLayout(parent: recommend)
        recLayout.setContentsMargins(24, 20, 24, 20)
        let recTitle = QLabel("推荐")
        recTitle.setFontSize(28)
        recTitle.setFontColor(QColor.White)
        recLayout.addWidget(recTitle)
        recLayout.addSpacing(24)
        let recCover = QLabel("🎵  点击左侧「本地音乐」，选择歌曲播放")
        recCover.setFontSize(18)
        recCover.setFontColor(QColor(200, 200, 200))
        recLayout.addWidget(recCover)
        recLayout.addSpacing(16)
        let recDesc = QLabel("QQMusic 仓颉版 · 基于 CJQT 库实现")
        recDesc.setFontSize(14)
        recDesc.setFontColor(QColor(150, 150, 150))
        recLayout.addWidget(recDesc)
        recLayout.addStretch(1)
        stack.addWidget(recommend)

        // 本地音乐页
        let localPage = QWidget()
        let localLayout = QVBoxLayout(parent: localPage)
        localLayout.setContentsMargins(24, 20, 24, 20)
        let localTitle = QLabel("本地音乐")
        localTitle.setFontSize(28)
        localTitle.setFontColor(QColor.White)
        localLayout.addWidget(localTitle)
        localLayout.addSpacing(8)
        musicListWidget.setStyleSheet(QQMusicStyle.ListStyle)
        localLayout.addWidget(musicListWidget)
        let playBtn = QPushButton("播放选中歌曲")
        playBtn.setFixedSize(150, 36)
        playBtn.setStyleSheet(QQMusicStyle.PlayBtnStyle)
        playBtn.clicked.connect() {
            d => playSelected()
        }
        localLayout.addSpacing(10)
        localLayout.addWidget(playBtn)
        stack.addWidget(localPage)

        // 歌词页
        let lrcPage = QWidget()
        let lrcLayout = QVBoxLayout(parent: lrcPage)
        lrcLayout.setContentsMargins(24, 20, 24, 20)
        let lrcTitle = QLabel("歌词")
        lrcTitle.setFontSize(28)
        lrcTitle.setFontColor(QColor.White)
        lrcLayout.addWidget(lrcTitle)
        lrcLayout.addSpacing(8)
        lyricsEdit.setReadOnly(true)
        lyricsEdit.setStyleSheet(QQMusicStyle.LrcStyle)
        lrcLayout.addWidget(lyricsEdit)
        stack.addWidget(lrcPage)

        return body
    }

    func createNavBar(): QWidget {
        let nav = QWidget()
        nav.setFixedWidth(160)
        let layout = QVBoxLayout(parent: nav)
        layout.setContentsMargins(12, 20, 12, 0)
        layout.setSpacing(8)
        let pages = ["推荐", "本地音乐", "歌词"]
        var i = 0
        while (i < pages.size) {
            let btn = QPushButton(pages[i])
            btn.setFixedHeight(40)
            btn.setStyleSheet(QQMusicStyle.NavBtnStyle)
            let pageIndex = i
            btn.clicked.connect() {
                d => switchPage(pageIndex)
            }
            layout.addWidget(btn)
            i += 1
        }
        layout.addStretch(1)
        return nav
    }

    func switchPage(index: Int64) {
        stack.setCurrentIndex(index)
    }

    func createPlayerBar(): QWidget {
        let bar = QWidget()
        bar.setFixedHeight(96)
        let layout = QVBoxLayout(parent: bar)
        layout.setContentsMargins(16, 6, 16, 8)
        layout.setSpacing(4)

        // 进度行
        let progressRow = QHBoxLayout()
        timeLabel.setText("00:00")
        timeLabel.setFontColor(QColor(200, 200, 200))
        timeLabel.setFixedWidth(50)
        progressRow.addWidget(timeLabel)
        progressSlider.setRange(0, 100)
        progressSlider.setValue(0)
        progressRow.addWidget(progressSlider)
        let totalLabel = QLabel("00:00")
        totalLabel.setFontColor(QColor(200, 200, 200))
        totalLabel.setFixedWidth(50)
        progressRow.addWidget(totalLabel)
        layout.addLayout(progressRow)

        // 控制行
        let controlRow = QHBoxLayout()
        controlRow.setSpacing(8)
        playButton.setText("▶ 播放")
        playButton.setFixedSize(96, 36)
        playButton.setStyleSheet(QQMusicStyle.PlayBtnStyle)
        playButton.clicked.connect() {
            d => togglePlay()
        }
        controlRow.addWidget(playButton)

        let prevBtn = QPushButton("⏮ 上一曲")
        prevBtn.setFixedSize(96, 36)
        prevBtn.setStyleSheet(QQMusicStyle.ControlBtnStyle)
        prevBtn.clicked.connect() {
            d => playPrevious()
        }
        controlRow.addWidget(prevBtn)

        let nextBtn = QPushButton("⏭ 下一曲")
        nextBtn.setFixedSize(96, 36)
        nextBtn.setStyleSheet(QQMusicStyle.ControlBtnStyle)
        nextBtn.clicked.connect() {
            d => playNext()
        }
        controlRow.addWidget(nextBtn)

        modeButton.setText("🔁 顺序播放")
        modeButton.setFixedSize(120, 36)
        modeButton.setStyleSheet(QQMusicStyle.ControlBtnStyle)
        modeButton.clicked.connect() {
            d => switchPlaybackMode()
        }
        controlRow.addWidget(modeButton)

        controlRow.addStretch(1)

        let volumeBtn = QPushButton("🔊")
        volumeBtn.setFixedSize(44, 36)
        volumeBtn.setStyleSheet(QQMusicStyle.ControlBtnStyle)
        volumeBtn.clicked.connect() {
            d => toggleMute()
        }
        controlRow.addWidget(volumeBtn)
        volumeSlider.setFixedWidth(120)
        controlRow.addWidget(volumeSlider)

        statusLabel.setFontColor(QColor(150, 150, 150))
        statusLabel.setFixedWidth(260)
        controlRow.addWidget(statusLabel)
        layout.addLayout(controlRow)
        return bar
    }

    func scanMusics() {
        library.scanDirectory(musicDir)
        musicListWidget.clear()
        var i = 0
        while (i < library.size()) {
            musicListWidget.addItem(library.at(i).name)
            i += 1
        }
        if (library.size() > 0) {
            statusLabel.setText("已加载 ${library.size()} 首歌曲")
        } else {
            statusLabel.setText("未找到音乐，请将 mp3 放入 musics 目录")
        }
    }

    func playSelected() {
        let index = musicListWidget.currentRow()
        if (index < 0 || index >= library.size()) {
            return
        }
        playMusicByIndex(index)
    }

    func playMusicByIndex(index: Int64) {
        let music = library.at(index)
        playlist.clear()
        var i = 0
        while (i < library.size()) {
            playlist.addMedia(fileUrl(library.at(i).filePath))
            i += 1
        }
        playlist.setCurrentIndex(index)
        player.play()
        isPlaying = true
        playButton.setText("⏸ 暂停")
        statusLabel.setText("正在播放：${music.name}")
        loadLyrics(music.name)
    }

    func togglePlay() {
        if (library.size() == 0) {
            return
        }
        if (isPlaying) {
            player.pause()
            playButton.setText("▶ 播放")
            isPlaying = false
        } else {
            player.play()
            playButton.setText("⏸ 暂停")
            isPlaying = true
        }
    }

    func playNext() {
        playlist.next()
        player.play()
        isPlaying = true
        playButton.setText("⏸ 暂停")
    }

    func playPrevious() {
        playlist.previous()
        player.play()
        isPlaying = true
        playButton.setText("⏸ 暂停")
    }

    func switchPlaybackMode() {
        playbackModeIndex = (playbackModeIndex + 1) % 4
        let modes = ["🔁 顺序播放", "🔂 单曲循环", "🔀 随机播放", "🔃 列表循环"]
        playlist.setPlaybackMode(playbackModeEnum(playbackModeIndex))
        modeButton.setText(modes[playbackModeIndex])
    }

    func playbackModeEnum(index: Int64): QMediaPlaybackMode {
        return match (index) {
            case 0 => QMediaPlaybackMode.Sequential
            case 1 => QMediaPlaybackMode.CurrentItemInLoop
            case 2 => QMediaPlaybackMode.Random
            case _ => QMediaPlaybackMode.Loop
        }
    }

    func toggleMute() {
        player.setMuted(!player.isMuted())
    }

    func updateProgress() {
        let duration = player.duration()
        let position = player.position()
        if (duration > 0) {
            let percent = position * 100 / duration
            progressSlider.setValue(percent)
        }
        timeLabel.setText(formatTime(position))
    }

    func formatTime(ms: Int64): String {
        let totalSeconds = ms / 1000
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        let mm = if (minutes < 10) { "0${minutes}" } else { "${minutes}" }
        let ss = if (seconds < 10) { "0${seconds}" } else { "${seconds}" }
        return "${mm}:${ss}"
    }

    func fileUrl(path: String): String {
        return "file://${path}"
    }

    func loadLyrics(songName: String) {
        let base = songName.removeSuffix(".mp3")
        let lrcPath = "${musicDir}/${base}.lrc"
        if (QFile.existsPath(lrcPath)) {
            let file = QFile(lrcPath)
            if (file.open(QIODeviceOpenMode.ReadOnly)) {
                lyricsEdit.setText(file.readAll())
                file.close()
            }
            file.delete()
        } else {
            lyricsEdit.setText("暂无歌词")
        }
    }
}

public class QQMusicStyle {
    public static let MainStyle = """
        QWidget {
            background-color: #1f1f1f;
        }
        QLabel {
            color: #ffffff;
        }
    """
    public static let NavBtnStyle = """
        QPushButton {
            color: #cfcfcf;
            background-color: transparent;
            border: none;
            font-size: 14px;
            text-align: left;
            padding-left: 12px;
        }
        QPushButton:hover {
            background-color: #2c2c2c;
            color: #ffffff;
        }
    """
    public static let CloseBtnStyle = """
        QPushButton {
            color: #ffffff;
            background-color: #c62f2f;
            border: none;
            border-radius: 4px;
        }
        QPushButton:hover {
            background-color: #e04545;
        }
    """
    public static let PlayBtnStyle = """
        QPushButton {
            color: #ffffff;
            background-color: #31c27c;
            border: none;
            border-radius: 6px;
            font-size: 14px;
        }
        QPushButton:hover {
            background-color: #3dd690;
        }
    """
    public static let ControlBtnStyle = """
        QPushButton {
            color: #cfcfcf;
            background-color: #2c2c2c;
            border: none;
            border-radius: 6px;
            font-size: 13px;
        }
        QPushButton:hover {
            background-color: #3a3a3a;
            color: #ffffff;
        }
    """
    public static let ListStyle = """
        QListWidget {
            background-color: #262626;
            color: #e0e0e0;
            border: none;
            border-radius: 6px;
            font-size: 14px;
        }
        QListWidget::item {
            padding: 6px;
        }
        QListWidget::item:selected {
            background-color: #31c27c;
            color: #ffffff;
        }
        QListWidget::item:hover {
            background-color: #333333;
        }
    """
    public static let LrcStyle = """
        QTextEdit {
            background-color: #262626;
            color: #e8e8e8;
            border: none;
            border-radius: 6px;
            font-size: 15px;
        }
    """
}
