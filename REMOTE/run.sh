#!/bin/bash

cd ${REMOTE_DIR}
make makefile1
a.out
make makefile2
qsub pbs_sub