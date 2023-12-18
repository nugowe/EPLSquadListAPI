#!/bin/bash
set -x

cd /opt/core

echo "STARTING THE GUNICORN WSGI WEBSERVER...."
/usr/bin/gunicorn -w 4 --bind unix:/opt/gunicorn.sock core.wsgi

cd /opt