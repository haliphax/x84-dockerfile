#!/usr/bin/env bash

if [ ! -f /home/x84/.x84/default.ini ]; then
	PWD=$(pwd)
	cd $(dirname ${BASH_SOURCE[0]})
	python - <<EOF
from x84.bbs.ini import init
from x84 import cmdline
init(*cmdline.parse_args())
EOF
	echo "First run, binding to 0.0.0.0"
	sed -i "s/127.0.0.1/0.0.0.0/" /home/x84/.x84/default.ini
	cd $PWD
fi

x84
