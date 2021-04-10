#!/bin/sh -l

json_path=$1

if [ -f "$json_path" ]; then
  cat "$json_path";
fi