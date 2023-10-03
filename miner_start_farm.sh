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
    run_miner 0 0 35.224.101.46 30000
#   run_miner 0 0 35.184.84.143 30000
    run_miner 0 0 35.202.3.128 30000
#    run_miner 0 0 34.118.127.135 30000
#    run_miner 0 0 34.116.155.66 30000
#    run_miner 0 0 35.228.20.92 30000

elif [[ "$1" == "01" ]]; then
    run_miner 0 1 35.224.101.46 30001
#   run_miner 0 1 35.184.84.143 30001
    run_miner 0 1 35.202.3.128 30001
#    run_miner 0 1 35.228.126.31 30000
#    run_miner 0 1 34.140.232.84 30000
#    run_miner 0 1 34.140.177.148 30000

elif [[ "$1" == "02" ]]; then
    run_miner 0 2 35.224.101.46 30002
#   run_miner 0 2 35.184.84.143 30002
    run_miner 0 2 35.202.3.128 30002
#    run_miner 0 2 35.234.144.205 30000
#    run_miner 0 2 35.246.203.28 30000
#    run_miner 0 2 34.34.2.93 30000

elif [[ "$1" == "10" ]]; then
    run_miner 1 0 35.224.101.46 30003
#   run_miner 1 0 35.184.84.143 30003
    run_miner 1 0 35.202.3.128 30003
#    run_miner 1 0 35.234.169.55 30000
#    run_miner 1 0 34.34.52.226 30000
#    run_miner 1 0 34.65.39.251 30000

elif [[ "$1" == "11" ]]; then
    run_miner 1 1 35.224.101.46 30004
#   run_miner 1 1 35.184.84.143 30004
    run_miner 1 1 35.202.3.128 30004
#    run_miner 1 1 34.65.18.243 30000
#    run_miner 1 1 34.30.225.22 30000
#    run_miner 1 1 34.41.158.27 30000

elif [[ "$1" == "12" ]]; then
    run_miner 1 2 35.224.101.46 30005
#   run_miner 1 2 35.184.84.143 30005
    run_miner 1 2 35.202.3.128 30005
#    run_miner 1 2 34.133.31.200 30000
#    run_miner 1 2 34.148.193.67 30000
#    run_miner 1 2 34.148.186.134 30000

elif [[ "$1" == "20" ]]; then
    run_miner 2 0 35.224.101.46 30006
#   run_miner 2 0 35.184.84.143 30006
    run_miner 2 0 35.202.3.128 30006
#    run_miner 2 0 35.196.132.86 30000
#    run_miner 2 0 34.145.195.27 30000
#    run_miner 2 0 34.85.229.86 30000

elif [[ "$1" == "21" ]]; then
    run_miner 2 1 35.224.101.46 30007
#   run_miner 2 1 35.184.84.143 30007
    run_miner 2 1 35.202.3.128 30007
#    run_miner 2 1 34.168.108.57 30000
#    run_miner 2 1 35.233.228.116 30000
#    run_miner 2 1 35.236.41.103 30000

elif [[ "$1" == "22" ]]; then
    run_miner 1 2 35.224.101.46 30008
#   run_miner 2 2 35.184.84.143 30008
    run_miner 2 2 35.202.3.128 30008
#    run_miner 2 2 35.236.23.7 30000
#    run_miner 2 2 34.106.175.66 30000
#    run_miner 2 2 34.106.173.133 30000

else
    echo "Invalid miner_num value"
fi
