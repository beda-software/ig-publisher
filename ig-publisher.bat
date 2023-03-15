@echo off
docker pull bedasoftware/ig-publisher:latest

if "%1"=="sushi" (
  REM If the first argument is "sushi", call it directly and pass all other arguments to it
  docker run -v %cd%:/home/node --rm -it bedasoftware/ig-publisher:latest sushi %*
) else (
  REM If the first argument is not "sushi", pass all arguments to the cmd interpreter
  docker run -v %cd%:/home/node --rm -it bedasoftware/ig-publisher:latest bash %*
)
