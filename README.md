## DB2 on Docker

DB2 has a little problem where it needs more shared memory than Docker
originally provides.  So to run DB2, you need to run the container in
privileged mode, that is:

    docker run --privileged=true -t -i db2

Then, to finish the installation, start DB2, and create a sample
database:

    ./finish
