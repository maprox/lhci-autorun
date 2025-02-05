#!/bin/bash

git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"
git commit --allow-empty -m "`date +'%Y-%m-%d %H:%M:%S'`"

lhci autorun
