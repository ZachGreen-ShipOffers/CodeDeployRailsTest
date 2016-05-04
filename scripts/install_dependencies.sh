#!/bin/bash

yum install -y epel-release
yum install -y --enablerepo=epel nodejs npm
yum install -y git curl gpg gcc gcc-c++ make
