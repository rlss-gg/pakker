#! /bin/bash

apk_location="rl2d.apk"

# Verify the apk
echo "Verifying apk..."
jarsigner -verify $apk_location

# Create output directory
echo "Creating output directory..."
mkdir "output" -p

# Unpak apk using apktool
echo "Unpacking apk..."
apktool d -f -r $apk_location -o ./output/rl2d.out

# Unpak obb
echo "Unpacking obb..."
apktool d -f -r ./output/rl2d.out/assets/main.obb.png -o ./output/main.obb.png.out

# Extract pak file for modification
echo "Extracting pak file..."
./UnrealPakTool/UnrealPak.exe ./output/main.obb.png.out/unknown/RL2D/Content/Paks/pakchunk0-Android_ASTCClient.pak -Extract ../output/pakchunk0-Android_ASTCClient

# Create copy of extracted pak
echo "Creating copy of extracted pak..."
cp -r ./output/pakchunk0-Android_ASTCClient ./output/pakchunk0-Android_ASTCClient_p

echo "Success!"
