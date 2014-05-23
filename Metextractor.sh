#!/bin/bash

# Title Extraction
sed -n 's/^.*\\title{\(.*\)}.*$/\1/p' $1 | tr -d '\\' > .title

# Abstract Extraction
sed '\|begin{abstract}|!d;N;s/.*abstract}\(.*\).*/\1/;q' $1 > .abstract

echo "#!/bin/bash" > Analytex.sh
echo "./Analytext.sh .title" >> Analytex.sh
echo -e "cp WordFreq.dat .title.dat\n" >> Analytex.sh

echo "./Analytext.sh .abstract" >> Analytex.sh
echo -e "cp WordFreq.dat .abstract.dat\n" >> Analytex.sh

# Section Title Extraction
sed -n 's/^.*section{\(.*\)}.*$/\1/p' $1 | tr '\\' ' ' > .sectitle
readarray titles < .sectitle

# Meta for Creating Analysor [Analytex]
for (( i=0; i<${#titles}; i++ ));
do
    echo -e "awk ' /'\"${titles[$i]}\"'/ {flag=1;next} /'\"${titles[($i + 1)]}\"'/{flag=0} flag { print }' $1 > \".${titles[$i]}\"" | tr -d '\n' >> Analytex.sh
    sed -i '' -e '$a\' Analytex.sh
    echo -e "./Analytext.sh \".${titles[$i]}\"" | tr -d '\n' >> Analytex.sh
    sed -i '' -e '$a\' Analytex.sh
    echo -e "cp WordFreq.dat \".${titles[$i]}_${titles[($i + 1)]}.dat\"" | tr -d '\n' >> Analytex.sh
    sed -i '' -e '$a\' Analytex.sh
done
