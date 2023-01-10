#!/bin/bash
cd "$(dirname "$0")"
dfu-util -v -d 0483:df11 -a 0 -s 0x08000000 -D jackal_firmware.bin