#!/bin/bash
sshfs -o allow_other -o follow_symlinks simon@192.168.124.245:/data/ /mnt/192.168.124.245/
