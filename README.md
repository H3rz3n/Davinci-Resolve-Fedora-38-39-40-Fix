# Davinci Resolve 18.6 Fedora 39 Install Guide
Following this guide you will be able to install and make Davinci Resolve fully functional on Fedora 39.
Before downloading and installing Davinci Resolve we will need to install some important dependencies and the correct GPU driver.
The GPU driver install part at this moment supports only the Nvidia drivers, but soon I will make an update with a script to support AMD's GPU.
After that we will need to remove some old libraries that Davinci carries with itself after the installation and then it will fully work on your Fedora 39.

---

**1) Installing the correct dependencies**
This part is inside the `Davinci-PRE-INSTALL-FIX-Fedora-39.sh` file. To use it you need to :
- Open a terminal window.
- Write ` chmod +x `.
- Drag and drop the script file `Davinci-PRE-INSTALL-FIX-Fedora-39.sh` inside the terminal window.
- Press enter, write your user password.
- Drag and drop the script file `Davinci-PRE-INSTALL-FIX-Fedora-39.sh` inside the terminal window.
- Press enter, write your user password and wait until the script terminates to work.

If you want to use the command manually you will need to paste the following in a terminal :

```
sudo dnf install libxcrypt-compat libcurl libcurl-devel mesa-libGLU
```

---

**2) Installing the correct Nvidia GPU Driver (For those who have and Nvidia GPU ONLY)**
To install the Official Closed Source Nvidia drivers you will need to do the following steps :

- Update the repository with :
```
sudo dnf update
```
- Add the RPM Fusion Repository with :
```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```
- Add RPM Fusion repository for codec install with :
```
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
```
And with :
```
sudo dnf groupupdate sound-and-video
```
- Install the Nvidia GPU Driver with :
```
sudo dnf install akmod-nvidia
```
- Install the X11 Plugin with :
```
sudo dnf install xorg-x11-drv-nvidia-cuda
```

---

**3) Install Davinci Resolve**
Install Davinci Resolve using the built-in installer. Unzip it, then do the following :
- Write `chmod +x `.
- Drag and drop the file `Davinci_Resolve_XXXX_.run` inside the window.
- Press enter, write your user password.
After that, just double click on it and follow the installation wizard.

---

**4) Fix up the Davinci Resolve Libraries**
This part is inside the `Davinci-POST-INSTALL-FIX-Fedora-39.sh` file. To use it you need to :
- Open a terminal windows.
- Write `chmod +x` .
- Drag and drop the file inside the window.
- Press enter, write your user password.
- Drag and drop the script file `Davinci-POST-INSTALL-FIX-Fedora-39.sh` inside the window.
- Press enter, write your user password and wait until the script terminate to work.

If you want to use the command manually you will need to do the following steps :
```
cd /opt/resolve/libs
sudo mkdir disabled-libraries
sudo mv libglib* disabled-libraries
sudo mv libgio* disabled-libraries
sudo mv libgmodule* disabled-libraries
```

---

Now you have a perfectly functional Davinci Resolve on your Fedora 39. Let me know if you find some issues or you have some suggestion to improve the code or if there are new fixing necessities with the updates. 
