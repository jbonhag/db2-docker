FROM ubuntu:14.04
MAINTAINER jeff

# pre-requisites
RUN apt-get update
RUN apt-get -y install libaio1 libnuma1 binutils

ADD v10.5fp1_linuxx64_expc.tar.gz v10.5fp1_linuxx64_expc.tar.gz
ADD db2expc.rsp db2expc.rsp

# the extra `cat` is mostly to suppress a non-zero return from db2setup
RUN v10.5fp1_linuxx64_expc.tar.gz/expc/db2setup -f sysreq -r db2expc.rsp; cat /tmp/db2setup.log

# until we can increase shared memory at build time
ADD create_database.sh create_database.sh
EXPOSE 50000
# CMD ["./create_database.sh"]
