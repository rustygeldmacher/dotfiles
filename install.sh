#!/bin/bash

if [ "$CODESPACES" != "true" ]; then
  echo "This script is just for codespaces for now"
  exit 1
fi
