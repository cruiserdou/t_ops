#!/usr/bin/expect -f

if { $argc<2 } {
    send_user "usage: $argv0 <ip> <password> \n"
    exit
}

#接收参数，设在时ip，帐号，密码
set ip [lindex $argv 0] 
set user_name [lindex $argv 1]
set password [lindex $argv 2]
#设置超时时间
set timeout 30

#发送ssh请求
spawn ssh -p 22 $user_name@$ip

expect {
    #第一次ssh连接会提示yes/no,继续 
    "*yes/no" {send "yes\r"; exp_continue}
    #出现密码提示,发送密码 
    "*password:" {send "$password\r" exp_continue}

    touch hello.txt
    echo "xwq" >> hello.txt

    eof
}

