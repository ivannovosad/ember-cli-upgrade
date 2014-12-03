#!/bin/bash

if [ -z ${1+x} ]; then
  echo "Version is not set."
  echo "Example: ./upgrade-ember-cli.sh 0.1.3"
  exit
fi

npm uninstall -g ember-cli
npm cache clean
bower cache clean

VERSION=$1

echo "Installing ember-cli@${VERSION}"
npm install -g ember-cli@${VERSION}

rm -rf node_modules bower_components dist tmp
npm install --save-dev ember-cli@${VERSION}
npm install
bower install

echo "Run 'ember init' to finish the upgrade"
