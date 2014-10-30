pre-requisites
==============

It seems like DB2 doesn't like running on the AUFS back-end, so you should
switch to devicemapper instead.

Maybe this is an unrealistic request, I'm not sure.

boot2docker
-----------

boot2docker is cool, but it hides your docker settings away, so in order to
switch to the devicemapper backend you would do:

    boot2docker ssh

(inside boot2docker)

    sudo echo EXTRA_ARGS="--storage-driver=devicemapper" > \
        /var/lib/boot2docker/profile
    
(ctrl-d to exit)

    boot2docker restart

Also, hit up `boot2docker ip` for the ip address -- you'll need that later.


build
=====

    docker build -t db2 .

run
===

    docker run -P --privileged=true -it db2

(inside docker)

    ./prepare.sh

This will start the DB2 instance and create a sample database.  Then, you can
see what port DB2 is running on with `docker ps`.

login!
======

    username: db2inst1
    password: db2inst1
    host: localhost (or whatever `boot2docker ip` told you)
    port: what `docker ps` said
    database: SAMPLE

That's all!

