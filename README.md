> 📖 [中文说明](#中文说明-)

![](https://github.com/pedrommcarrasco/Brooklyn/blob/master/Design/logo.jpg?raw=true)

> Screen Saver based on the animations presented during **[Apple Special Event](https://www.youtube.com/watch?v=bfHEnw6Rm-4)** (October 30, 2018) from the Brooklyn Academy of Music, Howard Gilman Opera House. Originally created by [Pedro Carrasco](https://github.com/pedrommcarrasco/Brooklyn).

<p align="center">
    <img src="https://github.com/pedrommcarrasco/Brooklyn/blob/master/Design/showcase.gif?raw=true" alt="Example"/>
</p>

![GitHub All Releases](https://img.shields.io/github/downloads/answer24/brooklyn/total.svg) [![apm](https://img.shields.io/apm/l/vim-mode.svg)](https://github.com/answer24/Brooklyn/blob/master/LICENSE)

## Features ✅

* Doesn't require internet connection
* Homebrew support
* Light & Dark theme
* Select which animations you want to see
* Loop each animation how many times you want
* Make the animations' order random

<p align="center">
    <img src="https://raw.githubusercontent.com/answer24/Brooklyn/master/Design/preferences.png" alt="Preferences"/>
</p>

## Installation 📦

Before installing, please **close System Settings**.

### Homebrew 🍺 (Recommended)

```shell
brew tap answer24/tap
brew install --cask answer24/tap/brooklyn
```

> ⚠️ `brew install --cask brooklyn` (without the tap) installs the original 2020 version and does **not** include bug fixes from this fork.

### Manual :hand:

1. Download the latest `Brooklyn.saver.zip` from [Releases](https://github.com/answer24/Brooklyn/releases)
2. Unzip and double-click `Brooklyn.saver`
3. If `"Brooklyn.saver" can't be opened because it is from an unidentified developer` appears, press `OK`
4. Open `System Settings` → `Privacy & Security` → click `Open Anyway`

You can also set Brooklyn as your screen saver via Terminal:

```shell
defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Brooklyn path "$HOME/Library/Screen Savers/Brooklyn.saver"
```

## Uninstallation 🗑️

- Right-click on Brooklyn in System Settings and select `Delete Brooklyn`, or
- Delete `~/Library/Screen Savers/Brooklyn.saver`

### Homebrew 🍺

```shell
brew uninstall --cask brooklyn
```

## Compatibility 🔧

Requires macOS 10.13 (High Sierra) or above.

## Troubleshooting 🤕

If macOS blocks the screen saver as unidentified software, run this in Terminal to remove the quarantine flag:

```shell
sudo xattr -d com.apple.quarantine ~/"Library/Screen Savers/Brooklyn.saver"
```

## Contributing 🙌

Feel free to contribute by opening [issues](https://github.com/answer24/Brooklyn/issues) or [pull requests](https://github.com/answer24/Brooklyn/pulls).

## License ⛔

Brooklyn is available under the MIT license. See the [LICENSE](https://github.com/answer24/Brooklyn/blob/master/LICENSE) file for more information. Logo & original animations are Apple's property.

## Acknowledgements 🙏

Bug fixes and improvements in this fork were developed with the assistance of [Claude](https://claude.ai) (AI by Anthropic).

---

## 中文说明 🇨🇳

### 简介

**Brooklyn** 是一款 macOS 屏保，灵感来源于 **[2018年10月30日苹果特别发布会](https://www.youtube.com/watch?v=bfHEnw6Rm-4)**（纽约布鲁克林音乐学院 Howard Gilman 歌剧院）上展示的动画。原作者：[Pedro Carrasco](https://github.com/pedrommcarrasco/Brooklyn)。

### 功能 ✅

* 无需网络连接
* 支持 Homebrew 安装
* 支持浅色 / 深色主题
* 可自由选择要播放的动画
* 可设置每个动画的循环次数
* 支持随机播放顺序

### 安装 📦

安装前请先**关闭系统设置**。

#### Homebrew（推荐）🍺

```shell
brew tap answer24/tap
brew install --cask answer24/tap/brooklyn
```

> ⚠️ `brew install --cask brooklyn`（不加 tap）安装的是原作者 2020 年的旧版本，**不包含本 fork 的 bug 修复**。

#### 手动安装 :hand:

1. 从 [Releases](https://github.com/answer24/Brooklyn/releases) 下载最新 `Brooklyn.saver.zip`，解压
2. 双击 `Brooklyn.saver`
3. 若弹出"无法打开，因为它来自身份不明的开发者"，点击`好`
4. 打开`系统设置` → `隐私与安全性`，点击底部的`仍要打开`

安装完成后，可用以下终端命令将 Brooklyn 设为默认屏保：

```shell
defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Brooklyn path "$HOME/Library/Screen Savers/Brooklyn.saver"
```

### 卸载 🗑️

- 在系统设置中右键点击 Brooklyn，选择`删除 Brooklyn`，或
- 手动删除 `~/Library/Screen Savers/Brooklyn.saver`

### 系统要求 🔧

需要 macOS 10.13 (High Sierra) 或更高版本。

### 常见问题 🤕

若系统将 Brooklyn 识别为恶意软件而无法打开，可在终端运行以下命令解除隔离：

```shell
sudo xattr -d com.apple.quarantine ~/"Library/Screen Savers/Brooklyn.saver"
```

### 本 Fork 的改动

* **修复队列无限增长导致长时间运行后 CPU/内存占用飙高的问题**：原代码用 `object: nil` 监听 `AVPlayerItemDidPlayToEndTime` 通知，导致每个播放器实例都会收到其他实例的通知，队列随时间无限增长。修复方法：用 `Set<ObjectIdentifier>` 追踪本实例的 item，只响应属于自己的通知。
* **移除多余的 30fps 计时器**：`animateOneFrame()` 从未被覆写，该计时器每秒空触发 30 次，纯属浪费 CPU。
* **视频压缩**：将全部 75 个动画从 H.264 重新编码为 H.265，安装包体积从 265MB 压缩至 40MB（减少约 85%）。

### 许可证 ⛔

Brooklyn 基于 MIT 许可证。Logo 及原始动画版权归 Apple 所有。
