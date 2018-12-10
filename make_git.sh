#!/bin/sh

#echo "# webdev" >> README.md
#git init
#git config --global user.email "mvk-ais@yandex.ru"
#git config --global user.name "Mosvodokanal"

#git config --global core.excludesfile ~/.gitignore

git add .
git commit -m "rc 0.0.3"
git remote add origin https://github.com/mosvodokanal/webdev.git
git push -u origin master
