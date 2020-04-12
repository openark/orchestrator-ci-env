#!/bin/bash

while sleep 1 ; do
  mysql -uci -pci -h 127.0.0.1 --port 13306 -s -s -e "
    replace into test.heartbeat (id, ts) values (1, now(6))
  " && echo "heartbeat written" || echo "heartbeat ERROR"
done
