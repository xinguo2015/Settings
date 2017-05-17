### 下载和安装Anaconda
- 通过[TUNA](https://mirror.tuna.tsinghua.edu.cn/help/anaconda/)下载: 
https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/ 
https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-4.3.1-Linux-x86_64.sh

```
echo "安装多线程下载工具 axel"
sudo apt install axel
echo "下载 Anaconda"
axel -n https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-4.3.1-Linux-x86_64.sh
echo "安装 Anaconda"
bash Anaconda3-4.3.1-Linux-x86_64.sh
```

- 运行以下命令，使用TUNA的仓库镜像:
```
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --set show_channel_urls yes
```

### 创建和进入tensorflow环境
```
conda create -n tensorflow python=3.5 
source activate tensorflow  
```

### 安装tensorflow with gpu
在网站生成安装命令：https://mirror.tuna.tsinghua.edu.cn/help/tensorflow/ 
```
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ \
     https://mirrors.tuna.tsinghua.edu.cn/tensorflow/linux/gpu/tensorflow_gpu-1.1.0-cp35-cp35m-linux_x86_64.whl
```
### 测试导入tensorflow
```
Python3.5
import tensorflow as tf
```
显示导入错误，没有libcudnn.so.5
解决方法：下载和安装Cuda DNN 5.0
```
tar zxvf cudnn-8.0-linux-x64-v5.0*
sudo cp cuda/include/cudnn.h /usr/local/cuda/include/
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64/
```
再次导入tensorflow
```
python  
>>> import tensorflow as tf
>>> hello = tf.constant('Hello, TensorFlow!')
>>> sess = tf.Session()
>>> print(sess.run(hello))
```
**成功！！！**

### 在jupyter notebook中使用tensorflow
```
source activate tensorflow
conda install ipython
conda install jupyter

echo "查看应用程序"
which python
which ipython
which jupyter
source deactivate tensoflow

echo "再次查看应用程序的变化"
which python
which ipython
which jupyter
source activate tensorflow

echo "运行jupyter"
jupyter notebook

import tensorflow as tf
hello = tf.constant('Hello, TensorFlow!')
sess = tf.Session()
print(sess.run(hello))
```
