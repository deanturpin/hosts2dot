FROM alpine
COPY . /src
WORKDIR /src
RUN apk add make
RUN apk add graphviz
RUN apk add bash
RUN apk add iputils
