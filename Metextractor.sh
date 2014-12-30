#!/bin/bash

# Initialising Variables
Scriptsdir="$PWD"

# Initialising Child Script Text
echo '#!/bin/bash' > Analytex.sh

# Complete Input Text Analysor Creation
echo -e "\n# \"$1\" Analysor" >> Analytex.sh
echo -e "./Analytext.sh \"$1\"" >> Analytex.sh
echo -e "mv .WordFreq.dat \"$Scriptsdir/.$1.dat\"" >> Analytex.sh
echo -e "mv .WordFreq.png \"$Scriptsdir/.$1.png\"" >> Analytex.sh

# Title Extractor Creation
sed -n 's/^.*\\title{\(.*\)}.*$/\1/p' $1 | tr -d '\\' > .title

echo -e "\n# \"Title\" Analysor" >> Analytex.sh
echo "./Analytext.sh .title" >> Analytex.sh
echo -e "mv .WordFreq.dat .title.dat" >> Analytex.sh
echo -e "mv .WordFreq.png \"$Scriptsdir/.title.png\"\n" >> Analytex.sh

# Abstract Extractor Creation
echo -e "# \"Abstract\" Analysor" >> Analytex.sh
echo -e "awk ' /'\"begin\{abstract\"'/ {flag=1;next} /'\"end\{abstract\"'/{flag=0} flag { print }' $1 > .abstract" >> Analytex.sh
echo "./Analytext.sh .abstract" >> Analytex.sh
echo -e "mv .WordFreq.dat .abstract.dat" >> Analytex.sh
echo -e "mv .WordFreq.png \"$Scriptsdir/.abstract.png\"\n" >> Analytex.sh

# Section Title Extractor Creation
echo -e "# \"Section\" Analysor" >> Analytex.sh
sed -n 's/^.*section{\(.*\)}.*$/\1/p' $1 | tr '\\' ' ' > .sectitle
readarray titles < .sectitle

# Meta for Creating Analysor [Analytex]
for (( i=0; i<${#titles}; i++ ));
do
    echo -e "# \"${titles[$i]}\" Section Analysor" | tr -d '\n' >> Analytex.sh
    sed -i '' -e '$a\' Analytex.sh
    echo -e "awk ' /'\"${titles[$i]}\"'/ {flag=1;next} /'\"${titles[($i + 1)]}\"'/{flag=0} flag { print }' $1 > \"$Scriptsdir/.${titles[$i]}\"" | tr -d '\n' >> Analytex.sh
    sed -i '' -e '$a\' Analytex.sh
    echo -e "./Analytext.sh \"$Scriptsdir/.${titles[$i]}\"" | tr -d '\n' >> Analytex.sh
    sed -i '' -e '$a\' Analytex.sh
    echo -e "mv .WordFreq.dat \"$Scriptsdir/.${titles[$i]}.dat\"" | tr -d '\n' >> Analytex.sh
    sed -i '' -e '$a\' Analytex.sh
    echo -e "mv .WordFreq.png \"$Scriptsdir/.${titles[$i]}.png\"\n" >> Analytex.sh
    sed -i '' -e '$a\' Analytex.sh
done

# Creating Succesful Script Executed Echo for Child Script
echo "echo -e \"[+] Output written successfully at $Scriptsdir\"" >> Analytex.sh

# Succesful Script Execution
echo -e "\n\n [+] Analytex.sh created successfully at $Scriptsdir"
