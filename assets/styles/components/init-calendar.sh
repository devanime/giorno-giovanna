#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

cd "../../../../../plugins/ticket-calendar"
pluginPath=$(pwd)
cd $DIR/../../../
themeName="$(basename -- $(pwd))"
cd $DIR
stylePath="${pluginPath}/assets/styles/main"
jsPath="${pluginPath}/assets/scripts/main"

rm -rf calendar
mkdir calendar
cp -r ${stylePath}/* calendar/
cd calendar
rm -rf *.scss
find . -type d -name core -exec rm -rf {} \;
for dir in *; do mv "$dir"/theme/* "$dir"/; done
find . -type d -name theme -exec rm -rf {} \;
cd $DIR/../common/
cat ${stylePath}/_variables.scss >> _variables.scss
replace "default-theme" "${themeName}-theme" _variables.scss

cd $DIR/../../scripts/components/
which replace || yarn global add replace
cp "${jsPath}/override-example.js" ./calendar.js
replace "custom-theme" "${themeName}-theme" calendar.js
cd $DIR

rm -- "$0"
