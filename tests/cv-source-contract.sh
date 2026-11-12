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

if grep -Fq '1M+ customer records' main.tex; then
  echo 'Misleading Defenda customer-record claim should not appear' >&2
  status=1
fi

if ! grep -Fq 'OWASP Top 10, Secure Code Review, Vulnerability Remediation' main.tex; then
  echo 'Missing application-security skills' >&2
  status=1
fi

if ! grep -Fq 'Contributed to data-system design and stack selection for 2M+ rows/day and 12B+ stored unique records; performed OWASP-based code reviews and remediation.' main.tex; then
  echo 'Missing Defenda application-security contribution' >&2
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

if ! grep -Fq '\newcommand{\role}[4]{%' main.tex; then
  echo 'Missing experience-header macro' >&2
  status=1
fi

if ! grep -Fq '\vspace{0.20em}%' main.tex; then
  echo 'Missing spacing before bullet lists' >&2
  status=1
fi

if ! grep -Fq '\end{itemize}\vspace{0.20em}%' main.tex; then
  echo 'Missing spacing after bullet lists' >&2
  status=1
fi

if ! grep -Fq '\setlength{\leftmargini}{1.00em}' main.tex; then
  echo 'Missing balanced bullet-list indent' >&2
  status=1
fi

if grep -Fqx '  \hrule' main.tex; then
  echo 'Full-width experience separator should not appear' >&2
  status=1
fi

if ! grep -Fq '\renewcommand{\labelitemi}{{\small\textbullet}}' main.tex; then
  echo 'Missing reduced list-bullet size' >&2
  status=1
fi

if ! grep -Fq '\itemsep 0.10em' main.tex; then
  echo 'Missing list-item spacing' >&2
  status=1
fi

if grep -Fq '\enlargethispage' main.tex; then
  echo 'Page extension must not overlap the footer' >&2
  status=1
fi

if ! grep -Fq '\par\vspace{0.85em}%' main.tex; then
  echo 'Missing section spacing' >&2
  status=1
fi

if ! grep -Fq '\vspace{0.80em}%' main.tex; then
  echo 'Missing spacing after technology line' >&2
  status=1
fi


exit "$status"
