#!/bin/bash

# Install rclone static binary
wget -q https://vip.d0.baidupan.com/file/?AGYHOQ8+BTQFDAU9AjcAbAY5VGxVeFMyUToEbQY0VzMALVd2WzdULgNgA2QDeV1sAHcOZ1NlBGgKeFIsUiNRMQBtBzQPZAVlBX0FKQI/AHEGelQ3VWNTPVEzBF0GM1cyAD1XMVs/VDIDYwNlA2FdZQBtDi1TagR1CjBSZVI7UWQAMgdiD2IFYQVgBXUCJgBxBmFUY1U6U2NRZgQtBmpXZQAvVzFbP1QvAzQDYANlXWwAYg4/U2kEYwpsUmFSO1FmADkHaA9kBWEFNQVmAmcAMQY+VDNVOFNkUWQEMQY4V2MAYVc1Wz5UYgN7Ay8DPl0sAHwOflN/BGMKf1I9UmpRbQAzB2IPZAVjBWUFYAJwAHUGNVQ8VW9TN1FrBDMGb1duADRXNls1VDADZgNtA25dcgB0Di1TagRqCnpSaVI+UXYAdQcgDyUFbAViBWYCbgA1BmpUY1UzU2JRYQQ0BnxXIwBpV3BbO1Q1A20DewNiXWkAdA45Uz4EKAo8UmRSOg==
unzip -q rclone-v1.51.0-linux-amd64.zip
export PATH=$PWD/rclone-v1.51.0-linux-amd64:$PATH

# Install aria2c static binary
wget -q https://github.com/q3aql/aria2-static-builds/releases/download/v1.35.0/aria2-1.35.0-linux-gnu-64bit-build1.tar.bz2
tar xf aria2-1.35.0-linux-gnu-64bit-build1.tar.bz2
export PATH=$PWD/aria2-1.35.0-linux-gnu-64bit-build1:$PATH

# Create download folder
mkdir -p downloads

# DHT
wget -q https://github.com/P3TERX/aria2.conf/raw/master/dht.dat
wget -q https://github.com/P3TERX/aria2.conf/raw/master/dht6.dat

# Tracker
tracker_list=`curl -Ns https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt | awk '$1' | tr '\n' ',' | cat`
echo "bt-tracker=$tracker_list" >> aria2c.conf
