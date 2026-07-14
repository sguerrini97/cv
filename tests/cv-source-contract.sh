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

if ! grep -Fq '\newcommand{\tech}[1]{\textbf{Technologies:} #1\par\vspace{0.35em}}' main.tex; then
  echo 'Missing post-technology spacing' >&2
  status=1
fi

if ! awk 'previous == "\\newpage" && $0 == "\\cvsection{Education}" { found = 1 } { previous = $0 } END { exit !found }' main.tex; then
  echo 'Education must start on a new page' >&2
  status=1
fi

exit "$status"
