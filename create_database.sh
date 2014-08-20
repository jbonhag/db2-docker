#!/bin/sh
su -c "db2start" - db2inst1
su -c "db2 create database SAMPLE" - db2inst1
