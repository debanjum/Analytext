ANALYTEXT
=============
> A LaTex Aware Text Analysor and Visualisation

A set of BASH scripts that will analyse your Text and LaTex Files and output complete and sectionwise word frequency graphs and data.


DEPENDENCIES
---------------
1. BASH
2. Gnuplot


RUN
---------------
1. Open BASH/Shell/Terminal
2. ```cd /path/to/this/repository```
3. Copy text to be analysed into repository
4. ```sudo chmod +x Metextractor.sh Analytex.sh Analytext.sh```
5. [Optional]Change the path of $scriptsdir in Metextractor.sh to the directory these repository files are in
6. ```./Metextractor.sh Test.tex```
7. ```./Analytex.sh```
OR
5. ```./Analytext.sh Test.txt```


DEBUGGING
---------------
0. Ignore Error "sed: can't read : No such file or directory"
1. Enable "Hidden File View" to view output as all output prepended with "."
2. Ensure all applications dependencies installed
3. Make sure file permission are set correctly
4. To run script from different folder change the path of $scriptsdir in Metextractor.sh
5. Insert your tex/text file in the $scriptsdir


REPOSITORY DESCRIPTION
---------------
1. Metextractor.sh : Creates the Analytex.sh based on different components in the *.tex file to be analysed. ```./Metextractor.sh Test.tex```
2. Analytex.sh : Runs Analytext.sh on the all the different components of *.tex file suggested by Metextractor.sh ```./Analytex.sh```
3. Analytext.sh: This is the basic text analysis shell script used by Analytex.sh. It can be used to analyse any text file. ```./Analytext.sh Test.txt```


CONTRIBUTING
---------------
1. Fork, Edit, Commit, Push, Submit Pull Request


BUGS
---------------
Please file bug reports at [here](https://github.com/debanjum/Analytext/issues)


LICENSE
---------------
This program is free software; it is distributed under the GNU General Public License v3.

[GPLv3](./LICENSE) © [debanjum](./AUTHORS)
