#!/usr/bin/env bash
/usr/sbin/sshd -D
python -m SimpleHTTPServer $1

