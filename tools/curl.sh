#!/usr/bin/bash

echo "Request the body"
curl inlanefreight.com

echo -e "\nRequest the body with error"
curl inlanefrsdadaseight.com || true

echo -e "\nRequest the body with error without output"
curl inlanefrsdadaseight.com 2> /dev/null || true

echo -e "\nRequest the body and output with curl"
curl -O inlanefreight.com/index.html && rm index.html

echo -e "\nRequest the body and output with curl with name"
curl inlanefreight.com/index.html -o custom-name.html && rm custom-name.html

echo -e "\nRequest the body and output with unix"
curl inlanefreight.com/index.html > unix.html && rm unix.html

echo -e "\nRequest the body and output with curl without status/output"
curl -s -O inlanefreight.com/index.html && rm index.html

# Extra

echo -e "\nSkip the SSL certificate validation"
curl -k https://inlanefreight.com