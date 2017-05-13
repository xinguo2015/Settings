#!/bin/bash

sudo apt-get install perl-tk
sudo mount -o loop texlive2016.iso /mnt
cd /mnt
sudo ./install-tl -gui
cd 
sudo umount /mnt

# 更新源配置
# 配置合适的CTAN源可以加快宏包更新的网速，以中科大的源为例：

sudo tlmgr option repository http://mirrors.ustc.edu.cn/CTAN/systems/texlive/tlnet

# 之后可以利用tlmgr进行网络更新。CTAN 上的包更新很频繁，所以即便是最新版的texlive2016，其中也有大量的宏包需要更新（可能包括tlmgr程序本身）

sudo tlmgr update --self --all

# 字体配置
# XeTeX 和 LuaTeX 可以直接使用系统字体。然而 texlive 自带的字体并不在系统的字体目录里面。为了让系统可以使用texlive所带的字体，需要进行如下配置。

# 将texlive的字体配置文件复制到系统内

sudo cp /usr/local/texlive/2016/texmf-var/fonts/conf/texlive-fontconfig.conf /etc/fonts/conf.d/09-texlive.conf
# 建议将 /etc/fonts/conf.d/09-texlive.conf包含type1字体的那行删掉，
# 以避免在其它软件中显示成百上千的type1字体，即删掉
# <dir>/usr/local/texlive/2016/texmf-dist/fonts/type1</dir>

# 刷新系统字体缓存
sudo fc-cache -fsv

# dummy package 安装
# texlive2016安装之后需要“告诉”系统texlive相关软件包都安装好了。这样在系统安装依赖于tex的软件（比如R）时就不必重新下载软件仓库中的旧版 texlive 相关软件。也不会造成不同版本 tex 命令的冲突。dummy package 就是解决这样的软件依赖问题的“虚包”。

# Debian/Ubuntu下的dummy package 的制作可以参考 TUG上的官方说明. 这里 已经制作了一个 texlive2016 的dummy package, 下载后直接安装即可：

sudo dpkg -i texlive-local_2016-1_all.deb
