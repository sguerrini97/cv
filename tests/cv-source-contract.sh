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

if grep -Fq '\newpage' main.tex; then
  echo 'Languages must remain eligible for page one' >&2
  status=1
fi

if ! grep -Fq '{\centering' main.tex; then
  echo 'Missing compact centered header' >&2
  status=1
fi

if ! grep -Fq '\textbf{#1} \;|\; #2 \;|\; #3\hfill\textbf{#4}\par' main.tex; then
  echo 'Missing single-line experience header' >&2
  status=1
fi

if ! grep -Fq '\vspace{-0.25em}%' main.tex; then
  echo 'Missing compact bullet-list spacing' >&2
  status=1
fi

if ! grep -Fq '\vspace{0.10em}%' main.tex; then
  echo 'Missing compact pre-separator spacing' >&2
  status=1
fi

if ! grep -Fq '\makebox[\linewidth][c]{{\scriptsize\textbullet}}\par' main.tex; then
  echo 'Missing small centered technology separator' >&2
  status=1
fi

if grep -Fq '\enlargethispage' main.tex; then
  echo 'Page extension must not overlap the footer' >&2
  status=1
fi

if ! grep -Fq '\par\vspace{0.55em}%' main.tex; then
  echo 'Missing compact section spacing' >&2
  status=1
fi

if ! grep -Fq '\vspace{0.20em}%' main.tex; then
  echo 'Missing compact post-separator spacing' >&2
  status=1
fi

if ! grep -Fq '\newcommand{\techlast}[1]{%' main.tex; then
  echo 'Missing final-experience technology macro' >&2
  status=1
fi

if ! grep -Fq '\techlast{.NET, C\#, Python, Java, Microsoft SQL Server, MySQL, Docker, Git, AWS}' main.tex; then
  echo 'Last experience must not have a technology divider' >&2
  status=1
fi

exit "$status"
