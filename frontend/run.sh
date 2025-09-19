#!/bin/bash

# Default: produção
DART_DEFINE="--dart-define=DEVELOPMENT_MODE=false"

for arg in "$@"
do
  if [ "$arg" == "DEV" ]; then
    DART_DEFINE="--dart-define=DEVELOPMENT_MODE=true"
  fi
done

flutter run $DART_DEFINE
