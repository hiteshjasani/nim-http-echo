# nim-http-echo

![](https://github.com/hiteshjasani/nim-http-echo/workflows/Build%20DockerHub%20Image/badge.svg)

## Running

To run on a local docker instance

``` shell
# print help and exit
docker run --rm -p8080:8080 hiteshjasani/http-echo:0.2 -h

# Run server with default message
docker run --rm -p8080:8080 hiteshjasani/http-echo:0.2

# Run server with custom message
docker run --rm -p8080:8080 hiteshjasani/http-echo:0.2 -t:"Hi from echo 19!"
```

Point your browser to http://localhost:8080/

## Resources

* https://hub.docker.com/repository/docker/hiteshjasani/http-echo
