#!/usr/bin/bash

# Every command has 3 streams:
# stdin (Standard Input)
# stdout (Standard Output)
# stderr (Standard Error)

# attach one command's stdout to anothers command stdin
# cmdA | cmdB
ls | grep "curl" 

# Attach a file to a command's stdin with a less-then:
cat < curl.sh

# Attach a commands stdout to a file with greater-then:
ls > ls-output.sh && sleep 5 && rm ls-output.sh

