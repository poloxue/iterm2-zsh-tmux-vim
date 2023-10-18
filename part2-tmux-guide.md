Lesson 1 安装与使用方法

说明：Tmux 是什么？终端复用器，实现会话与窗口的解绑。
文档：[Tmux official documentation](https://github.com/tmux/tmux/wiki)
安装：
  - Homebrew 安装：
  ```zsh
  brew install tmux
  ```
  - 查看版本：
  ```zsh
  tmux -V
  ```
概念: 会话（session）-> 窗口（window） -> 窗格（pane）
使用：
- 说明：效果演示时，通过命令演示 Tmux 的操作效果，实际使用时依据命令作用绑定到快捷键。
- 会话：
  - 命令：
    - 新建会话：```tmux new|new-session -s <session-name>```
    - 脱离会话：```tmux detach|detach-session -s <session-name>```
    - 连接会话：```tmux attach|attach-session -s <session-name>```
    - 查看会话：```tmux list|list-sessions ```
    - 退出会话：```tmux kill|kill-session -s <session-name>```
    - 切换会话：```tmux switch|switch-session -t <session-name>```
    - 重命名：```tmux rename|rename-session -t <session-name> <new-session-name>```
  - 快捷键
    - 待补充；
- 窗格： 
  - 说明：如下是 pane 管理的常用命令。
  - 命令：
    - 划分窗格：
      - 垂直分屏：```tmux split-window``` 
      - 水平分屏：```tmux split-window -h```
    - 窗格切换：
      - 向上切换：```tmux select-pane -U```
      - 向下切换：```tmux select-pane -D```
      - 向左切换：```tmux select-pane -L```
      - 向右切换：```tmux select-pane -R```
    - 窗格交换：
      - 窗格上移：```tmux swap-pane -U```
      - 窗格下移：```tmux swap-pane -U```
      - 特定窗格：```tmux swap-pane -t|-s```
  - 快捷键
    - 待补充
- window 窗口
  - 命令：
    - 新建窗口：tmux new-window -n <window-name>
    - 切换窗口：
      - 指定编号：tmux select-window -t <window-number>
      - 指定名称：tmux select-window -t <window-name>
    - 重命名：tmux rename-window -t <window-name> <new-window-name>
- 其他
  - 查看快捷键：```tmux list-keys```
  - 查看命令列表：```tmux list-commands```

Lesson 2 自由配置 Tmux 

- Tmux 配置
  - 阅读：https://www.hostinger.com/tutorials/tmux-config#:~:text=One%20of%20the%20most%20important,and%20then%20the%20wanted%20command.&text=Save%20the%20changes%20and%20start%20a%20new%20tmux%20session.
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
