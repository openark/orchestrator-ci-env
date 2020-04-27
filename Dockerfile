FROM ubuntu:18.04

RUN apt-get update -q -y # cache
RUN apt-get install -y sudo haproxy python mysql-client libaio1 libnuma1 lsof net-tools less jq curl # cache

RUN mkdir /orchestrator-ci-env
WORKDIR /orchestrator-ci-env
COPY . .

RUN cp bin/linux/systemctl.py /usr/bin/systemctl

RUN script/deploy-haproxy
RUN script/deploy-consul
RUN script/deploy-consul-template
RUN script/deploy-heartbeat

CMD script/docker-entry ; /bin/bash
