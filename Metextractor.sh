#!/bin/bash

#Initialising Variables
Scriptsdir="/home/arch/Scripts/Shell/Text Analysis"

# Title Extraction
sed -n 's/^.*\\title{\(.*\)}.*$/\1/p' $1 | tr -d '\\' > .title

# Abstract Extraction
sed '\|begin{abstract}|!d;N;s/.*abstract}\(.*\).*/\1/;q' $1 > .abstract

echo "#!/bin/bash" > Analytex.sh
echo -e "./Analytext.sh \"$1\"" >> Analytex.sh
echo -e "mv .WordFreq.dat \"$Scriptsdir/.$1.dat\"" >> Analytex.sh
echo -e "mv .WordFreq.png \"$Scriptsdir/.$1.png\"" >> Analytex.sh

echo "./Analytext.sh .title" >> Analytex.sh
echo -e "mv .WordFreq.dat .title.dat\n" >> Analytex.sh
echo -e "mv .WordFreq.png \"$Scriptsdir/.title.png\"" >> Analytex.sh

echo "./Analytext.sh .abstract" >> Analytex.sh
echo -e "mv .WordFreq.dat .abstract.dat\n" >> Analytex.sh
echo -e "mv .WordFreq.png \"$Scriptsdir/.abstract.png\"" >> Analytex.sh

# Section Title Extraction
sed -n 's/^.*section{\(.*\)}.*$/\1/p' $1 | tr '\\' ' ' > .sectitle
readarray titles < .sectitle

# Meta for Creating Analysor [Analytex]
for (( i=0; i<${#titles}; i++ ));
do
    echo -e "awk ' /'\"${titles[$i]}\"'/ {flag=1;next} /'\"${titles[($i + 1)]}\"'/{flag=0} flag { print }' $1 > \"$Scriptsdir/.${titles[$i]}\"" | tr -d '\n' >> Analytex.sh
    sed -i '' -e '$a\' Analytex.sh
    echo -e "./Analytext.sh \"$Scriptsdir/.${titles[$i]}\"" | tr -d '\n' >> Analytex.sh
    sed -i '' -e '$a\' Analytex.sh
    echo -e "mv .WordFreq.dat \"$Scriptsdir/.${titles[$i]}.dat\"" | tr -d '\n' >> Analytex.sh
    sed -i '' -e '$a\' Analytex.sh
    echo -e "mv .WordFreq.png \"$Scriptsdir/.${titles[$i]}.png\"" | tr -d '\n' >> Analytex.sh
    sed -i '' -e '$a\' Analytex.sh

done
