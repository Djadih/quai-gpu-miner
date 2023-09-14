#!/bin/bash

# Check if the miner_num environment variable is set
if [[ -z "$miner_num+x" ]]; then
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

if [[ "$miner_num" -eq 00 ]]; then
    run_miner 0 0 35.202.3.128 30000
    run_miner 0 0 34.116.200.79 30000
    run_miner 0 0 34.118.89.65 30000
    run_miner 0 0 34.88.250.196 30000

elif [[ "$miner_num" -eq 01 ]]; then
    run_miner 0 1 35.202.3.128 30001
    run_miner 0 1 35.228.92.203 30000
    run_miner 0 1 34.175.128.153 30000
    run_miner 0 1 34.175.253.187 30000

elif [[ "$miner_num" -eq 02 ]]; then
    run_miner 0 2 35.202.3.128 30002
    run_miner 0 2 34.22.168.90 30000
    run_miner 0 2 34.105.226.94 30000
    run_miner 0 2 34.159.234.183 30000

elif [[ "$miner_num" -eq 10 ]]; then
    run_miner 1 0 35.202.3.128 30003
    run_miner 1 0 34.141.128.236 30000
    run_miner 1 0 34.65.157.67 30000
    run_miner 1 0 34.65.158.39 30000

elif [[ "$miner_num" -eq 11 ]]; then
    run_miner 1 1 35.202.3.128 30004
    run_miner 1 1 34.154.18.35 30000
    run_miner 1 1 34.134.77.179 30000
    run_miner 1 1 34.31.198.16 30000

elif [[ "$miner_num" -eq 12 ]]; then
    run_miner 1 2 35.202.3.128 30005
    run_miner 1 2 35.223.20.105 30000
    run_miner 1 2 104.196.30.82 30000
    run_miner 1 2 34.75.153.202 30000

elif [[ "$miner_num" -eq 20 ]]; then
    run_miner 2 0 35.202.3.128 30006
    run_miner 2 0 35.243.138.151 30000
    run_miner 2 0 34.86.74.158 30000
    run_miner 2 0 35.245.105.2 30000

elif [[ "$miner_num" -eq 21 ]]; then
    run_miner 2 1 35.202.3.128 30007
    run_miner 2 1 35.227.184.88 30000
    run_miner 2 1 34.83.171.78 30000
    run_miner 2 1 34.94.87.123 30000

elif [[ "$miner_num" -eq 22 ]]; then
    run_miner 2 2 35.202.3.128 30008
    run_miner 2 2 34.94.245.103 30000
    run_miner 2 2 34.106.213.164 30000
    run_miner 2 2 34.106.152.11 30000

else
    echo "Invalid miner_num value"
fi

