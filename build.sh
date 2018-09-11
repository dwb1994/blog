#!/bin/sh

# 拷贝 projects 目录到 public 目录下
hexo clean
hexo g
cp -r projects public
hexo d

git add -A
git commit -m "docs: blog update"
git push