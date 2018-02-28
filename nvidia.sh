#!/bin/sh
/home/ark/mining/ethminer -U -F http://eth-eu.dwarfpool.com:80/0x5321b10ae52c32c6c65dc0e2cfd7229c6ada0d43/xxxxxxxx/xxxxxxx@gmail.com --cuda-block-size 256 --cuda-grid-size 16384 --cuda-streams 6 --cuda-schedule auto --cuda-parallel-hash 8 --dag-load-mode parallel --api-port 0 -v 1
