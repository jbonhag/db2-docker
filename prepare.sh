#!/bin/bash
sysctl kernel.shmmax=18446744073692774399

su - db2inst1 -c "source /home/db2inst1/sqllib/db2profile && \
                  db2start && \
                  db2 create database sample &&
                  db2stop"

