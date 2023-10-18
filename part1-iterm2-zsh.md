Lesson 1 - 安装 iTerm2 与配色

安装依赖: 
- 进入 Homebrew 官网：[brew.sh](https://brew.sh)。
- 安装命令：/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

iTerm2
- 说明：MacOS 默认终端是 Terminal，使用 iTerm2 替代。
- 安装
  - 方式一，官网下载 https://iterm2.com/。
  - 方式二，brew 命令 - brew install --cask iterm2

配色
- 说明：以 Material Design Colours 为例介绍如何设置。
- 安装
  - curl -Ls https://raw.githubusercontent.com/MartinSeeler/iterm2-material-design/master/material-design-colors.itermcolors > /tmp/material-design-colors.itermcolors && open /tmp/material-design-colors.itermcolors
- 配置：
  - 进入 iTerm2-> Settings 或通过 `CMD + ,` 进入 iTerm2 的 Preferences；
  - Profiles -> Profiles -> 'Colors' Tab；
  - 选择 Color Presets；
  - 从 Load Presets 选择 masterial-design-colors

其他配色：
- 安装 Snazzy
  - curl -Ls https://raw.githubusercontent.com/sindresorhus/iterm2-snazzy/main/Snazzy.itermcolors > /tmp/Snazzy.itermcolors && open /tmp/Snazzy.itermcolors
- 安装 Dracula:
  - curl -Ls https://raw.githubusercontent.com/dracula/iterm/master/Dracula.itermcolors > /tmp/Dracula.itermcolors && open /tmp/Dracula.itermcolors

Lesson 2 - 安装 zsh 和基于 oh-my-zsh 配置

zsh

- 安装：brew install zsh；
- 说明：2019 开始，macOS 默认 shell 从 bash 切换到 zsh，该步骤可省略。 推荐阅读：[What is Zsh? Should You Use it?](https://linuxhandbook.com/why-zsh/#:~:text=Zsh%20is%20more%20powerful%20and,more%20advanced%20features%20shipped%20in.)介绍了为什么推荐使用 zsh，以及为什么从 2019 macOS 将默认的 shell 从 bash 切换到 zsh。

oh-my-zsh
- 说明：oh-my-zsh 是zsh 用于管理配置的轻量级框架。
- 安装：sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
- 生效：
  - 重启 iTerm2；
  - 或执行 `source ~/.zshrc`
  - 即可生效配置。
- 主题
  - oh-my-zsh 自带主题，查看 [themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)。
  - 体验
    - 编写 `.zshrc`，更新 `ZSH_THEME="agnoster"`；
    - 执行 `source ~/.zshrc` 查看效果；

配置插件
- 内置插件
  - 文档仓库：https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
  - git，内置插件
  - web-search，搜索引擎搜索；
  - jsontools，用于处理 json 数据；
  - z，目录快速跳转；
  - vi-mode，使用 vi 模式编辑命令行；
- 三方插件：
  - 安装：
    ```zsh
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    ```
  - zsh-syntax-highlighting
  - zsh-autosuggestions
- 配置：~/.zshrc
  - 配置插件： 
    ```zsh
    plugins=(git web-search jsontools z vi-mode zsh-syntax-highlighting zsh-autosuggestion)
    ```
  - 自动补全：
  ```zsh
   bindkey '^_' autosuggest-accept```
  - 说明：
    - <Ctrl+/> 接受 auto-suggestion 的补全建议
- 推荐：[awesome-zsh-plugins](https://github.com/unixorn/awesome-zsh-plugins)，更多的插件与主题；

Lesson 3 更多插件+powerlevel10k 主题扩展

- 插件配置：`plugins=(git web-search jsontools z copypath copyfile copybuffer vi-mode zsh-syntax-highlighting zsh-autosugggestions zsh-history-substring-search)`
- 内置插件
  - [copypath](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copypath)
    - copypath: 拷贝当前路径；
    - copypath <文件或目录>：拷贝指定文件或目录的绝对路径；
  - [copyfile](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copyfile)
    - 拷贝文件内容，命令格式 copyfile <文件路径>
  - [copybuffer](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copybuffer)
    - 通过 CTRL+o 拷贝命令行内容；
    - 注意与 vi-mode 存在冲突；
- 三方插件
  - [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
    - 方向键
      - bindkey '^[[A' history-substring-search-up
      - bindkey '^[[B' history-substring-search-down
    - CTRL+P/N
      - bindkey '^p' history-substring-search-up
      - bindkey '^n' history-substring-search-down
    - Vim 模式
      - bindkey -M vicmd 'k' history-substring-search-up
      - bindkey -M vicmd 'j' history-substring-search-up
  - [you-should-use]https://github.com/MichaelAquilina/zsh-you-should-use()
    - 用途：用于提醒使用者，如果使用的命令存在命令，提示推荐使用的别名；

Lesson 4 - powerlevel10k 主题扩展和 ls 命令的替代方案

powerlevel10k 主题扩展
- 终端字体：
  - [NerdFont 文档](https://github.com/ryanoasis/nerd-fonts#font-installation)
  - Homebrew 安装
    - brew tap homebrew/cask-fonts
    - brew install font-hack-nerd-font
- 下载 git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
- 配置 `~/.zshrc`
  - 将 zsh 提示符主题切换为 `ZSH_THEME="powerlevel10k"`
  - 执行 `source ~/.zshrc` 生效配置。
  - 重新配置：p10k configure 启动配置
- 配置向导：
  - 回答问题;
    - 钻石？
    - 锁？
    - Debian 图标？
  - 提示符风格：
    - Lean
    - Classic
    - Rainbow
    - Pure
  - 字符编码
    - Unicode
    - ASCII
  - 时间显示
    - No
    - 24 小时制
    - 12 小时制
  - 提示分隔符
    - 箭头 > 
    - 垂直 |
    - 倾斜 /
    - 圆弧 )
  - 提示头部
    - 箭头
    - 模糊
    - 倾斜
    - 圆弧
  - 提示尾部
    - 平整
    - 模糊
    - 箭头
    - 倾斜
    - 圆弧
  - 提示符高度
    - 一行
    - 两行
  - 提示符间隙
    - 紧凑
    - 稀疏
  - 图标
    - 少图标
    - 多图标
  - 提示符流
    - 简洁
    - 流畅
  - 启用瞬间提示
    - 是
    - 否
  - 即时提示模式
    - 关闭
    - 静默启用
    - 启用
- 手动配置
  - .p10k.zsh
  - 配置左右提示信息

文件列表
- 说明：ls 的替代方案 exa 或 colorls。
- [exa](https://github.com/ogham/exa):
  - 安装：brew install exa
- colorls 安装：sudo gem install colorls
- 替代 ls
  ```zsh
  if [ -x "$(command -v exa)" ]; then
    alias ls=exa --icons
  fi
  ````
- colorls
  ```zsh
  if [ -x "$(command -v colorls)" ]; then
    alias ls="colorls"
    alias la="colorls -al"
  fi
  ```
