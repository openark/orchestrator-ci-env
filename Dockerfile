FROM ubuntu:18.04

RUN apt-get update -q -y
RUN apt-get install -y sudo haproxy python
RUN apt-get install -y libaio1 libnuma1

COPY . .

RUN cp bin/linux/systemctl.py /usr/bin/systemctl

RUN script/deploy-haproxy
RUN script/deploy-consul
RUN script/deploy-consul-template
RUN script/deploy-heartbeat

CMD script/docker-entry
