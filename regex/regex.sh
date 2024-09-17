#!/bin/bash

# Check for the presence of the required input files
if [[ ! -f "r0_input.txt" ]]; then
  echo "r0_input.txt not found!"
  exit 1
fi

# Process r0_input.txt
awk '
{
    if (match($0, /,/)) {
        split($0, a, /, /);
        gsub(/^\* /, "", a[1]);
        print "1. " a[1];
        print "2. " a[2] "\n";
    } else {
        print $0;
    }
}' r0_input.txt > r0_output.txt

# Process r1_input.txt
awk '
{
    if (match($0, /I am/) && match($0, /My favorite sandwich is/)) {
        split($0, a, /I am |My favorite sandwich is /);
        gsub(/\./, "", a[2]);
        gsub(/\./, "", a[3]);
        print "1. " a[2];
        print "2. " a[3] "\n";
    }
}' r1_input.txt > r1_output.txt

# Process r2_input.txt
awk '
{
    if (match($0, /sandwich with/) && (match($0, /for here/) || match($0, /to go/))) {
        split($0, a, /sandwich with | for here| to go/);
        print "1. " a[2];
        if (match($0, /for here/)) {
            print "2. for here \n";
        } else if (match($0, /to go/)) {
            print "2. to go \n";
        }
    } else {
        print $0;
    }
}' r2_input.txt > r2_output.txt
