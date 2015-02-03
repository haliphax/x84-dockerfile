#usr/bin/env bash
PWD=$(pwd)
IMAGE=$1
[ -z "$IMAGE" ] && IMAGE=haliphax/x84:latest
cd $(dirname ${BASH_SOURCE[0]})
cd ..
PERSIST_DIR=$(pwd)/persist
[ ! -d "$PERSIST_DIR/data" ] && mkdir -p "$PERSIST_DIR/data"
[ ! -d "$PERSIST_DIR/bbs" ] && mkdir -p "$PERSIST_DIR/bbs"
[ ! -d "$PERSIST_DIR/sftp" ] && mkdir -p "$PERSIST_DIR/sftp"
sudo docker run -tiu x84 --rm \
	-p 6022:6022 \
	-p 6023:6023 \
	-p 8443:8443 \
	-v $PERSIST_DIR/data:/home/x84/.x84 \
	-v $PERSIST_DIR/bbs:/home/x84/x84 \
	-v $PERSIST_DIR/sftp:/home/x84/x84-sftp_root \
	--name=x84 $IMAGE /home/x84/scripts/init.sh
cd $PWD
