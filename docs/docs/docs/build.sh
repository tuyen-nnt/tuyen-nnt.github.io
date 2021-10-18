#!/bin/bash

bundle exec jekyll build
rm -rf docs
cp -r _site docs

