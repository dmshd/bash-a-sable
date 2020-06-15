#!/bin/bash
# grep when file does not contain

if grep -q "test2" ./test2; then
  echo "the file contains test2"
else
  echo "the file does not contains test2"
fi
