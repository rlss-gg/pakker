![Banner image](https://3k4812ts.media.zestyio.com/keyart.jpg)

# Pakker - Customise your RL Sideswipe

This tool lets you customise your RL Sideswipe (Android only). Use this at your own risk - any problems as a result of its usage are not our fault. Please only use this if you know what you are doing.

## Setup

The following instructions are for setting up pakker on Linux. This has been tested on Debian through WSL on Windows 11.

### 1. Install packages

In order to use pakker, a number of packages must first be installed.

```bash
sudo apt-get update
sudo apt-get install unzip
sudo apt-get install default-jdk
```

### 2. Install apktool

Apktool is used to unpack the APK to give us access to its `.pak` file.

```bash
curl -o apktool https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/windows/apktool.bat
curl -o apktool.jar https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.9.0.jar
sudo mv ./apktool /usr/local/bin/apktool
sudo mv ./apktool.jar /usr/local/bin/apktool.jar
chmod +x /usr/local/bin/apktool
chmod +x /usr/local/bin/apktool.jar
```

### 3. Download UnrealPakTool

UnrealPakTool is used to modify the game's `.pak` file.

```bash
curl -O https://github.com/allcoolthingsatoneplace/UnrealPakTool/releases/download/4.27.0/UnrealPakTool.zip
unzip UnrealApkTool.zip
```

### 4. Download your game APK

Download the RL Sideswipe from [apkmirror](https://www.apkmirror.com/apk/psyonix-studios/rocket-league-sideswipe/). Click on the latest version listed, then download the version with an **APK** chip. Move this file into this directory, then rename it `rl2d.apk`.

## Usage

Once the above setup steps are complete, running the pakker is simple.

### 1. Unpack the game APK

Run the following script, which will unpack the `apk` and save the contents of the script in the `./output` directory.

```bash
./unpak.sh
```

### 2. Select files to modify

This tool works by creating a new `pak` which patches the existing one with new values. To do this, you can create a `modifications.txt` file and list the names of the files you wish to include in the new `pak`.

```bash
touch modifications.txt
nano modifications.txt
```

In nano (or your preferred editor), list the paths from `ProductAssets` of the contents you wish to overwrite, one per line.

### 3. Make your modifications

In `./output/pakchunk0-Android_ASTCClient_p`, make the changes to the files you included in your `modifications.txt`. The files in this folder are what will be repacked into the patch `pak`.

### 4. Repack the PAK file

```bash
./repak.sh
```

This tool is incomplete. The following steps have not yet been implemented.
