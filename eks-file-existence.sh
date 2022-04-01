#!/bin/sh
RESULT=$(kubectl exec --stdin --tty `kubectl get pods | grep design | awk '{print $1;}'` -- /bin/bash -c '[ ! -f public/img/common/sender-bg.pdf ] && echo "FILE_NOT_FOUND" || echo "FILE_EXISTS" ') && curl -X POST -H 'Content-type: application/json' --data '{"text":"'"${RESULT}"'"}' https://hooks.slack.com/services/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
