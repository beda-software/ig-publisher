#!/bin/bash
docker pull bedasoftware/ig-publisher:latest

if [ "$1" = "sushi" ]; then
    # If the first argument is "sushi", call it directly and pass all other arguments to it
    docker run -v `pwd`:/home/node --rm -it bedasoftware/ig-publisher:latest sushi "${@:2}"
else
    # If the first argument is not "sushi", pass all arguments to the bash interpreter
    docker run -v `pwd`:/home/node --rm -it bedasoftware/ig-publisher:latest bash "$@"
fi
