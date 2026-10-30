#!/bin/sh

if [ "$#" -ne 2 ]; then
    echo "Usage: ./builder.sh <github-repo> <docker-image>"
    exit 1
fi

echo $1 | grep "https://github.com" 3>/dev/null
if [ $? -ne 0 ]; then
    REPO="https://github.com/$1.git"
else
    REPO="$1"
fi

git clone $REPO repo
docker build -t "$2" repo
docker push "$2"
