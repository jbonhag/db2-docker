#!/bin/bash
sysctl kernel.shmmax=4294967295

su - db2inst1 -c "source /home/db2inst1/sqllib/db2profile && \
                  db2start && \
                  db2 create database sample &&
                  db2stop"

