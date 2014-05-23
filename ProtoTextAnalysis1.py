import operator, string, re
import matplotlib.pyplot as plt

# Initialising Variables
wordlist={}
sectionword={}
stopwords=["","a","able","about","across","after","all","almost","also","am","among","an","and","any","are","as","at","be","between","because","been","but","by","can","cannot","could","dear","did","do","does","either","else","ever","every","for","from","get","got","had","has","have","he","her","hers","him","his","how","however","i","if","in","into","is","it","its","just","least","let","like","likely","may","me","might","most","must","my","neither","no","nor","not","of","off","often","on","only","or","other","our","own","rather","said","say","says","she","should","since","so","some","than","that","the","their","them","then","there","these","they","this","tis","to","too","us","wants","was","we","were","what","when","where","which","while","who","whom","why","will","with","would","yet","you","your"]

# Extract Text From File
with open ("/home/arch/Documents/Paper/ACM/Implementation/Article/Implementation.tex", "r") as paper:
    data=paper.read().replace('\n','')

# Extracting Title Text From File
match = re.search(r'title{(.*?)}', data)
title = re.sub(r'\\', "", match.group(1))    # Deleting \\ from text
titleword=(re.split(r'[^0-9A-Za-z]+',title)) # Splitting text into words

# Extracting Section, Subsection Titles
sectiontitle = re.findall(r'section\*?{([0-9A-Za-z ]*)}', data)

# Extracting Abstract Text From File
match = re.search(r'abstract}(.*)\\end{abstract', data)
abstract = match.group(1)
absword=(re.split(r'[^0-9A-Za-z]+',abstract))

# Extracting Sections from File
section = re.findall(r'\\s?u?b?s?u?b?section(.*?)\\s?u?b?s?u?b?section', data)
for i in xrange(len(section)):
    section[i] = re.sub(r'\\begin*?\{figure\}(.*?)figure\}', " ", section[i])  # Removing figures
    section[i] = re.sub(r'\\cite{.*?}', " ", section[i])                       # Removing citations
    sectionword[i]=(re.split(r'[^0-9A-Za-z]?',section[i]))

#Counting Word Frequency [Not Including Stopwords]
for i in xrange(len(section[:])):
    for word in sectionword[i]:
        word = word.lower()
        new_word = word.translate(string.maketrans("",""), string.punctuation)
        if len(new_word) > 2:
            if new_word in wordlist and new_word not in stopwords:
                wordlist[new_word] += 1
            else:
                wordlist[new_word] = 1

# Sorting Wordlist in Descending Order
sorted_wordlist = sorted(wordlist.iteritems(), key=operator.itemgetter(1), reverse = True)

print 'Number of distinct words: ', len(sorted_wordlist)
    
# Printing and plotting words in order of popularity
npopular = len(sorted_wordlist)
x = xrange(npopular)
y = []
for pair in xrange(npopular):
    y = y + [sorted_wordlist[pair][1]]
    print sorted_wordlist[pair]

plt.plot(x, y, 'ro')
plt.xlabel('Word ranking')
plt.ylabel('Word frequency')
plt.show()
