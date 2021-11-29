echo "dbeaver-ce install" | sudo dpkg --set-selections
wget -O dbeaver-ce.deb https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpkg -i dbeaver-ce.deb
rm dbeaver-ce.deb
echo "dbeaver-ce hold" | sudo dpkg --set-selections
