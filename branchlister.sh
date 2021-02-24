#!/bin/bash
# List the n most recently updated Git branches
# Usage:
# bash branchlister.sh <number-of-branches>
# Default number of branches to list is 8.
# Must be run from a directory under Git control.

COUNT=$1

if [ $# -eq 0 ]; then
    COUNT=8
fi

oIFS="$IFS"
IFS=$'\n'
brancharray=( $(git for-each-ref --count=$COUNT --sort=-committerdate refs/heads/ --format="%(refname)   ----  %(committerdate) - %(authorname)" | sed "s/refs\/heads\///g") )
IFS=$oIFS


COUNT=1

echo
echo "Branches:"

for i in "${brancharray[@]}"
do
    echo "$COUNT. $i"
    ((COUNT++))
done

echo
