#!/bin/bash

# "Implementation.tex" Analysor
./Analytext.sh "Implementation.tex"
mv .WordFreq.dat "/home/linux/Scripts/Shell/Text Analysis/.Implementation.tex.dat"
mv .WordFreq.png "/home/linux/Scripts/Shell/Text Analysis/.Implementation.tex.png"

# "Title" Analysor
./Analytext.sh .title
mv .WordFreq.dat .title.dat
mv .WordFreq.png "/home/linux/Scripts/Shell/Text Analysis/.title.png"

# "Abstract" Analysor
awk ' /'"begin\{abstract"'/ {flag=1;next} /'"end\{abstract"'/{flag=0} flag { print }' Implementation.tex > .abstract
./Analytext.sh .abstract
mv .WordFreq.dat .abstract.dat
mv .WordFreq.png "/home/linux/Scripts/Shell/Text Analysis/.abstract.png"

# "Section" Analysor
# "Introduction" Section Analysor
awk ' /'"Introduction"'/ {flag=1;next} /'"AOTF Spectrophotometer"'/{flag=0} flag { print }' Implementation.tex > "/home/linux/Scripts/Shell/Text Analysis/.Introduction"
./Analytext.sh "/home/linux/Scripts/Shell/Text Analysis/.Introduction"
mv .WordFreq.dat "/home/linux/Scripts/Shell/Text Analysis/.Introduction.dat"
mv .WordFreq.png "/home/linux/Scripts/Shell/Text Analysis/.Introduction
.png"

# "AOTF Spectrophotometer" Section Analysor
awk ' /'"AOTF Spectrophotometer"'/ {flag=1;next} /'"Implementation"'/{flag=0} flag { print }' Implementation.tex > "/home/linux/Scripts/Shell/Text Analysis/.AOTF Spectrophotometer"
./Analytext.sh "/home/linux/Scripts/Shell/Text Analysis/.AOTF Spectrophotometer"
mv .WordFreq.dat "/home/linux/Scripts/Shell/Text Analysis/.AOTF Spectrophotometer.dat"
mv .WordFreq.png "/home/linux/Scripts/Shell/Text Analysis/.AOTF Spectrophotometer
.png"

# "Implementation" Section Analysor
awk ' /'"Implementation"'/ {flag=1;next} /'"Embedded Systems Layer"'/{flag=0} flag { print }' Implementation.tex > "/home/linux/Scripts/Shell/Text Analysis/.Implementation"
./Analytext.sh "/home/linux/Scripts/Shell/Text Analysis/.Implementation"
mv .WordFreq.dat "/home/linux/Scripts/Shell/Text Analysis/.Implementation.dat"
mv .WordFreq.png "/home/linux/Scripts/Shell/Text Analysis/.Implementation
.png"

# "Embedded Systems Layer" Section Analysor
awk ' /'"Embedded Systems Layer"'/ {flag=1;next} /'"Interfacing with the ASPU"'/{flag=0} flag { print }' Implementation.tex > "/home/linux/Scripts/Shell/Text Analysis/.Embedded Systems Layer"
./Analytext.sh "/home/linux/Scripts/Shell/Text Analysis/.Embedded Systems Layer"
mv .WordFreq.dat "/home/linux/Scripts/Shell/Text Analysis/.Embedded Systems Layer.dat"
mv .WordFreq.png "/home/linux/Scripts/Shell/Text Analysis/.Embedded Systems Layer
.png"

# "Interfacing with the ASPU" Section Analysor
awk ' /'"Interfacing with the ASPU"'/ {flag=1;next} /'"AOTF Control"'/{flag=0} flag { print }' Implementation.tex > "/home/linux/Scripts/Shell/Text Analysis/.Interfacing with the ASPU"
./Analytext.sh "/home/linux/Scripts/Shell/Text Analysis/.Interfacing with the ASPU"
mv .WordFreq.dat "/home/linux/Scripts/Shell/Text Analysis/.Interfacing with the ASPU.dat"
mv .WordFreq.png "/home/linux/Scripts/Shell/Text Analysis/.Interfacing with the ASPU
.png"

# "AOTF Control" Section Analysor
awk ' /'"AOTF Control"'/ {flag=1;next} /'"Communicating with the Server"'/{flag=0} flag { print }' Implementation.tex > "/home/linux/Scripts/Shell/Text Analysis/.AOTF Control"
./Analytext.sh "/home/linux/Scripts/Shell/Text Analysis/.AOTF Control"
mv .WordFreq.dat "/home/linux/Scripts/Shell/Text Analysis/.AOTF Control.dat"
mv .WordFreq.png "/home/linux/Scripts/Shell/Text Analysis/.AOTF Control
.png"

