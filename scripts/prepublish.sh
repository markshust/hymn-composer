echo "> Start transpiling ES2015"
echo ""
./node_modules/.bin/babel --plugins "transform-runtime" lib --ignore __tests__ --out-dir ./dist
cd dist
../node_modules/browserify/bin/cmd.js --debug --ignore-missing -t [ exposify --expose [ --react React ] ] ./window_bind.js > ./browser.js
cat ./browser.js | ../node_modules/uglifyify/node_modules/uglify-js/bin/uglifyjs -c > ./browser.min.js
echo ""
echo "> Complete transpiling ES2015"
