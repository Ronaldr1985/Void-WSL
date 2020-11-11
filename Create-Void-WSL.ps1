 $TarXZ="~\Downloads\Void-i686-ROOTFS.tar.xz"
Invoke-WebRequest -Uri https://alpha.de.repo.voidlinux.org/live/current/void-i686-ROOTFS-20191109.tar.xz -OutFile $TarXZ
cmd /C "C:\Program Files\7-Zip\7z.exe" x Downloads\Void-i686-ROOTFS.tar.xz -o%userprofile%\Downloads
tar -tf ~\Downloads\Void-i686-ROOTFS.tar | Where-Object { $_ -Like "*/layer.tar" } | ForEach-Object { tar xf ~\Downloads\Void-i686-ROOTFS.tar --strip-components=1 "$_" }

If (!(Test-Path -Path C:\WSL\Void -PathType Container)) {
	New-Item -Path C:\WSL\Void -ItemType Directory
}

wsl --import Void C:\WSL\Void layer.tar
#wsl -d Fedora-33 -e sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/fedora-updates.repo
#wsl -d Fedora-33 -e sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/fedora-updates-modular.repo
#wsl -d Fedora-33 -e dnf -y install sudo passwd cracklib-dicts 'dnf-command(config-manager)'
#wsl -d Fedora-33 -e dnf config-manager --set-enabled updates --save
#wsl -d Fedora-33 -e dnf config-manager --set-enabled updates-modular --save
#
#wsl -d Fedora-33 -e bash -c "printf 'UNIX Username: ' ; read unixusername ; useradd -G wheel `$unixusername ; passwd `$unixusername"
#
#Get-ItemProperty Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Lxss\*\ DistributionName | Where-Object -Property DistributionName -eq Fedora-33  | Set-ItemProperty -Name DefaultUid -Value 1000