echo "INSTALL PYTHON 3.9" 
apt install python3.9 -y
echo "INSTALL UPDATE ALTERNATIVES"
apt install python3 -y
update-alternatives --install /usr/local/bin/python3 python3 /usr/bin/python3.8 2  
update-alternatives --install /usr/local/bin/python3 python3 /usr/bin/python3.9 1  
python3 --version  

sudo dpkg --remove --force-remove-reinstreq python3-pip python3-setuptools python3-wheel
apt-get -y install python3-pip


export PYTHONPATH=/content/SadTalker:$PYTHONPATH 
python3.8 -m pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu113
apt update
apt -y install ffmpeg &> /dev/null  
python3.8 -m pip install -r requirements.txt

# prepare CUDA for ubuntu.
apt-key del 7fa2af80
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600

apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/3bf863cc.pub

add-apt-repository 'deb https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/ /'

apt-get update

apt-get -y install cuda

# # Validate CUDA instalation.
# git clone https://github.com/nvidia/cuda-samples
# cd cuda-samples/Samples/1_Utilities/deviceQuery
# make

# Download pretrained models.
# rm -rf checkpoints
# bash scripts/download_models.sh
