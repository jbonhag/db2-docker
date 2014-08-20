## DB2 on Docker

# Building docker image

Run the build script

    ./build.sh

It will build an image with db2 installed, run docker in privileged mode in order to create the sample database (modify create_database.sh to customize), and finally it will commit the modified docker image with a database in it.

# Running the image

DB2 has a problem where it needs more shared memory than Docker
originally provides.  So to run DB2, you need to run the container in
privileged mode, that is:

    docker run --privileged=true -P -d -t db2

This will increase the max shared memory size, start the DB2 instance
and create a sample database.
