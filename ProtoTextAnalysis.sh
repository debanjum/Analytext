#!/bin/bash

# Word Frequency List [v1] [Normalization]
tr '[:upper:]' '[:lower:]' < $1 | tr -sc 'A-Za-z' '\n' > Words.dat

# Word Stemming [Converting All Variants to Root Word]
./porter.pl Words.dat > WordStem.dat

# Stopwords Removal | Sort | Unique Count
cat WordStem.dat | sort | uniq -c | sort -nr | fgrep -vwf /usr/share/groff/current/eign > WordFreq.dat
