#!/bin/bash

function tmux_refresh_colors_in_vim_panes {
  tmux source $HOME/.tmux.conf

  tmux_panes=$(tmux list-panes -a -F '#{session_name}:#{window_index}.#{pane_index} #{pane_current_command}' | grep vim$ | awk '{print $1}')

  for pane in $tmux_panes; do
    tmux send-keys -t $pane escape ENTER
    tmux send-keys -t $pane ':SetColorscheme' ENTER
  done
}

function toggle_appearance_mode {
  osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode'
}

toggle_appearance_mode
tmux_refresh_colors_in_vim_panes
