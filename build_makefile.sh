#! /usr/bin/env bash

set -euo pipefail

if [ "$#" -ne 1 ]; then
    echo "ERROR: Mandatory argument missing."
    echo "Usage: $0 STYLE"
    exit 1
fi

STYLE=$1
sed -e 's,$(STYLE),'$STYLE',g' < Makefile_template > Makefile_$STYLE
