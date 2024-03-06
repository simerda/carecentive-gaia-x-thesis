#!/bin/bash
shopt -s extglob  # Enable extended globbing

NAME=thesis

function rm_files {
  rm -f $NAME+(.aux|.bbl|.bcf|.blg|.log|.out|.run.xml|.toc)
}

function run_xelatex {
  # run without output
  xelatex -interaction=nonstopmode $NAME.tex >/dev/null 2>&1

  # if command failed, re-run it with output and exit
  # shellcheck disable=SC2181
  if [ $? -ne 0 ]; then
      xelatex -interaction=nonstopmode $NAME.tex
      exit $?
  fi
}

function run_biber {
  # run without output
  biber $NAME >/dev/null 2>&1

    # if command failed, re-run it with output and exit
    # shellcheck disable=SC2181
    if [ $? -ne 0 ]; then
        biber $NAME
        exit $?
    fi
}

# measure start timestamp
START=$(date +%s)

# remove intermediate files from previous run
rm_files
# compile for the first time
run_xelatex
# compile citations
run_biber
# compile with citations
run_xelatex
# fix ref links
run_xelatex

# measure end timestamp
DURATION=$(($(date +%s) - START))

echo "Compiled in $DURATION seconds..."
