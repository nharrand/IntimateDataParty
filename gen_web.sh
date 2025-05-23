#!/bin/bash

rm -rf docs
markdown-folder-to-html web-src
mv _web-src docs
cp -r ./samples ./docs/samples
cp -r ./code ./docs/code
