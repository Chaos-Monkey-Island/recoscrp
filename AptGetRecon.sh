#!/bin/bash
export HLD=wholefoods.com
export homer=/home/ibex/.config/amass/              
mkdir workspace
cd workspace
amass enum  -v -src -ip -brute -min-for-recursive 2 -d $HLD
amass  viz -d3 -d $HLD
cat /home/ibex/.config/amass/amass.txt | cut -d']' -f 2 | awk '{print $1}' | sort -u > hosts-amass.txt
cat hosts-amass.txt | httprobe > uphosts.txt
smfilename="uphosts.txt"
cat uphosts.txt | hakrawler -plain -depth 5 -usewayback -scope fuzzy > spidered.txt
cat uphosts.txt | aquatone -out /output -ports "xlarge" 
