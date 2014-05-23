#!/bin/bash

# Word Frequency List [ Normalization ]
tr '[:upper:]' '[:lower:]' < "$1" | tr -sc 'A-Za-z' '\n' > WordStem.dat

# Word Stemming [ Converting All Variants to Root Word ]
#./porter.pl Words.dat > WordStem.dat

# Word Frequency [ Stopwords Removal | Sort | Unique Count ]
cat WordStem.dat | sort | uniq -c | sort -nr | fgrep -vwf eign > WordFreq.dat
