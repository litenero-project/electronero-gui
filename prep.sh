#!/bin/bash
MONERO_URL=https://github.com/litenero/litenero.git
MONERO_BRANCH=release

pushd $(pwd)
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $ROOT_DIR/utils.sh

INSTALL_DIR=$ROOT_DIR/wallet
MONERO_DIR=$ROOT_DIR/litenero
BUILD_LIBWALLET=false

# init and update electronero submodule
if [ ! -d $MONERO_DIR/src ]; then
    git submodule init litenero
fi
git submodule update --remote
git -C $MONERO_DIR fetch
git -C $MONERO_DIR checkout 1.0.0
               # up next 1.0.1

# get monero core tag
get_tag
# create local monero branch
git -C $MONERO_DIR checkout -B $VERSIONTAG

git -C $MONERO_DIR submodule init
git -C $MONERO_DIR submodule update
