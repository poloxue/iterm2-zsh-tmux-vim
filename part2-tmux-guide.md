- 说明：Tmux 是什么？终端复用器。
- 文档：[Tmux official documentation](https://github.com/tmux/tmux/wiki)
- 安装：
  ```zsh
  brew install tmux
  ```
- 版本：
  ```zsh
  tmux -V
  ```
- 概念: 会话（session）-> 窗口（window） -> 窗格（pane）
- 使用：
  - session 会话：
    - 新建会话：```tmux new -t <session-name>```
    - 脱离会话：```tmux detach -t <session-name>```
    - 连接会话：```tmux attach -t <session-name>```
    - 查看会话：
      - 在 tmux 应用下；
      - 查看 sessions（会话列表）：prefix-key + s
      - 选择 session：hjkl 选择，<cr> enter 选择会话；
  - window 窗口：
    - 新建窗口：tmux new-window -n <window-name>
    - 

- 基础配置
  - 配置文件 ~/.tmux.conf。
  - 配置 terminal：
    ```tmux
    set -g default-terminal "screen-256color"
    set-window-option -g xterm-keys on
    ````
  - 重置前缀键：
    ```tmux
    unbind C-b
    set -g prefix C-a
    bind-key C-a send-prefix
    ```
  - 分屏设置：
    ```tmux
    # 水平分屏
    unbind %
    bind | split-window -h -c "#{pane_current_path}"
    # 垂直分屏
    unbind '"'
    bind - split-window -v -v "#{pane_current_path}"
    ```
  - 快捷键
    ```tmux
    unbind r
    bind r source-file ~/.tmux.conf
    ```
  - 窗格大小调节
    ```tmux
    bind -r j resize-pane -D 5
    bind -r k resize-pane -U 5
    bind -r l resize-pane -R 5
    bind -r h resize-pane -L 5
    bind -r m resize-pane -Z
    ```
  - 拷贝模式下使用 vi 键位：
    ```tmux
    set-window-option -g mode-keys vi
    ```
  - 拷贝模式下，使用 v 键选择区域，y 键执行拷贝。
    ```tmux
    bind-key -T copy-mode-vi 'v' send -X begin-selection
    bind-key -T copy-mode-vi 'y' send -X copy-selection
    # 鼠标选择拷贝
    unbind -T copy-mode-vi MouseDragEnd1Pane
    ```
  - 设置 ESC 退出响应时间，防止卡顿：
    ```tmux
    set -sg escape-time 0
    ```
- 插件配置
