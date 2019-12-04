FROM nimlang/nim:1.0.2-ubuntu

COPY . /src/project

WORKDIR /src/project

RUN nimble build -y \
  && mkdir -p /bin/project \
  && cp http_echo /bin/project \
  && rm -fr /src/project

WORKDIR /bin/project
ENTRYPOINT ["/bin/project/http_echo"]
CMD ["-t:hello"]