# "Communicating with the Server" Section Analysor
awk ' /'"Communicating with the Server"'/ {flag=1;next} /'"Embedded System Control Flow Chart"'/{flag=0} flag { print }' Implementation.tex > "/home/linux/Scripts/Shell/Text Analysis/.Communicating with the Server"
./Analytext.sh "/home/linux/Scripts/Shell/Text Analysis/.Communicating with the Server"
mv .WordFreq.dat "/home/linux/Scripts/Shell/Text Analysis/.Communicating with the Server.dat"
mv .WordFreq.png "/home/linux/Scripts/Shell/Text Analysis/.Communicating with the Server
.png"

# "Embedded System Control Flow Chart" Section Analysor
awk ' /'"Embedded System Control Flow Chart"'/ {flag=1;next} /'"Server Layer"'/{flag=0} flag { print }' Implementation.tex > "/home/linux/Scripts/Shell/Text Analysis/.Embedded System Control Flow Chart"
./Analytext.sh "/home/linux/Scripts/Shell/Text Analysis/.Embedded System Control Flow Chart"
mv .WordFreq.dat "/home/linux/Scripts/Shell/Text Analysis/.Embedded System Control Flow Chart.dat"
mv .WordFreq.png "/home/linux/Scripts/Shell/Text Analysis/.Embedded System Control Flow Chart
.png"

# "Server Layer" Section Analysor
awk ' /'"Server Layer"'/ {flag=1;next} /'"Serialport"'/{flag=0} flag { print }' Implementation.tex > "/home/linux/Scripts/Shell/Text Analysis/.Server Layer"
./Analytext.sh "/home/linux/Scripts/Shell/Text Analysis/.Server Layer"
mv .WordFreq.dat "/home/linux/Scripts/Shell/Text Analysis/.Server Layer.dat"
mv .WordFreq.png "/home/linux/Scripts/Shell/Text Analysis/.Server Layer
.png"

# "Serialport" Section Analysor
awk ' /'"Serialport"'/ {flag=1;next} /'"SocketIO"'/{flag=0} flag { print }' Implementation.tex > "/home/linux/Scripts/Shell/Text Analysis/.Serialport"
./Analytext.sh "/home/linux/Scripts/Shell/Text Analysis/.Serialport"
mv .WordFreq.dat "/home/linux/Scripts/Shell/Text Analysis/.Serialport.dat"
mv .WordFreq.png "/home/linux/Scripts/Shell/Text Analysis/.Serialport
.png"

# "SocketIO" Section Analysor
awk ' /'"SocketIO"'/ {flag=1;next} /'"MongoDB"'/{flag=0} flag { print }' Implementation.tex > "/home/linux/Scripts/Shell/Text Analysis/.SocketIO"
./Analytext.sh "/home/linux/Scripts/Shell/Text Analysis/.SocketIO"
mv .WordFreq.dat "/home/linux/Scripts/Shell/Text Analysis/.SocketIO.dat"
mv .WordFreq.png "/home/linux/Scripts/Shell/Text Analysis/.SocketIO
.png"

# "MongoDB" Section Analysor
awk ' /'"MongoDB"'/ {flag=1;next} /'"Client Layer"'/{flag=0} flag { print }' Implementation.tex > "/home/linux/Scripts/Shell/Text Analysis/.MongoDB"
./Analytext.sh "/home/linux/Scripts/Shell/Text Analysis/.MongoDB"
mv .WordFreq.dat "/home/linux/Scripts/Shell/Text Analysis/.MongoDB.dat"
mv .WordFreq.png "/home/linux/Scripts/Shell/Text Analysis/.MongoDB
.png"

# "Client Layer" Section Analysor
awk ' /'"Client Layer"'/ {flag=1;next} /'"Spectra Plotting"'/{flag=0} flag { print }' Implementation.tex > "/home/linux/Scripts/Shell/Text Analysis/.Client Layer"
./Analytext.sh "/home/linux/Scripts/Shell/Text Analysis/.Client Layer"
mv .WordFreq.dat "/home/linux/Scripts/Shell/Text Analysis/.Client Layer.dat"
mv .WordFreq.png "/home/linux/Scripts/Shell/Text Analysis/.Client Layer
.png"

echo -e "[+] Output written successfully at /home/linux/Scripts/Shell/Text Analysis"
