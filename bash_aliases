#Command to get ready the subfolder neccesary to start pentesting
alias start_pentest='mkdir -p src && mkdir -p exploits && mkdir -p nmap && mkdir -p tmp && mkdir -p content'

alias extractPortsTCP='nmap -p- -sS --min-rate 5000 -vvv $1 -n -oG grepeable | grep /tcp > scan.txt'
