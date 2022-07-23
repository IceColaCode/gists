# create
tmux new -s session-name
# detach
tmux detach
Ctrl+b d
# ls
tmux ls
# attach
tmux attach -t session-name
# kill
tmux kill-session -t session-name
# 切换会话
tmux switch -t session-name
#划分左右两个窗格。
Ctrl+b %
#划分上下两个窗格。
Ctrl+b "
#移动到前一个窗格
Ctrl+b p
#移动到后一个窗格
Ctrl+b ;