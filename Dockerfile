FROM ubuntu
RUN apt update
RUN apt install -y git graphviz make iputils-tracepath
RUN git clone https://github.com/deanturpin/hosts2dot
RUN make -C hosts2dot
