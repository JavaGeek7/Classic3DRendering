#!/bin/bash
WATCH_DIR="./src"
BUILD_CMD="javac -d ./bin -Xlint:overrides,deprecation,unchecked,cast,fallthrough -Xmaxerrs 1000 -Xmaxwarns 1000 -Xdiags:verbose -classpath ./res -encoding utf8 -sourcepath ./src @source.txt"
while true; do
  inotifywait -r -e modify,create,delete --quiet "$WATCH_DIR" --exclude '4913|~$|\.swp$|\.swx$|\.tmp$'
  echo "====================================="
  echo "Compile start... $(date '+%H:%M:%S')"
  eval "find src -name '*.java' > source.txt"
  eval "$BUILD_CMD"
  echo "====================================="
done
