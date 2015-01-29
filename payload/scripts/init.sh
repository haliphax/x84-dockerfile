#!/usr/bin/env bash

if [ ! -f /home/x84/.x84/default.ini ]; then
	PWD=$(pwd)
	cd $(dirname ${BASH_SOURCE[0]})
	MYPWD=$(pwd)
	cd $MYPWD
	echo "First run..."
	python2.7 firstrun.py
	sed -i "s/127.0.0.1/0.0.0.0/" /home/x84/.x84/default.ini
	cd $PWD
fi

x84
