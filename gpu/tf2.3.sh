# Remove NVIDIA and CUDA dependencies
sudo apt --purge remove "cublas*" "cuda*" "cuda-*"
sudo apt --purge remove "nvidia*" "libnvidia*" "libnvidia*"
rm -rf /usr/local/cuda*
sudo apt-get autoremove && sudo apt-get autoclean

####################################################################
# Reboot. Check that GPUs are visible using the command: nvidia-smi
####################################################################

# Add NVIDIA package repositories
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin

# sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600

sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub

sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/ /"

sudo apt-get update

wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb

sudo apt install ./nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb

sudo apt-get update

# Install NVIDIA driver
# sudo apt-add-repository main # Add this to fix dkms problem
sudo apt-get install --no-install-recommends nvidia-driver-450

####################################################################
# Reboot. Check that GPUs are visible using the command: nvidia-smi
####################################################################

# Install NVIDIA CUDA - development and runtime libraries (~4GB)
wget "https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.1.105-1_amd64.deb"

sudo dpkg -i cuda-repo-ubuntu1804_10.1.105-1_amd64.deb

sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub

sudo apt-get update

# # Dont forget to put exact the version number
sudo apt-get install cuda-10-1

echo export PATH="$PATH:/usr/local/cuda-10.1/bin"
echo export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/cuda-10.1/lib64:/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH

# Install NVIDIA CUDA Deep Neural Network library (cuDNN)

# 1. cuDNN Runtime Library for (say Ubuntu 18.04) Deb
# 2. cuDNN Developer Library for (say Ubuntu 18.04) Deb
# 3. cuDNN Code Samples and User Guide for (say Ubuntu 18.04) Deb
# Install one after the other in same order using
# `sudo dpkg -i ${each file name one after the other}`

####################################################################
# Reboot. Check that GPUs are visible and working with TF.
####################################################################
