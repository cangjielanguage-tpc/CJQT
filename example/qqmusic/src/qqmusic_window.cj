package qqmusic

import cjqt.core.*
import cjqt.gui.*
import cjqt.widgets.*
import cjqt.multimedia.*
import std.collection.*

public class QQMusicWindow <: QWidget {
    let library = MusicLibrary()
    let player: QMediaPlayer
    let playlist: QMediaPlaylist
    let stack: QStackedWidget
    let likePage: CommonPage
    let localPage: CommonPage
    let recentPage: CommonPage
    let musicSlider: MusicSlider
    let currentTimeLabel: QLabel
    let totalTimeLabel: QLabel
    let musicNameLabel: QLabel
    let musicSingerLabel: QLabel
    let playBtn: QPushButton
    let playModeBtn: QPushButton
    let volumeTool: VolumeTool
    let timer: QTimer
    let navAnimTimer: QTimer
    let navButtons = ArrayList<NavButton>()
    var playbackModeIndex = 0
    var isPlaying = false
    var currentSongIndex = -1
    var currentSongName = ""
    let musicDir = "musics"

    public init() {
        player = QMediaPlayer()
        playlist = QMediaPlaylist()
        stack = QStackedWidget()
        likePage = CommonPage()
        localPage = CommonPage()
        recentPage = CommonPage()
        musicSlider = MusicSlider()
        currentTimeLabel = QLabel()
        totalTimeLabel = QLabel()
        musicNameLabel = QLabel()
        musicSingerLabel = QLabel()
        playBtn = QPushButton()
        playModeBtn = QPushButton()
        volumeTool = VolumeTool()
        timer = QTimer(500, { => AnimGlobals.progressTick() })
        navAnimTimer = QTimer(120, { => AnimGlobals.navTick() })

        setWindowTitle("QQ音乐")
        setFixedSize(1044, 704)
        setStyleSheet("QWidget { background-color: #F5F5F5; }")

        let mainLayout = QVBoxLayout(parent: this)
        mainLayout.setContentsMargins(2, 2, 2, 2)
        mainLayout.setSpacing(0)
        mainLayout.addWidget(createHead())
        mainLayout.addWidget(createBody())

        player.setPlaylist(playlist)
        player.setVolume(80)
        volumeTool.hide()
        volumeTool.setVolumeHandler({ v => player.setVolume(v) })
        volumeTool.setMuteHandler({ m => player.setMuted(m) })

        timer.start()
        navAnimTimer.start()
        scanMusics()
    }

    // ---------- 顶部 ----------
    func createHead(): QWidget {
        let head = QWidget()
        head.setFixedHeight(80)
        let layout = QHBoxLayout(parent: head)
        layout.setContentsMargins(0, 0, 0, 0)
        layout.setSpacing(0)

        let headLeft = QWidget()
        headLeft.setFixedWidth(200)
        headLeft.setStyleSheet("QWidget { background-color: #F0F0F0; }")
        let logoLayout = QHBoxLayout(parent: headLeft)
        let logo = QLabel()
        logo.setFixedSize(180, 70)
        logo.setStyleSheet(
            "QLabel { background-image: url(images/Logo.png); background-repeat: no-repeat; background-position: center center; }")
        logoLayout.addWidget(logo)
        layout.addWidget(headLeft)

        let headRight = QWidget()
        headRight.setStyleSheet("QWidget { background-color: #F5F5F5; }")
        let rightLayout = QHBoxLayout(parent: headRight)
        rightLayout.setContentsMargins(20, 0, 12, 0)
        rightLayout.setSpacing(8)

        let search = QLineEdit()
        search.setPlaceholderText("搜索音乐、歌手、歌词")
        search.setFixedSize(280, 35)
        search.setStyleSheet(
            "QLineEdit { background-color: #E3E3E3; border: none; border-radius: 17px; padding-left: 17px; font-size: 13px; color: #666666; }")
        rightLayout.addWidget(search)
        rightLayout.addStretch(1)

        rightLayout.addWidget(makeIconButton("images/skin.png"))
        rightLayout.addWidget(makeIconButton("images/min.png"))
        rightLayout.addWidget(makeIconButton("images/max.png"))
        let quitBtn = makeIconButton("images/quit.png")
        quitBtn.clicked.connect() {
            d => QApplication.quit()
        }
        rightLayout.addWidget(quitBtn)
        layout.addWidget(headRight)
        return head
    }

