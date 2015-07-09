#!/bin/bash

#Install chef-client
rpm -i https://opscode-omnibus-packages.s3.amazonaws.com/el/7/x86_64/chef-12.4.1-1.el7.x86_64.rpm

#Set to use version 2.7 of python as chef does not work nicely with v3
alternatives --set python /usr/bin/python2.7
python --version 

