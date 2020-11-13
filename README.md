# Void Linux WSL

A simple PowerShell script to port [Void Linux](https://voidlinux.org/) to WSL. This script was heavly inspired and helped by the [fedora-wsl project](https://github.com/SocMinarch/fedora-wsl)

## Requirements

The only requirement of the script is [WSL 2](https://devblogs.microsoft.com/commandline/announcing-wsl-2/). The script will try and use 7zip to extract the rootfs tarball, if it isn't present, then it will temporarily grab the XZ binary from [here](https://tukaani.org/xz/).

## Usage

Run the script, if you want to change the name of the installed distribution use the parameter DistributionName.