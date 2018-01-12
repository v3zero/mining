#!/bin/sh
ethminer -U -F http://eth-eu.dwarfpool.com:80/59e80b863b0f44b0d7de82fe4004481195bf5767/onda_2/moja.kopalnia@gmail.com --cuda-block-size 256 --cuda-grid-size 16384 --cuda-streams 6 --cuda-schedule auto --cuda-parallel-hash 8 --dag-load-mode parallel --api-port 0 -v 1
