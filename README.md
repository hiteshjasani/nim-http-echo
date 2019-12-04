# nim-http-echo

![](https://github.com/hiteshjasani/nim-http-echo/workflows/Build%20DockerHub%20Image/badge.svg)

## Running

To run on a local docker instance

``` shell
# print help and exit
docker run --rm -p8080:8080 hiteshjasani/http-echo:http-echo-0.1 -h


# Run server with custom message
docker run --rm -p8080:8080 hiteshjasani/http-echo:http-echo-0.1 -t:"Hi there!"
```

Point your browser to http://localhost:8080/
