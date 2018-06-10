#!/usr/bin/expect -f

set ip [lindex $argv 0 ]
set user_nm [lindex $argv 1 ]
set password [lindex $argv 2]

set timeout 10
spawn ssh $user_nm@$ip

expect {
    "*yes/no" {send "yes\r"; exp_continue}
    "*password:" {send "$password\r"}
    "Password*:" {send "$password\r"}
}
expect "#"
send "touch hello.txt\r" 

expect "#"
send "echo 'dou' >> hello.txt\r"

expect "#"
send "exit\r"

interact
