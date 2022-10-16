# Create session, if it doesn't exists, and attach to it.
tmux has-session -t development
if [ $? != 0  ]
then
  tmux new-session -s development -n editor -d
  tmux send-keys -t development 'vim' C-m
  tmux split-window -v -p 10 -t development
  tmux new-window -n console -t development
  tmux select-window -t development:1
fi
tmux attach -t development
