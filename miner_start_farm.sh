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
    run_miner 0 0 35.184.84.143 30000
    run_miner 0 0 35.202.3.128 30000

elif [[ "$1" == "01" ]]; then
    run_miner 0 1 35.184.84.143 30001
    run_miner 0 1 35.202.3.128 30001

elif [[ "$1" == "02" ]]; then
    run_miner 0 2 35.184.84.143 30002
    run_miner 0 2 35.202.3.128 30002

elif [[ "$1" == "10" ]]; then
    run_miner 1 0 35.184.84.143 30003
    run_miner 1 0 35.202.3.128 30003

elif [[ "$1" == "11" ]]; then
    run_miner 1 1 35.184.84.143 30004
    run_miner 1 1 35.202.3.128 30004

elif [[ "$1" == "12" ]]; then
    run_miner 1 2 35.184.84.143 30005
    run_miner 1 2 35.202.3.128 30005

elif [[ "$1" == "20" ]]; then
    run_miner 2 0 35.184.84.143 30006
    run_miner 2 0 35.202.3.128 30006

elif [[ "$1" == "21" ]]; then
    run_miner 2 1 35.184.84.143 30007
    run_miner 2 1 35.202.3.128 30007

elif [[ "$1" == "22" ]]; then
    run_miner 1 2 35.184.84.143 30008
    run_miner 2 2 35.202.3.128 30008

else
    echo "Invalid miner_num value"
fi
