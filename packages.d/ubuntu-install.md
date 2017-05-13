## Ubuntu系统安装

### 安装ubuntu 16.04
- UEFI启动
- 分区创建
	- 创建uef分区（否则不能启动）
	- swap分区，boot分区，／分区，home 分区

### 安装CUDA 8.0
- 下载cuda 8.0安装文件（run文件）
- 禁止 nouveau
```
sudo echo "blacklist nouveau"          > /etc/modprobe.d/blacklist-noveau.conf
sudo echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist-noveau.conf
sudo echo "alias nouveau off"         >> /etc/modprobe.d/blacklist-noveau.conf
sudo update-initramfs -u
sudo reboot
```
ctrl+alt+F1进入console login
```
sudo service lightdm stop
sudo killall Xorg
chmod +x cudaXXX.run
./cudaXXX.run（运行安装文件）
    - yes, install driver 
	- yes, nvidia-xconfig
    - yes, intall opengl libraries
	- no,  install sample (以后可以随时安装）
```
- 设置PATH和LD_LIBRARY_PATH
    - vim ~/Settings/bash.d/cuda.path.bashrc
	```
	export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
	export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
	```
	- 重启

### Install google chrome
```
sudo wget http://www.linuxidc.com/files/repo/google-chrome.list -P /etc/apt/sources.list.d/
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
sudo apt-get update
sudo apt-get install google-chrome-stable
```

