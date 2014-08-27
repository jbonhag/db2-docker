FROM debian:7.4
MAINTAINER jeff

# pre-requisites
RUN apt-get update
RUN apt-get -y install libaio1 libnuma1 binutils

ADD v10.5fp1_linuxx64_expc.tar.gz v10.5fp1_linuxx64_expc.tar.gz
ADD db2expc.rsp db2expc.rsp

RUN v10.5fp1_linuxx64_expc.tar.gz/expc/db2setup -r db2expc.rsp

# until we can increase shared memory at build time
ADD create_database.sh create_database.sh
EXPOSE 50000
CMD ["/bin/bash"]
