#!/bin/bash

sudo dnf install -y dart

export OLD_PATH=$PWD

# extract tarball to /tmp
tar -xzf sass.tar.gz -C /tmp

pushd /tmp/dart-sass-*/

export PUB_CACHE=cache/
dart pub get --no-precompile

# tarball the pub cache
tar -czf $OLD_PATH/pub-cache.tar.gz $PUB_CACHE
popd

rm -rf /tmp/dart-sass-*