    func makeIconButton(imagePath: String): QPushButton {
        let btn = QPushButton()
        btn.setFixedSize(30, 30)
        btn.setStyleSheet(
            "QPushButton { border: none; background-image: url(${imagePath}); background-repeat: no-repeat; background-position: center center; } QPushButton:hover { background-color: rgba(230, 230, 230, 0.8); }")
        return btn
    }

    // ---------- 主体 ----------
    func createBody(): QWidget {
        let body = QWidget()
        let layout = QHBoxLayout(parent: body)
        layout.setContentsMargins(0, 0, 0, 0)
        layout.setSpacing(0)
        layout.addWidget(createNav())
        layout.addWidget(createRightBody())
        return body
    }

    func createNav(): QWidget {
        let nav = QWidget()
        nav.setFixedWidth(200)
        nav.setStyleSheet("QWidget { background-color: #F0F0F0; }")
        let layout = QVBoxLayout(parent: nav)
        layout.setContentsMargins(0, 0, 0, 0)
        layout.setSpacing(0)

        let onlineBox = QWidget()
        let onlineLayout = QVBoxLayout(parent: onlineBox)
        onlineLayout.setContentsMargins(0, 10, 0, 0)
        onlineLayout.setSpacing(0)
        let onlineText = QLabel("在线音乐")
        onlineText.setFontSize(13)
        onlineText.setFontColor(QColor(120, 120, 120))
        onlineText.setFixedHeight(30)
        onlineLayout.addWidget(onlineText)
        onlineLayout.addWidget(makeNavButton("images/rec.png", "推荐", 0))
        onlineLayout.addWidget(makeNavButton("images/radio.png", "电台", 1))
        onlineLayout.addWidget(makeNavButton("images/music.png", "音乐馆", 2))
        layout.addWidget(onlineBox)

        let myBox = QWidget()
        let myLayout = QVBoxLayout(parent: myBox)
        myLayout.setContentsMargins(0, 10, 0, 0)
        myLayout.setSpacing(0)
        let myText = QLabel("我的音乐")
        myText.setFontSize(13)
        myText.setFontColor(QColor(120, 120, 120))
        myText.setFixedHeight(30)
        myLayout.addWidget(myText)
        myLayout.addWidget(makeNavButton("images/like.png", "我喜欢", 3))
        myLayout.addWidget(makeNavButton("images/local.png", "本地下载", 4))
        myLayout.addWidget(makeNavButton("images/recent.png", "最近播放", 5))
        layout.addWidget(myBox)
        layout.addStretch(1)
        return nav
    }

    func makeNavButton(iconPath: String, text: String, pageId: Int64): NavButton {
        let btn = NavButton(iconPath, text, pageId)
        btn.setClickHandler({ id => switchPage(id) })
        navButtons.add(btn)
        return btn
    }

    func createRightBody(): QWidget {
        let right = QWidget()
        right.setStyleSheet("QWidget { background-color: #F5F5F5; }")
        let layout = QVBoxLayout(parent: right)
        layout.setContentsMargins(0, 0, 0, 0)
        layout.setSpacing(0)

        let recPage = QWidget()
        let recLayout = QVBoxLayout(parent: recPage)
        recLayout.setContentsMargins(16, 12, 16, 12)
        recLayout.setSpacing(8)
        let recTitle = QLabel("今日为你推荐")
        recTitle.setFontSize(14)
        recTitle.setFontColor(QColor(51, 51, 51))
        recLayout.addWidget(recTitle)
        recLayout.addWidget(RecBox())
        recLayout.addSpacing(12)
        let supplyTitle = QLabel("你的音乐补给")
        supplyTitle.setFontSize(14)
        supplyTitle.setFontColor(QColor(51, 51, 51))
        recLayout.addWidget(supplyTitle)
        recLayout.addWidget(RecBox())
        recLayout.addStretch(1)
        stack.addWidget(recPage)

        stack.addWidget(makePlaceholderPage("电台"))
        stack.addWidget(makePlaceholderPage("音乐馆"))

        likePage.setPageTitle("我喜欢")
        localPage.setPageTitle("本地下载")
        recentPage.setPageTitle("最近播放")
        likePage.setPlayAllHandler({ => playAll() })
        localPage.setPlayAllHandler({ => playAll() })
        recentPage.setPlayAllHandler({ => playAll() })
        stack.addWidget(likePage)
        stack.addWidget(localPage)
        stack.addWidget(recentPage)

        stack.addWidget(makeLyricsPage())

        layout.addWidget(stack)
        layout.addWidget(musicSlider)
        layout.addWidget(createControlBar())
        return right
    }

