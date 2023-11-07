#!/bin/bash
service mongod status | grep 'active (running)' > /dev/null 2>&1
if [ $? != 0 ]
then
        sudo service mongod restart > /dev/null
fi
