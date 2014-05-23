#!/bin/bash

# Word Frequency List [ Normalization ]
tr '[:upper:]' '[:lower:]' < "$1" | tr -sc 'A-Za-z' '\n' > .WordStem.dat

# Word Stemming [ Converting All Variants to Root Word ]
#./porter.pl .Words.dat > .WordStem.dat

# Word Frequency [ Stopwords Removal | Sort | Unique Count ]
cat .WordStem.dat | sort | uniq -c | sort -nr | fgrep -vwf .eign > .WordFreq.dat

# Word Frequency Plot [ Using Gnuplot ]
cat .WordFreq.dat | { printf "reset\nset terminal png\nset title \"Frequency List\"\nset xlabel \"Word Rank\"\nset ylabel \"Frequency\"\nset style data lines\nplot '-' t 'Implementation'\n"; awk '{print $1}END{print "e"}'; } | gnuplot > .WordFreq.png

