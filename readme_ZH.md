一个系列：iTerm2, Tmux, VIM，打造一套高效的工作环境。

# 为什么?

- 抛弃鼠标;
- 提升效率；

# Homebrew

官网下载：[brew.sh](https://brew.sh)，安装命令：

```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

# iTerm2

MacOS 默认终端是 Terminal，替换为 iTerm2

## 安装

第一种方式，官网下载 https://iterm2.com/。

第二种方式，Homebrew

```bash
$ brew install --cask iterm2
```

## 配色

以 Material Design Colours 为实例介绍如何设置。

1. 下载安装: $ curl -Ls https://raw.githubusercontent.com/MartinSeeler/iterm2-material-design/master/material-design-colors.itermcolors > /tmp/material-design-colors.itermcolors && open /tmp/material-design-colors.itermcolors

2. 选择 iTerm2-> Settings -> Profiles -> Profiles -> 'Colors' Tab
3. 点击 Color Presets
4. 从 Load Presets 选择 masterial-design-colors

其他配色：

- Snazzy: curl -Ls https://raw.githubusercontent.com/sindresorhus/iterm2-snazzy/main/Snazzy.itermcolors > /tmp/Snazzy.itermcolors && open /tmp/Snazzy.itermcolors
- Dracula: curl -Ls https://raw.githubusercontent.com/dracula/iterm/master/Dracula.itermcolors > /tmp/Dracula.itermcolors && open /tmp/Dracula.itermcolors

# zsh

安装命令：

```bash
$ brew install zsh
```

# oh-my-zsh

安装命令：

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

