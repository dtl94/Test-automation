#!/bin/bash
set -e

echo "Waiting for Selenium Grid to be ready..."

MAX_WAIT=120
ELAPSED=0

while [ $ELAPSED -lt $MAX_WAIT ]; do
    RESPONSE=$(curl -s --connect-timeout 5 --max-time 10 http://selenium-hub:4444/status 2>/dev/null || echo "CURL_FAILED")
    
    if [ "$RESPONSE" != "CURL_FAILED" ]; then
        if [ $ELAPSED -eq 0 ]; then
            echo "DEBUG: Hub is responding, checking if Selenium Grid is ready..."
        fi
        
        if echo "$RESPONSE" | grep -i '"ready" *: *true' > /dev/null; then
            echo "SUCCESS: Selenium Grid is ready after ${ELAPSED}s"
            echo "Grid Status:"
            echo "$RESPONSE" | python3 -m json.tool 2>/dev/null || echo "$RESPONSE"

            pabot \
              --processes 2 \
              --variable HUB_URL:http://selenium-hub:4444/wd/hub \
              --outputdir /opt/robotframework/Reports \
              /opt/robotframework/Tests/
            
            exit $?
        else
            echo "Hub responding but not ready. Response snippet: $(echo "$RESPONSE" | head -c 100)..."
        fi
    else
        echo "Cannot reach Selenium Hub yet... (${ELAPSED}s)"
    fi
    
    sleep 5
    ELAPSED=$((ELAPSED + 5))
done

echo "ERROR: Selenium Grid not ready after ${MAX_WAIT} seconds"
echo "Last attempted response: $RESPONSE"
exit 1