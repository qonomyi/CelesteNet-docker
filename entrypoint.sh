#!/bin/sh
PERSIST_DIR="/app/persist"
CONFIG="celestenet-config.yaml"

if [ -f "$PERSIST_DIR/$CONFIG" ]; then
	cp "$PERSIST_DIR/$CONFIG" "/app/$CONFIG"
else
	dotnet CelesteNet.Server.dll
	EXIT=$?
	cp "./$CONFIG" "$PERSIST_DIR/$CONFIG" 2>/dev/null
	exit $EXIT
fi

exec dotnet CelesteNet.Server.dll
