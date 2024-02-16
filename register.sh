#!/bin/bash

#install
apt update && apt upgrade
apt install python3 python3-pip git
wget https://raw.githubusercontent.com/wggly/reg/main/regis.zip
unzip regis.zip
rm -rf regis.zip
pip3 install -r regis/requirements.txt
pip3 install pillow

#isi data
echo ""
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your Id Telegram :" admin
echo -e BOT_TOKEN='"'$bottoken'"' >> /root/regis/var.txt
echo -e ADMIN='"'$admin'"' >> /root/regis/var.txt
clear
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "DOMAIN         : $bottoken"
echo "Email          : $admin"
echo -e "==============================="
echo "Setting done"

cat > /etc/systemd/system/regis.service << END
[Unit]
Description=Simple register - @bogelxd_vpn
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/python3 -m regis
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start regis 
systemctl enable regis

clear

echo " Installations complete, type /menu on your bot"
rm -rf register.sh
