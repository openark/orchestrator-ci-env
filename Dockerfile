FROM jrei/systemd-ubuntu

RUN apt-get update -q -y
RUN apt-get install -y sudo

COPY . .

RUN script/deploy-haproxy
RUN script/run-haproxy

RUN script/deploy-consul
RUN script/run-consul

RUN script/deploy-consul-template
RUN script/run-consul-template

CMD /bin/bash
