#!/bin/bash

while sleep 0.5 ; do
  mysql -uheartbeat -pheartbeat -h 127.0.0.1 --port 13306 -s -s -e "
    replace into test.heartbeat (id, ts) values (1, now(6))
  " || :
done
