#!/bin/bash
echo 安装google chrome
sudo cp virtualbox.list /etc/apt/sources.list.d/
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install virtualbox-5.1
