#!/bin/sh -l

json_path=$1

echo "Checking JSON report..."

if [ -f "$json_path" ]; then
  cat "$json_path";
else
  printf "'%s' not found" "${json_path}"
fi