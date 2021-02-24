#############Custom  Aliases for hacking#############
#You should put ALL the lines (Included the comments) at the end of the file

#Command to get ready the subfolder neccesary to start pentesting
alias start_pentest='mkdir -p src && mkdir -p exploits && mkdir -p nmap && mkdir -p tmp && mkdir -p content'

#sudo nmap -p- -sS --min-rate 5000 -vvv 127.0.0.1 -n -oG grepeable | grep /tcp > scan.txt


function hello() {
   echo "Hello, $1!"
}
export -f hello


function extractPortsTCP(){
  nmap -p- -sS --min-rate 5000 -vvv -n 127.0.0.1 -oG grepeable | grep /tcp  -v "Discovered" > scan.txt
}
export -f extractPortsTCP


alias dolor="echo 'esto duele mucho'"



alias grito="echo 'AAAAAAAAAAAAAAHHHHH!!'"
