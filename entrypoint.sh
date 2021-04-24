#!/bin/sh -l

set -e

json_path=$1

echo -n "Checking JSON report: "

if [ -f "$json_path" ]; then
  declare -a vulnerabilities
  readarray -t vulnerabilities < <( jq -c '.dependencies[] | select(.vulnerabilities | length > 0) | {filename: .fileName, vulnerabilities: ([.vulnerabilities[].name] | join(", ")), maxCvssv3Score: (.vulnerabilities | max_by(.cvssv3.baseScore) | .cvssv3.baseScore )}' "$json_path")
  if [ ${#vulnerabilities[@]} -gt 0 ]; then
      printf "Found %d vulnerabilities!\n\n" ${#vulnerabilities[@]}

      for vulnerability in "${vulnerabilities[@]}"; do
        printf "%s\n\n" "$vulnerability"
      done
      echo "Failing pipeline."
      exit 1
  else
    echo "No vulnerabilities found."
  fi
else
  echo "Error: JSON report path '${json_path}' not found"
  exit 1
fi
