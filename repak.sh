#! /bin/bash

file="./output/output-noengine.txt"

# Create empty output file
echo "Creating output file..."
touch $file
> $file

# Write each line of modifications to output file
echo "Writing modifications to output file..."
while read line; do
  echo "\"../../output/pakchunk0-Android_ASTCClient_p/$line\" \"../../../RL2D/Content/ProductAssets/$line\"" >> $file
done < "./modifications.txt"

# Create the patched pak file
echo "Creating patched pak file..."
./UnrealPakTool/UnrealPak.exe ../output/pakchunk0-Android_ASTCClient_p.pak -create=../output/output-noengine.txt -compress -compresspackages -LZ4 -platform=android

echo "Success!"
