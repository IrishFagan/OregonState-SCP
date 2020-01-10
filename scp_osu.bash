#!/bin/bash

DES=0
SRC=0
OPTION=0
HELP=0
RECURSE=0

show_help()
{
	echo "./scp_osu.bash [-h] [-s <source>] [-d <destination>] [-o <optional>] [-r]"
	echo "	"
	echo "---"
	echo "	"
	echo "[-h] - Show help"
	echo "	"
	echo "[-d] - Set destination directory"
	echo "       Ex: ~/dog/destination"
	echo "	"
	echo "[-o] - Set optional server to access other than flip"
	echo "       Ex: os1, os2"
	echo "	"
	echo "[-r] - Recursively download all files and subdirectories within a directory"
	echo "	"
	echo "[-s] - Set source directory or file"
	echo "       Ex: ~/cat/file.exe, ~/cat"
	echo "       NOTE: -r must be specified in order to download a directory"
}

while getopts "hd:s:o:" OPT
do
	case "${OPT}" in
		h)
			HELP=1
			;;
		d)
			DES="${OPTARG}"
			;;
		s)
			SRC="${OPTARG}"
			;;
		o)
			OPTION="${OPTARG}"
			;;
		r)
			RECURSE=1
			;;
	esac
done

if [ $HELP=1 ]
then
	show_help
fi