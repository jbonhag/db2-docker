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

    docker build -t db2-express-c .
    docker run -P --privileged=true -it db2-express-c

(inside docker)

    ./prepare.sh

This will start the DB2 instance and create a sample database.

(back in the shell)

    docker ps | grep db2-express-c:0.0.1

(note hash, e.g. e001bc1de596)

    docker stop e001bc1de596
    docker commit e001bc1de596 db2-express-c:0.0.2

Thanks to rieske for the build script.

run
===

it's kind of a doozy:

    docker run --privileged=true -P -t -d -u db2inst1 jeffbonhag/db2-express-c:0.0.1 /bin/bash -c "source ~/sqllib/db2profile && db2start && read -p Waiting..."


login!
======

    username: db2inst1
    password: db2inst1
    host: localhost (or whatever `boot2docker ip` told you)
    port: what `docker ps` said
    database: SAMPLE

That's all!

