#!/bin/bash

# Word Frequency List [v1] [Normalization]
tr '[:upper:]' '[:lower:]' < $1 | tr -sc 'A-Za-z' '\n' > Words.dat

# Word Stemming [Converting All Variants to Root Word]
./porter.pl Words.dat > WordStem.dat

# Stopwords Removal | Sort | Unique Count
cat WordStem.dat | sort | uniq -c | sort -nr | fgrep -vwf /usr/share/groff/current/eign > WordFreq.dat

# Word Frequency List With Plotting [v2]
#cat $1 | { printf "se te du\nplot '-' t '' w dots\n"; tr '[:upper:]' '[:lower:]' < $1 | tr -sc 'A-Za-z' '\n' | sort | uniq -c | sort -nr | fgrep -vwf /usr/share/groff/current/eign | head -200 | awk '{print $1}END{print "e"}'; } | gnuplot

# Word Frequency With Better Plotting [v2.1]
#cat $1 | { printf "reset\nset terminal png\nset title \"Frequency List\"\nset xlabel \"Word Rank\"\nset ylabel \"Frequency\"\nset style data lines\nplot '-' t 'Implementation'\n"; tr '[:upper:]' '[:lower:]' < $1 | tr -sc 'A-Za-z' '\n' | sort | uniq -c | sort -nr | fgrep -vwf /usr/share/groff/current/eign | head -200 | awk '{print $1}END{print "e"}'; } | gnuplot
