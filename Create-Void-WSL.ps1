# Author: Ronald
# Date: 2020-11-11

<#
.SYNOPSIS
A script to port Void Linux to WSL
.DESCRIPTION
A simple PowerShell script to port Void Linux to WSL, the script uses the ROOTFS tar provided by Void Linux.
.PARAMETER DistributionName
What the distro will be called in WSL, by standard it will be called Void
.PARAMETER SetDefault
A switch to state whether the newly added distro will be the default distro for WSL
#>

Param (
	[String] $DistributionName = "Void",
	[Switch] $SetDefault
)

# Defining variables
$ROOTFS_URL="https://alpha.de.repo.voidlinux.org/live/current/void-x86_64-ROOTFS-20191109.tar.xz"
$TarXZ="$HOME\Downloads\Void-x86_64-ROOTFS.tar.xz"
$ExtractTo="$HOME\Downloads"

# Downloading the ROOTFS
Invoke-WebRequest -Uri $ROOTFS_URL -OutFile $TarXZ
# Extracting the tar.xz file to a .tar file using 7zip and always override any previous files
&"C:\Program Files\7-Zip\7z.exe" x $TarXZ -o"$ExtractTo" -aoa

If (!(Test-Path -Path C:\WSL\$DistributionName -PathType Container)) {
	New-Item -Path C:\WSL\$DistributionName -ItemType Directory
}

# Adding the distribution to WSL
wsl --import $DistributionName C:\WSL\$DistributionName $HOME\Downloads\Void-x86_64-ROOTFS.tar
wsl --distribution "$DistributionName" --exec bash -c "printf 'UNIX Username: ' && read unixusername && useradd -G wheel `$unixusername && passwd `$unixusername"

If ($SetDefault) {
	wsl --setdefault "$DistributionName"
}