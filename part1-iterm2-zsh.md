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
  - 安装：brew install zsh；
  - 说明：2019 开始，macOS 默认 shell 从 bash 切换到 zsh，该步骤可省略。 推荐阅读：[What is Zsh? Should You Use it?](https://linuxhandbook.com/why-zsh/#:~:text=Zsh%20is%20more%20powerful%20and,more%20advanced%20features%20shipped%20in.)介绍了为什么推荐使用 zsh，以及为什么从 2019 macOS 将默认的 shell 从 bash 切换到 zsh。
- oh-my-zsh
  - 说明：oh-my-zsh 是zsh 用于管理配置的轻量级框架。
  - 安装：sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  - 生效：
    - 重启 iTerm2；
    - 或执行 `source ~/.zshrc` 生效配置。
  - 主题
    - oh-my-zsh 自带主题，查看 [themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)。
    - 体验
      - 编写 `.zshrc`，更新 `ZSH_THEME="agnoster"`；
      - 执行 `source ~/.zshrc` 查看效果；
  - 主题扩展，可重新配置
    - 配置 powerlevel10k
    - 下载 git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    - 配置 `~/.zshrc`，主题切换为`ZSH_THEME="powerlevel10k"`，执行 `source ~/.zshrc` 生效配置。
    - 进入交互命令模式，自定义配置；
    - 重新配置命令，p10k configure
- 插件
  - git，内置插件
  - zsh-syntax-highlighting
    - 下载: git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  - zsh-autosuggestions
    - 下载：git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  - 配置：~/.zshrc
    - 自动补全：```bindkey '^_' autosuggest-accept```
    - 说明：
      - <Ctrl+/> 接受 auto-suggestion 的补全建议
    - 配置 ~/.zshrc，如下所示：
      - ```plugins=(git zsh-syntax-highlighting zsh-autosuggestion)```
  - 推荐：[awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins)，更多的插件与主题；

- 文件列表
  - 说明：ls 的替代方案 exa 或 colorls。
  - exa 安装：brew install exa
  - colorls 安装：sudo gem install colorls
- exa
  ```zsh
  if [ -x "$(command -v exa)" ]; then
  alias ls=exa
  fi
  ````
- colorls
  ```zsh
  if [ -x "$(command -v colorls)" ]; then
    alias ls="colorls"
    alias la="colorls -al"
  fi
  ```



