# QMultimedia 封装进度

> 适配版本：Cangjie 1.0.5 / Qt 5.14.2
>
> 统计说明：`▓` 表示已完成（满格 10 格为 100%），`░` 表示尚未移植。
> 每类均包含 native C 绑定（`native/src/multimedia/`）、仓颉封装（`src/multimedia/`，包 `cjqt.multimedia`）与单元测试。
> native 层通过 `Qt5::Multimedia` / `Qt5::MultimediaWidgets` 链接。

## 进度总览

| 分类 | 数量 |
| :--- | :--- |
| 已完成 | 11 |
| 未移植 | 30+（多为设备枚举/服务内部类） |

## 已完成

```
QMultimedia:

QAudioDeviceInfo          ▓▓▓▓▓▓▓▓▓▓         QAudioFormat              ▓▓▓▓▓▓▓▓▓▓
QAudioInput               ▓▓▓▓▓▓▓▓▓▓         QAudioOutput              ▓▓▓▓▓▓▓▓▓▓
QCamera                   ▓▓▓▓▓▓▓▓▓▓         QCameraInfo               ▓▓▓▓▓▓▓▓▓▓
QMediaContent             ▓▓▓▓▓▓▓▓▓▓         QMediaPlayer              ▓▓▓▓▓▓▓▓▓▓
QMediaPlaylist            ▓▓▓▓▓▓▓▓▓▓         QSound                    ▓▓▓▓▓▓▓▓▓▓
QVideoWidget              ▓▓▓▓▓▓▓▓▓▓
```

## 未移植

以下 QtMultimedia 类尚未移植（多为设备枚举/采集/控制内部类）：

```
QAudioBuffer             ░░░░░░░░░░         QAudioDecoder            ░░░░░░░░░░
QAudioEncoderSettings     ░░░░░░░░░░         QAudioProbe              ░░░░░░░░░░
QAudioRecorder            ░░░░░░░░░░         QCameraExposure          ░░░░░░░░░░
QCameraFlashControl       ░░░░░░░░░░         QCameraFocus             ░░░░░░░░░░
QCameraImageCapture       ░░░░░░░░░░         QCameraImageProcessing   ░░░░░░░░░░
QCameraInfo               ░░░░░░░░░░         QCameraViewfinderSettings░░░░░░░░░░
QMediaBindableInterface   ░░░░░░░░░░         QMediaMetaData           ░░░░░░░░░░
QMediaObject              ░░░░░░░░░░         QMediaPlayerControl      ░░░░░░░░░░
QMediaResource            ░░░░░░░░░░         QMediaService            ░░░░░░░░░░
QMediaServiceProvider     ░░░░░░░░░░         QMultimedia              ░░░░░░░░░░
QVideoSurfaceFormat       ░░░░░░░░░░         QAbstractVideoSurface    ░░░░░░░░░░
```

## 说明

- `QMediaMetaData` 在 Qt 5.14 中是命名空间（键常量为 `QString`），非类；元数据通过 `QMediaPlayer::metaData()/setMetaData()` 访问，尚未封装。
- `QSound` 在无音频后端（headless/offscreen）环境会阻塞，其自动化测试被跳过，但类接口已完整封装。
- 设备枚举（`QCameraInfo::availableCameras()`、`QAudioDeviceInfo::availableDevices()`）返回列表，因涉及 Qt 列表类型暂未封装；提供默认设备访问。
- 采集类（`QAudioRecorder`/`QCameraImageCapture`）、控制类（`QMediaPlayerControl`）等为内部/底层接口，后续按需移植。
