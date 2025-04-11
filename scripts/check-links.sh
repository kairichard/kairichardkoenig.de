#!/bin/bash

# Read the .brokignore file and format it for brok's --ignore option
IGNORE_LIST=$(grep -v '^#' .brokignore | tr '\n' ' ')

# Run brok with the formatted ignore list
./brok --only-failures --ignore $IGNORE_LIST $(find ./public -type f -name "*.html") > link_report.txt

# Check if there were any broken links
if [ -s link_report.txt ]; then
    echo "Found broken links:"
    cat link_report.txt
    echo "::warning::Some links in the site are broken. Check the report above for details."
    exit 1
else
    echo "No broken links found."
    exit 0
fi 