#! /usr/bin/env bash
mklessfs -f -c /etc/lessfs.cfg
lessfs /etc/lessfs.cfg /mnt/fuse/
/bin/bash
