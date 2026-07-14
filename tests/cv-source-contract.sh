#!/usr/bin/env bash
set -u

status=0
for package in xcolor enumitem titlesec parskip; do
  if grep -Fqx "\\usepackage{$package}" main.tex; then
    echo "Forbidden package dependency: $package" >&2
    status=1
  fi
done

if ! grep -Fq 'barcode scanning and damage detection' main.tex; then
  echo 'Missing required B&B Software responsibility' >&2
  status=1
fi

exit "$status"
