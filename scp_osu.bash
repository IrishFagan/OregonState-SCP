#!/bin/bash

DES=0
SRC=0
OPTION=0
HELP=0

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
	esac
done