- 安装依赖: 
  - 进入 Homebrew 官网：[brew.sh](https://brew.sh)。
  - 安装命令：/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
- iTerm2
  - 说明：MacOS 默认终端是 Terminal，使用 iTerm2 替代。
  - 安装
    - 方式一，官网下载 https://iterm2.com/。
    - 方式二，brew 命令 - brew install --cask iterm2
- 配色
  - 说明：以 Material Design Colours 为例介绍如何设置。
  - 安装
    - curl -Ls https://raw.githubusercontent.com/MartinSeeler/iterm2-material-design/master/material-design-colors.itermcolors > /tmp/material-design-colors.itermcolors && open /tmp/material-design-colors.itermcolors
  - 配置：
    - 进入 iTerm2-> Settings -> Profiles -> Profiles -> 'Colors' Tab
    - 选择 Color Presets
    - 从 Load Presets 选择 masterial-design-colors
  - 其他配色：
    - 安装 Snazzy
      - curl -Ls https://raw.githubusercontent.com/sindresorhus/iterm2-snazzy/main/Snazzy.itermcolors > /tmp/Snazzy.itermcolors && open /tmp/Snazzy.itermcolors
    - 安装 Dracula:
      - curl -Ls https://raw.githubusercontent.com/dracula/iterm/master/Dracula.itermcolors > /tmp/Dracula.itermcolors && open /tmp/Dracula.itermcolors
- zsh

安装命令：`brew install zsh`。注：2019 开始，macOS 默认 shell 从 bash 切换到 zsh.

推荐一篇文章：[What is Zsh? Should You Use it?](https://linuxhandbook.com/why-zsh/#:~:text=Zsh%20is%20more%20powerful%20and,more%20advanced%20features%20shipped%20in.)介绍了为什么推荐使用 zsh，以及为什么从 2019 macOS 将默认的 shell 从 bash 切换到 zsh。

# oh-my-zsh

oh-my-zsh 是zsh 用于管理配置的轻量级框架。

安装命令：

```zsh
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

安装完成，重启 iTerm2 或通过`source ~/.zshrc` 生效配置。

## 主题

oh-my-zsh 自带了很多主题，查看 [themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)。

**快速体验**

配置文件 `.zshrc`，更新 `ZSH_THEME="agnoster"`，执行 `source ~/.zshrc` 查看执行效果。

**配置 powerlevel10k**

从 github 下载 powerlevel10k:

```zsh
$ git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

配置 `~/.zshrc`，主题切换为`ZSH_THEME="powerlevel10k"`，执行 `source ~/.zshrc` 生效配置。

不同于其他主题，powerlevel10k 支持进一步自定义主题，效果图如下:

重新配置命令：

```zsh
p10k configure
```

**More**

[awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins)

## 插件

常用插件，(git zsh-syntax-highlighting zsh-autosuggestions)，git 是默认自带插件。我们安装下 zsh-autosugestions 和 zsh-syntax-highlighting。

```zsh
# download zsh-syntax-highlighting
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# download zsh-auto-suggestions
$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

配置 ~/.zshrc，如下所示：

```zsh
plugins=(git zsh-syntax-highlighting zsh-autosuggestion)
```

## 其它

ls 的替代方案 exa 或 colorls。

exa 安装命令：

```
$ brew install exa
```

colorls 安装命令：

```zsh
$ sudo gem install colorls
```

exa

```zsh
if [ -x "$(command -v exa)" ]; then
alias ls=exa
fi
````

或 colorls

```zsh
if [ -x "$(command -v colorls)" ]; then
  alias ls="colorls"
  alias la="colorls -al"
fi
```



