package latex;

BEGIN{
 use Exporter   ();
 use CGI qw(:all);;
 @ISA         = qw(Exporter);
 @EXPORT      = qw(&greplatexenv &greplatexcom2 &greplatexcom &theenv 
&tex2html &bichop);

 use Text::Balanced qw (extract_bracketed) ;
 use IPC::Open2;
}

=head1 NAME

C<latex.pm> - a perl module to extract elements from a LaTeX file

=head1 SYNOPSIS

   @a         = greplatexenv("letter",["to"],"myletter,tex") ; 
   print $a[0]->{to}
   print $a[0]->{env}

   @l_section = greplatexcom("section",["title"],"myart.tex");
   for $s (@l_section) {print $s->{title} };

   @class = greplatexcom("documentclass",[["args"],"class"],"myart.tex");
   print $class[0]->{class} ;

   $abstract  = theenv("abstract","myart.tex");
   print tex2html($abstract);

=head1 DESCRIPTION

The following functions are available:

=head2 C<greplatexenv> - to get all ocurrences of an environment

   @a = greplatexenv("letter",["to"],"myletter,tex") ; 

C<greplatexenv> returns a list of all the ocurrences of environment "letter",
reading its firts argument to the "to" field and saving its content in the 
"env" field;

=head2 C<theenv>  - to get an environment contents

   $abstract  = theenv("abstract","myart.tex");

C<theenv> returns the contents of the environment "abstract".

=head2 C<greplatexcom>  - to get all ocurrences of a command

   @l_section = greplatexcom("section",["title"],"myart.tex");
   for $s (@l_section) {print $s->{title} };

Opcional arguments can be described with "[name]". See example

   @class = greplatexcom("documentclass",[["args"],"class"],"myart.tex");
   print $class[0]->{class} ;

=cut

sub theenv{ my($a,$b)=@_;
  my @r=greplatexenv($a,[],$b);
  $r[0]->{'env'};
}

sub greplatexcom2{
  my ($name,$listofargnames,@mfile) = @_ ;
  my $file;
  my $old = $/;
  $/ = "\\$name";
  my @rf=();
  for $file (@mfile){
    open(A,$file) or die "cant open $file\n";
    <A>;
    while(<A>){
      chomp;
      my %r = ();
      for $n (@$listofargnames){
        if(ref($n) eq "ARRAY"){
            ($r{$n->[0]},$_) = extract_bracketed($_,"[");
            delete $r{$n->[0]} unless (defined $r{$n->[0]});
        }
        else { ($r{$n},$_) = extract_bracketed($_,"{");}
      }
      $r{'sep'} = $_;
      push(@rf,\%r);
    }
  }
  $/ = $old;
  @rf;
}

sub greplatexcom{
  my ($name,$listofargnames,@mfile) = @_ ;
  my $file;
  my $old = $/;
  $/ = "\\$name";
  my @rf=();
  for $file (@mfile){
    open(A,$file) or die "cant open $file\n";
    <A>;
    while(<A>){
      chomp;
      my %r = ();
      for $n (@$listofargnames){
        if(ref($n) eq "ARRAY"){
            ($r{$n->[0]},$_) = extract_bracketed($_,"[");
            delete $r{$n->[0]} unless (defined $r{$n->[0]});
        }
        else { ($r{$n},$_) = extract_bracketed($_,"{");}
      }
      push(@rf,\%r);
    }
  }
  $/ = $old;
  @rf;
}

sub greplatexenv{
  my ($name,$listofargnames,@mfile) = @_ ;
  my $file ;
  my $old = $/;
  $/ = "\\begin{$name}";
  my @rf=();
  for $file (@mfile){
     open(A,$file) or die "cant open $file\n";
     while(<A>){
       chomp;
       if(/\\end{$name}/) {$_=$`;}
       else               {next;}
       my %r = ();
       for $n (@$listofargnames){
        if(ref($n) eq "ARRAY"){
            ($r{$n->[0]},$_) = extract_bracketed($_,"[");
            delete $r{$n->[0]} unless (defined $r{$n->[0]});
        }
        else { ($r{$n},$_) = extract_bracketed($_,"{");}
       }
       $r{'env'} = $_;
       push(@rf,\%r);
     }
  }
  $/ = $old;
  @rf;
}

=head2 C<bichop> -  Double end chop

  bichop("{aaa}") 

is

  "aaa"

=cut

sub bichop{      
 chop $_[0];
 substr($_[0],0,1)="";
 $_[0];
}
1;


=head2 C<tex2html> - tex to html translation function

  tex2html("\section{Section one}") 

is

  "<h2> Section one </h2>"

You need C<tth> comand intalled in your path...! 

=cut

sub tex2html{
   my $osep=$/;
   undef  $/;
   my $pid = open2(RD, WT, 'tth -r');
   print WT shift;
   close WT;
   $/=%osep;
   <RD>;
}

=head2 Example: make bibtex from a Latex file

	#!/usr/local/bin/perl
	use latex;
	$f=shift;

	@doc = greplatexcom("documentclass",[["args"],"t"],$f);
	@t=    greplatexcom("title",["t"],$f);
	@sec=  greplatexcom("section",["t"],$f);
	@au=   greplatexcom("author",["t"],$f);
	@date= greplatexcom("date",["t"],$f);
	$abs=  theenv("abstract",$f);

	$type = bichop($doc[0]->{"t"});
	$aut  = $au[0]->{t};
	($k= $aut) =~ tr{a-záéíóúãõâêôç {}}{}d ;

	print 
	"\@$type\{$k,
	  author=$aut,
	  title=$t[0]->{t},
	  abstract={$abs},
	  year=$date[0]->{t}}\n\n";

=head2 Author

José João Almeida - C<jj@di.uminho.py>

=cut 

1;
