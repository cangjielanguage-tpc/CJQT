package cjqt.multimedia

import cjqt.widgets.*
import std.unittest.*

@Test
public func testQMediaContent() {
    let content = QMediaContent("file:///tmp/test.mp3")
    @Assert(!content.isNull())
    @Assert(content.canonicalUrl().contains("test.mp3"))
    content.delete()
}

@Test
public func testQMediaPlayerBasics() {
    QApplication.create()
    let player = QMediaPlayer()
    @Assert(player.volume() >= 0)
    player.setVolume(50)
    @Assert(player.volume() == 50)
    player.setMuted(true)
    @Assert(player.isMuted())
    player.setMuted(false)
    @Assert(player.state().value() == QMediaPlayerState.StoppedState.value())
    player.stop()
    player.delete()
}

@Test
public func testQMediaPlaylist() {
    QApplication.create()
    let playlist = QMediaPlaylist()
    @Assert(playlist.addMedia("file:///tmp/a.mp3"))
    @Assert(playlist.addMedia("file:///tmp/b.mp3"))
    @Assert(playlist.mediaCount() == 2)
    playlist.setCurrentIndex(0)
    @Assert(playlist.currentIndex() == 0)
    playlist.next()
    @Assert(playlist.currentIndex() == 1)
    playlist.setPlaybackMode(QMediaPlaybackMode.Loop)
    @Assert(playlist.playbackMode().value() == QMediaPlaybackMode.Loop.value())
    playlist.clear()
    @Assert(playlist.mediaCount() == 0)
    playlist.delete()
}

@Test
public func testQAudioFormat() {
    let format = QAudioFormat()
    format.setSampleRate(44100)
    @Assert(format.sampleRate() == 44100)
    format.setChannelCount(2)
    @Assert(format.channelCount() == 2)
    format.setSampleSize(16)
    @Assert(format.sampleSize() == 16)
    format.delete()
}

@Test
public func testQAudioDeviceInfo() {
    QApplication.create()
    let output = QAudioDeviceInfo.defaultOutputDevice()
    @Assert(output.deviceName().size > 0)
    output.delete()
}


@Test
public func testQCameraInfo() {
    QApplication.create()
    let info = QCameraInfo.defaultCamera()
    @Assert(info.deviceName().size >= 0)
    info.delete()
}

@Test
public func testQCamera() {
    QApplication.create()
    let info = QCameraInfo.defaultCamera()
    let camera = QCamera(info)
    @Assert(camera.state() >= 0)
    camera.setCaptureMode(QCameraCaptureMode.CaptureStillImage)
    camera.stop()
    camera.delete()
    info.delete()
}

@Test
public func testQVideoWidget() {
    QApplication.create()
    let video = QVideoWidget()
    @Assert(!video.isFullScreen())
    video.setFullScreen(false)
    video.delete()
}
