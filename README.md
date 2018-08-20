# linux

### Backup filesystem perms:
getfacl -R / > /tmp/perms.txt
### Restore filesystem perms:
setfacl --restore=/tmp/perms.txt


### Iptables detailed and readable rules list
iptables -L --line-num -n -v -x


### Shell
&& to execute next command if previous command output (echo $?) is 0
|| to execute next command if previous command output is not 0 


# SSH
### SSH Agent - Fowarding keys
ssh-agent
ssh-add $YOUR_KEY_PATH
#### to connect with your key to be used
ssh $SERVER -A
