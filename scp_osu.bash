#!/bin/bash

DES=0
SRC=0
OPTION=access
HELP=0
RECURSE=0
USER=0
ZERO=0

show_help()
{
	echo "./scp_osu.bash [-h] [-s <source>] [-d <destination>] [-o <optional>] [-r] [-u]"
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
	echo "       "
	echo "       -->WARNING: Unfortunately the shell expands the '~' character automatically so"
	echo "                   when entering a source the user should assume that the directory"
	echo "                   they enter already has a '~/' entered beforehand"
	echo "	"
	echo "[-u] - Set user"
	echo "       Ex: washingtong"
	echo "       NOTE: -u must be specified or the USER variable must be changed"
	exit 0
}

while getopts "hd:s:o:ru:" OPT
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
		u)
			USER="${OPTARG}"
			;;
	esac
done

if [ $HELP -eq 1 ]
then
	show_help
fi

if [ "$USER" = "$ZERO" ]
then
	echo "Invalid user."
	echo "Please specify a user or edit the USER variable manually"
	exit 1
fi

if [ "$DES" = "$ZERO" ] && [ "$SRC" = "$ZERO" ]
then
	echo "Invalid destination and source"
	exit 1
elif [ "$DES" = "$ZERO" ]
then
	echo "Invalid destination"
	exit 1
elif [ "$SRC" = "$ZERO" ]
then
	echo "Invalid source"
	exit 1
fi

if [ $RECURSE -eq 1 ] && [ "$OPTION" != "access" ]
then
	echo "./scp_osu.bash -s ~/${SRC} -d ${DES} -u ${USER} -o ${OPTION} -r"
	scp -r $USER@$OPTION.engr.oregonstate.edu:"~/"$SRC $DES
	exit 0
elif [ $RECURSE -eq 1 ]
then
	echo "./scp_osu.bash -s ~/${SRC} -d ${DES} -u ${USER} -r"
	scp -r $USER@access.engr.oregonstate.edu:"~/"$SRC $DES
	exit 0
elif [ "$OPTION" != "access" ]
then
	echo "./scp_osu.bash -s ~/${SRC} -d ${DES} -u ${USER} -o ${OPTION}"
	scp $USER@$OPTION.engr.oregonstate.edu:"~/"$SRC $DES
	exit 0
else
	echo "./scp_osu.bash -s ~/${SRC} -d ${DES} -u ${USER} -o ${OPTION}"
	scp $USER@access.engr.oregonstate.edu:"~/"$SRC $DES
	exit 0
fi