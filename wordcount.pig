wordcount = LOAD '/home/hduser/Downloads/file.txt' USING PigStorage('\t') as (lines:chararray);
listword = FOREACH wordcount generate flatten(TOKENIZE(lines)) as words;
--dump listword;
word = foreach listword generate words, 1;
groupword = group word by words;
--dump groupword;
countword = foreach groupword generate group, SUM(word.$1);
dump countword;
