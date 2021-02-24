#!/bin/bash
# To be used after running branchlister.sh.
# Pick one of the listed branches to check out.
# Usage:
# bash branchpicker.sh <number-of-branch-to-checkout>
# Default is branch 1 in the list.
# Must be run from a directory under Git control.

item_requested=$1
if [ $# -eq 0 ]; then
    item_requested=1
fi

oIFS="$IFS"
IFS=$'\n'
brancharray=( $(git for-each-ref --count=$item_requested --sort=-committerdate refs/heads/ --format="%(refname)" | sed "s/refs\/heads\///g") )
IFS=$oIFS

((item_requested--))
echo git checkout ${brancharray[$item_requested]}
git checkout ${brancharray[$item_requested]}