    func makePlaceholderPage(title: String): QWidget {
        let page = QWidget()
        let layout = QVBoxLayout(parent: page)
        let label = QLabel("${title} 页面")
        label.setFontSize(24)
        label.setFontColor(QColor(150, 150, 150))
        layout.addWidget(label)
        return page
    }

    func makeLyricsPage(): QWidget {
        let page = QWidget()
        let layout = QVBoxLayout(parent: page)
        layout.setContentsMargins(20, 20, 20, 20)
        let lyrics = QLabel("歌词区域")
        lyrics.setFontSize(18)
        lyrics.setFontColor(QColor(51, 51, 51))
        layout.addWidget(lyrics)
        layout.addStretch(1)
        return page
    }

    // ---------- 底部控制栏 ----------
    func createControlBar(): QWidget {
        let control = QWidget()
        control.setFixedHeight(60)
        let layout = QHBoxLayout(parent: control)
        layout.setContentsMargins(10, 0, 10, 2)
        layout.setSpacing(6)

        let play1 = QWidget()
        let play1Layout = QHBoxLayout(parent: play1)
        play1Layout.setContentsMargins(0, 0, 0, 0)
        play1Layout.setSpacing(8)
        let cover = QLabel()
        cover.setFixedSize(60, 60)
        cover.setStyleSheet(
            "QLabel { background-image: url(images/default_cover.png); background-repeat: no-repeat; background-position: center center; }")
        play1Layout.addWidget(cover)
        let nameBox = QWidget()
        let nameLayout = QVBoxLayout(parent: nameBox)
        nameLayout.setContentsMargins(0, 0, 0, 0)
        nameLayout.setSpacing(2)
        musicNameLabel.setText("歌名")
        musicNameLabel.setFontSize(13)
        musicNameLabel.setFontColor(QColor(51, 51, 51))
        musicSingerLabel.setText("歌手")
        musicSingerLabel.setFontSize(11)
        musicSingerLabel.setFontColor(QColor(120, 120, 120))
        nameLayout.addWidget(musicNameLabel)
        nameLayout.addWidget(musicSingerLabel)
        play1Layout.addWidget(nameBox)
        layout.addWidget(play1)

        let play2 = QWidget()
        let play2Layout = QHBoxLayout(parent: play2)
        play2Layout.setContentsMargins(0, 0, 0, 0)
        play2Layout.setSpacing(4)

        playModeBtn.setFixedSize(30, 30)
        playModeBtn.setStyleSheet(iconStyle("images/order_play.png"))
        playModeBtn.clicked.connect() {
            d => switchPlaybackMode()
        }
        play2Layout.addWidget(playModeBtn)

        let upBtn = makeIconButton("images/up.png")
        upBtn.clicked.connect() {
            d => playPrevious()
        }
        play2Layout.addWidget(upBtn)

        playBtn.setFixedSize(30, 30)
        playBtn.setStyleSheet(iconStyle("images/play.png"))
        playBtn.clicked.connect() {
            d => togglePlay()
        }
        play2Layout.addWidget(playBtn)

        let downBtn = makeIconButton("images/down.png")
        downBtn.clicked.connect() {
            d => playNext()
        }
        play2Layout.addWidget(downBtn)

        let volBtn = makeIconButton("images/volumn.png")
        volBtn.clicked.connect() {
            d => toggleVolumeTool()
        }
        play2Layout.addWidget(volBtn)

        let addBtn = makeIconButton("images/add.png")
        addBtn.clicked.connect() {
            d => scanMusics()
        }
        play2Layout.addWidget(addBtn)
        layout.addWidget(play2)

        layout.addStretch(1)

        let play3 = QWidget()
        let play3Layout = QHBoxLayout(parent: play3)
        play3Layout.setContentsMargins(0, 0, 0, 0)
        play3Layout.setSpacing(2)
        currentTimeLabel.setText("00:00")
        currentTimeLabel.setFontSize(12)
        currentTimeLabel.setFontColor(QColor(120, 120, 120))
        play3Layout.addWidget(currentTimeLabel)
        let line = QLabel("/")
        line.setFontColor(QColor(180, 180, 180))
        play3Layout.addWidget(line)
        totalTimeLabel.setText("00:00")
        totalTimeLabel.setFontSize(12)
        totalTimeLabel.setFontColor(QColor(120, 120, 120))
        play3Layout.addWidget(totalTimeLabel)
        let lrcBtn = makeIconButton("images/ci.png")
        lrcBtn.clicked.connect() {
            d => switchPage(6)
        }
        play3Layout.addWidget(lrcBtn)
        layout.addWidget(play3)

        return control
    }

