#!/bin/sh
fio -filename=./test -direct=1 -rw=read -bs=4k -size=2G -numjobs=64 -runtime=10 -group_reporting -name=file1
fio -filename=./test -direct=1 -rw=write -bs=4k -size=2G -numjobs=64 -runtime=10 -group_reporting -name=file1
fio -filename=./test -direct=1 -rw=randread -bs=4k -size=2G -numjobs=64 -runtime=10 -group_reporting -name=file1
fio -filename=./test -direct=1 -rw=randwrite -bs=4k -size=2G -numjobs=64 -runtime=10 -group_reporting -name=file1

fio -filename=./test -direct=1 -rw=read -bs=32m -size=2G -numjobs=16 -runtime=10 -group_reporting -name=file1
fio -filename=./test -direct=1 -rw=write -bs=32m -size=2G -numjobs=16 -runtime=10 -group_reporting -name=file1
fio -filename=./test -direct=1 -rw=randread -bs=32m -size=2G -numjobs=16 -runtime=10 -group_reporting -name=file1
fio -filename=./test -direct=1 -rw=randwrite -bs=32m -size=2G -numjobs=16 -runtime=10 -group_reporting -name=file1
