## DB2 on Docker

DB2 has a problem where it needs more shared memory than Docker
originally provides.  So to run DB2, you need to run the container in
privileged mode, that is:

    docker run --privileged=true -t -i db2

This will finish the installation, start the DB2 instance and create a
sample database.
