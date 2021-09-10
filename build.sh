#!/bin/bash

bundle exec jekyll build
rm -rf docs
cp _site docs