    // ---------- 逻辑 ----------
    public func tickNav() {
        var i = 0
        while (i < navButtons.size) {
            navButtons[i].tick()
            i += 1
        }
    }

    func switchPage(pageId: Int64) {
        stack.setCurrentIndex(Int64(pageId))
        var i = 0
        while (i < navButtons.size) {
            navButtons[i].setActive(Int64(i) == pageId)
            i += 1
        }
    }

    func toggleVolumeTool() {
        if (volumeTool.isVisible()) {
            volumeTool.hide()
        } else {
            volumeTool.show()
        }
    }

    func scanMusics() {
        library.scanDirectory(musicDir)
        localPage.clear()
        likePage.clear()
        recentPage.clear()
        var i = 0
        while (i < library.size()) {
            localPage.addMusic(library.at(i).name)
            likePage.addMusic(library.at(i).name)
            recentPage.addMusic(library.at(i).name)
            i += 1
        }
    }

    func playAll() {
        if (library.size() == 0) {
            return
        }
        playlist.clear()
        var i = 0
        while (i < library.size()) {
            playlist.addMedia(fileUrl(library.at(i).filePath))
            i += 1
        }
        playlist.setCurrentIndex(0)
        currentSongIndex = 0
        playCurrent()
    }

    func playCurrent() {
        if (currentSongIndex >= 0 && currentSongIndex < library.size()) {
            let music = library.at(currentSongIndex)
            currentSongName = music.name
            musicNameLabel.setText(music.name)
            musicSingerLabel.setText(parseSinger(music.name))
            player.play()
            isPlaying = true
            playBtn.setStyleSheet(iconStyle("images/play_on.png"))
        }
    }

    func togglePlay() {
        if (isPlaying) {
            player.pause()
            playBtn.setStyleSheet(iconStyle("images/play.png"))
            isPlaying = false
        } else {
            if (currentSongIndex < 0) {
                playAll()
            } else {
                player.play()
                playBtn.setStyleSheet(iconStyle("images/play_on.png"))
                isPlaying = true
            }
        }
    }

    func playNext() {
        if (playlist.mediaCount() == 0) {
            playAll()
            return
        }
        playlist.next()
        currentSongIndex = playlist.currentIndex()
        playCurrent()
    }

    func playPrevious() {
        if (playlist.mediaCount() == 0) {
            playAll()
            return
        }
        playlist.previous()
        currentSongIndex = playlist.currentIndex()
        playCurrent()
    }

    func switchPlaybackMode() {
        playbackModeIndex = (playbackModeIndex + 1) % 3
        let icons = ["images/order_play.png", "images/single_play.png", "images/shuffle.png"]
        playlist.setPlaybackMode(playbackModeEnum(playbackModeIndex))
        playModeBtn.setStyleSheet(iconStyle(icons[playbackModeIndex]))
    }

    func playbackModeEnum(index: Int64): QMediaPlaybackMode {
        return match (index) {
            case 0 => QMediaPlaybackMode.Sequential
            case 1 => QMediaPlaybackMode.CurrentItemInLoop
            case _ => QMediaPlaybackMode.Random
        }
    }

    public func updateProgress() {
        let duration = player.duration()
        let position = player.position()
        if (duration > 0) {
            musicSlider.setProgress(Float64(position) / Float64(duration))
        }
        currentTimeLabel.setText(formatTime(position))
        totalTimeLabel.setText(formatTime(duration))
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

    func parseSinger(name: String): String {
        let parts = name.split(" - ", removeEmpty: false)
        if (parts.size > 1) {
            return parts[1]
        }
        return "未知歌手"
    }

    func iconStyle(path: String): String {
        return "QPushButton { border: none; background-image: url(${path}); background-repeat: no-repeat; background-position: center center; } QPushButton:hover { background-color: rgba(220, 220, 220, 0.5); }"
    }

    public override func delete() {
        timer.delete()
        navAnimTimer.delete()
        super.delete()
    }
}
