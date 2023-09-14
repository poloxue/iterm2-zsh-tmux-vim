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
  - 说明：效果演示时，通过命令演示 Tmux 的操作效果，实际使用时依据命令作用绑定到快捷键。
  - 会话：
    - 新建会话：```tmux new|new-session -s <session-name>```
    - 脱离会话：```tmux detach|detach-session -s <session-name>```
    - 连接会话：```tmux attach|attach-session -s <session-name>```
    - 查看会话：```tmux list|list-sessions ```
    - 退出会话：```tmux kill|kill-session -s <session-name>```
    - 切换会话：```tmux switch|switch-session -t <session-name>```
    - 重命名会话：```tmux rename|rename-session -t <session-name> <new-session-name>```
  - 窗格： 
    - 说明：如下是 pane 管理的常用命令。
    - 划分窗格：
      - 垂直分屏：```tmux split-window``` 
      - 水平分屏：```tmux split-window -h```
    - 窗格切换：
      - 向上切换：```tmux select-pane -U```
      - 向下切换：```tmux select-pane -D```
      - 向左切换：```tmux select-pane -L```
      - 向右切换：```tmux select-pane -R```
  - window 窗口：
    - 新建窗口：tmux new-window -n <window-name>
    - 
- Tmux 配置
  - 阅读：
  - 前缀键：唤起 tmux 快捷键模式；
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
    bind - split-window -v -c "#{pane_current_path}"
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
