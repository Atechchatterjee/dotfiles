#!/bin/sh
tmux new-session -d
tmux rename 'dev'
tmux send-keys "cd ~/coding/ecommerce/ && nvim ." C-m
tmux new-window -n 'frontend' -c ~/coding/ecommerce/frontend
tmux send-keys "sudo systemctl start docker && sudo docker-compose up --build" C-m
tmux new-window -n 'backend' -c ~/coding/ecommerce/backend
tmux send-keys "sudo docker-compose up --build" C-m
tmux a -t dev
