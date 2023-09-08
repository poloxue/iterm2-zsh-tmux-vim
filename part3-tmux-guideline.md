Tmux 是什么？终端复用器。

## 准备工作

安装命令:

```
$ brew install tmux
```

查看版本：

```bash
$ tmux -V
tmux 3.3a
````

## 基本概念

会话（session）-> 窗口（window）-> 窗格（pane）。

## 基础配置

配置文件 ~/.tmux.conf。

```tmux
set -g default-terminal "screen-256color"
set-window-option -g xterm-keys on
````

重置前缀键：

```tmux
unbind C-b
set -g prefix C-a
bind-key C-a send-prefix
```

分屏设置：

```tmux
# 水平分屏
unbind %
bind | split-window -h -c "#{pane_current_path}"

# 垂直分屏
unbind '"'
bind - split-window -v -v "#{pane_current_path}"
```

快捷键配置生效

```tmux
unbind r
bind r source-file ~/.tmux.conf
```

窗格大小调节

```tmux
bind -r j resize-pane -D 5
bind -r k resize-pane -U 5
bind -r l resize-pane -R 5
bind -r h resize-pane -L 5

bind -r m resize-pane -Z
```

拷贝模式下使用 vi 键位：

```tmux
set-window-option -g mode-keys vi
```

拷贝模式下，使用 v 键实现拷贝区域选择，y 键执行拷贝。

配置如下：

```tmux
bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'y' send -X copy-selection

# 鼠标选择拷贝
unbind -T copy-mode-vi MouseDragEnd1Pane
```

设置 ESC 时间，减少卡顿时间：

```tmux
set -sg escape-time 0
```

