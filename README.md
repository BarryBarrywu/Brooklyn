**Brooklyn is not actively maintained, as it doesn’t generate income to justify the time investment. If you need a bug fixed, feel free to contact the author via email to discuss having it resolved for a fee.**

> 📖 [中文说明](#中文说明-)

![](https://github.com/pedrommcarrasco/Brooklyn/blob/master/Design/logo.jpg?raw=true)

> Screen Saver by [Pedro Carrasco](https://twitter.com/pedrommcarrasco) based on the animations presented during **[Apple Special Event](https://www.youtube.com/watch?v=bfHEnw6Rm-4)** (October 30, 2018) from the Brooklyn Academy of Music, Howard Gilman Opera House.

<p align="center">
    <img src="https://github.com/pedrommcarrasco/Brooklyn/blob/master/Design/showcase.gif?raw=true" alt="Example"/>
</p>

![GitHub All Releases](https://img.shields.io/github/downloads/pedrommcarrasco/brooklyn/total.svg) [![Build Status](https://travis-ci.org/pedrommcarrasco/Brooklyn.svg?branch=master)](https://travis-ci.org/pedrommcarrasco/Brooklyn) ![GitHub contributors](https://img.shields.io/github/contributors/pedrommcarrasco/brooklyn.svg) [![apm](https://img.shields.io/apm/l/vim-mode.svg)](https://github.com/pedrommcarrasco/Brooklyn/blob/master/LICENSE)

## Features ✅

* Doesn't require internet connection
* Homebrew support
* Light & Dark theme
* Select which animations you want to see
* Loop each animation how many times you want
* Make the animations' order random

<p align="center">
    <img src="https://github.com/pedrommcarrasco/Brooklyn/blob/master/Design/preferenceMenu.png?raw=true" alt="Example"/>
</p>

## Installation 📦

Independently of how you install **Brooklyn**, please **close your System Preferences**.

Screen savers can be set programmatically with this Terminal command :

```shell
defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Brooklyn path "$HOME/Library/Screen Savers/Brooklyn.saver"
```

### Manual :hand:

1. [Click here to Download](https://github.com/pedrommcarrasco/Brooklyn/releases/download/2.1.0/Brooklyn.saver.zip)
2. Open **Brooklyn.saver** (double click)
3. `"Brooklyn.saver" can't be opened because it is from an unidentified developer` will appear, press `OK`
4. Open `Preferences`
5. Select `Security & Privacy`
6. Select `General`
7. On the bottom side, select `Open Anyway`

### Homebrew 🍺

1. Open terminal
2. Enter `brew install --cask brooklyn --no-quarantine`

## Uninstallation 🗑️

### Manual :hand:

- Right-click on Brooklyn in System Preferences and select `Delete Brooklyn`, or
- Delete `Brooklyn.saver` either in `/Library/Screen Savers` or `/Users/USERNAME/Library/Screen Savers`. 

### Homebrew 🍺

1. Open terminal
2. Enter `brew uninstall --cask brooklyn`

## Compatibility 🔧

Requires OS X El Capitan (10.11) or above.

## Troubleshooting 🤕

The Brooklyn screen saver can be blocked by the system as a malicious software. Sometimes on macOS Big Sur clicking `Open Anyway` in `Security & Privacy` is not fixing the issue.  

To bypass this quarantine made by apple, you can use this command in your terminal :

```shell
sudo xattr -d com.apple.quarantine ~/"Library/Screen Savers/Brooklyn.saver"
```

## Support Brooklyn ❤️

Hello there 👋

I’m Pedro, a Portuguese iOS Engineer since February 2017. I’m an avid OSS enthusiast and contributor - help by sharing, learn by what’s shared.

I've built and open-sourced multiple frameworks and applications, including **[Brooklyn](https://github.com/pedrommcarrasco/Brooklyn)** and **[CocoaHub](https://cocoahub.app)**.

I'm also a conference and meetup organizer, being part of **[SwiftAveiro](https://swiftaveiro.xyz)** and **[CocoaHeads Porto](https://www.meetup.com/CocoaHeads-Porto/)**.

If you enjoy my work and would like to help me continue it, please consider:
* https://github.com/users/pedrommcarrasco/sponsorship
* https://www.buymeacoffee.com/pedrommcarrasco
* https://www.paypal.me/pedrommcarrasco


## Contributing  🙌 

Feel free to contribute to this project by providing [ideas](https://github.com/pedrommcarrasco/Brooklyn/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc) or opening [pull requests](https://github.com/pedrommcarrasco/Brooklyn/pulls?q=is%3Apr+is%3Aopen+sort%3Aupdated-desc) with new features or solving an existing issue.

## License ⛔

Brooklyn's available under the MIT license. See the [LICENSE](https://github.com/pedrommcarrasco/Brooklyn/blob/master/LICENSE) file for more information. Logo & original animations are Apple's property.

## Acknowledgements 🙏

Bug fixes and improvements in this fork were developed with the assistance of [Claude](https://claude.ai) (AI by Anthropic).

---

## 中文说明 🇨🇳

### 简介

**Brooklyn** 是一款 macOS 屏保，灵感来源于 **[2018年10月30日苹果特别发布会](https://www.youtube.com/watch?v=bfHEnw6Rm-4)**（纽约布鲁克林音乐学院 Howard Gilman 歌剧院）上展示的动画。原作者：[Pedro Carrasco](https://twitter.com/pedrommcarrasco)。

### 功能 ✅

* 无需网络连接
* 支持 Homebrew 安装
* 支持浅色 / 深色主题
* 可自由选择要播放的动画
* 可设置每个动画的循环次数
* 支持随机播放顺序

### 安装 📦

安装前请先**关闭系统偏好设置**。

安装完成后，可用以下终端命令将 Brooklyn 设为默认屏保：

```shell
defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Brooklyn path "$HOME/Library/Screen Savers/Brooklyn.saver"
```

#### 手动安装 :hand:

1. 从 [Releases](https://github.com/answer24/Brooklyn/releases) 页面下载最新版 `Brooklyn.saver.zip`，或自行编译
2. 双击打开 `Brooklyn.saver`
3. 若弹出"无法打开，因为它来自身份不明的开发者"，点击`好`
4. 打开`系统偏好设置` → `安全性与隐私` → `通用`
5. 点击底部的`仍要打开`

#### Homebrew 🍺

```shell
brew install --cask brooklyn --no-quarantine
```

### 卸载 🗑️

#### 手动卸载 :hand:

- 在系统偏好设置中右键点击 Brooklyn，选择`删除 Brooklyn`，或
- 手动删除 `/Library/Screen Savers/Brooklyn.saver` 或 `~/Library/Screen Savers/Brooklyn.saver`

#### Homebrew 🍺

```shell
brew uninstall --cask brooklyn
```

### 系统要求 🔧

需要 macOS 10.13 (High Sierra) 或更高版本。

### 常见问题 🤕

若系统将 Brooklyn 识别为恶意软件而无法打开，可在终端运行以下命令解除隔离：

```shell
sudo xattr -d com.apple.quarantine ~/"Library/Screen Savers/Brooklyn.saver"
```

### 本 Fork 的改动

* **修复队列无限增长导致长时间运行后 CPU/内存占用飙高的问题**：原代码用 `object: nil` 监听 `AVPlayerItemDidPlayToEndTime` 通知，导致每个播放器实例都会收到其他实例的通知（如预览窗口 + 主屏幕、多显示器），每次收到通知都往队列末尾插入新 item，队列随时间无限增长。修复方法：用 `Set<ObjectIdentifier>` 追踪本实例的 item，只响应属于自己的通知。
* **移除多余的 30fps 计时器**：`animateOneFrame()` 从未被覆写，该计时器每秒空触发 30 次，纯属浪费 CPU。

### 许可证 ⛔

Brooklyn 基于 MIT 许可证。Logo 及原始动画版权归 Apple 所有。
