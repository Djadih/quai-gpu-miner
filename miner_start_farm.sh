#!/bin/bash

# Check if the miner_num environment variable is set
if [[ -z "$1" ]]; then
    echo "Please set the miner_num environment variable."
    exit 1
fi

# Create a single session if it doesn't exist
SESSION="miner_session"
tmux has-session -t $SESSION 2>/dev/null
if [ $? != 0 ]; then
    tmux new-session -d -s $SESSION
fi

miner_path="/home/user/quai-gpu-miner/build/ethcoreminer/ethcoreminer"

# Function to run the miner with log
run_miner() {
    local region="$1"
    local zone="$2"
    local cmd="$miner_path -G -P stratum://$3:$4"
    local window_name="miner_${region}_${zone}"
    
    # Create a new window and run the command
    tmux new-window -t $SESSION -n "$window_name" "$cmd"
    sleep 5
}

if [[ "$1" == "00" ]]; then
    run_miner 0 0 34.136.202.179 30000
    # run_miner 0 0 34.133.84.195 30000

elif [[ "$1" == "01" ]]; then
    run_miner 0 1 34.136.202.179 30001
    # run_miner 0 1 34.133.84.195 30001

elif [[ "$1" == "02" ]]; then
    run_miner 0 2 34.136.202.179 30002
    # run_miner 0 2 34.133.84.195 30002

elif [[ "$1" == "10" ]]; then
    run_miner 1 0 34.136.202.179 30003
    # run_miner 1 0 34.133.84.195 30003

elif [[ "$1" == "11" ]]; then
    run_miner 1 1 34.136.202.179 30004
    # run_miner 1 1 34.133.84.195 30004

elif [[ "$1" == "12" ]]; then
    run_miner 1 2 34.136.202.179 30005
    # run_miner 1 2 34.133.84.195 30005

elif [[ "$1" == "20" ]]; then
    run_miner 2 0 34.136.202.179 30006
    # run_miner 2 0 34.133.84.195 30006

elif [[ "$1" == "21" ]]; then
    run_miner 2 1 34.136.202.179 30007
    # run_miner 2 1 34.133.84.195 30007

elif [[ "$1" == "22" ]]; then
    run_miner 1 2 34.136.202.179 30008
    # run_miner 2 2 34.133.84.195 30008

else
    echo "Invalid miner_num value"
fi
