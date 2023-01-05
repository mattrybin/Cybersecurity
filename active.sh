#!/usr/bin/bash

chrome () {
    /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome $@
}
# ls $chrome

REQUEST=$(jq --null-input \
  --argjson id 1 \
  --arg method "Browser.getVersion" \
  --argjson params {} \
  '{"id": $id, "method": $method, "params": $params}')

# /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
chrome --headless --disable-gpu --remote-debugging-port=9222 --log-level=3 --disable-logging --silent > /dev/null 2>&1 &
while ! echo exit | nc localhost 9222; do sleep 0.1; done
url=$(curl -sg http://127.0.0.1:9222/json/new | grep webSocketDebuggerUrl | cut -d'"' -f4 | head -1)
echo $REQUEST | websocat -n1 --text - $url | gron


# /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -dump | grep -i "google chrome"

# websocat $url -t '{ "id":2, "method":"Page.navigate", "params":{"url": "https://google.com"}}' > file
# chrome --headless --disable-gpu --remote-debugging-port=9222 https://bugcrowd.com/programs &
# url=$(curl -sg http://127.0.0.1:9222/json/new | grep webSocketDebuggerUrl | cut -d'"' -f4 | head -1)
# echo $url
# echo 'Page.navigate {"url":"https://example.com"}' | websocat --jsonrpc --one-message --no-close ws://127.0.0.1:9222/devtools/page/A331E56CCB8615EB4FCB720425A82259
# echo Browser.getVersion '{}' | websocat -n1 --text jsonrpc:- $url
# websocat $url