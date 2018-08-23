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
2>&1 to send all output (including err) from a script/comman to file: bash script.sh > output.txt 2>&1


# SSH
### SSH Agent - Fowarding keys
ssh-agent
ssh-add $YOUR_KEY_PATH
#### to connect with your key to be used
ssh $SERVER -A


# process list
### forest
ps -aef --forest


### Certbot basic setup for linux - certificate only, no nginx configuration
yum -y install certbot-nginx
sudo certbot --nginx certonly -d $SERVER_FQDN #add e-mail and so on
sudo ln -s /etc/letsencrypt/live/$SERVER_FQDN/fullchain.pem /etc/pki/tls/certs/$SERVER_FQDN.crt
sudo ln -s /etc/letsencrypt/live/$SERVER_FQDN/privkey.pem /etc/pki/tls/private/$SERVER_FQDN.key
configure nginx
restart

add renew task to cron: echo "30 2 * * 1 root certbot renew >> /var/log/le-renew.log" >> /etc/crontab
