#!/bin/sh


function proc_file()
{
	infile=$1
	outfile=${infile}_out.txt
	while read line
	do
		echo $line | grep FINAL | awk -F: '{print $12}' | awk -F',' '{print $1}' | sed 's/\"//g' >> $outfile
	done < $infile 
}

for f in ./log/*
do
	proc_file $f
done
