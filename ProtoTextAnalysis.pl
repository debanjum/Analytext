#!/usr/bin/perl -w

use latex;
@doc = greplatexcom("documentclass",[["args"],"t"],"Implementation.tex");
@t=    greplatexcom("title",["t"],"Implementation.tex");
@sec=  greplatexcom("section",["t"],"Implementation.tex");
@au=   greplatexcom("author",["t"],"Implementation.tex");
@date= greplatexcom("date",["t"],"Implementation.tex");
$abs=  theenv("abstract","Implementation.tex");

$type = bichop($doc[0]->{"t"});
$aut  = $au[0]->{t};
($k= $aut) =~ tr{a-záéíóúãõâêôç {}}{}d ;

print 
"\@$type\{$k,
  author=$aut,
  title=$t[0]->{t},
  abstract={$abs},
  year=$date[0]->{t}}\n\n";

@l_section = greplatexcom("section",["title"],"Implementation.tex");
   for $s (@l_section) {print $s->{title} };
