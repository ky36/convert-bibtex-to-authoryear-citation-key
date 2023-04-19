#!/usr/bin/env perl

#
# convert endnote output to authoryear citation key
#

use strict;
use warnings; 


my %h = ();

my $header;
my @one = ();

my ($author, $year, $key,);
while (my $li = <>) {
    chomp($li);

    if ($li =~ /^\s*@/) { ## flush previous record
	if (@one) {
	    ($year) = $year =~ /(\d+)/;
	    ($author) = $author =~ /[{"'\s]*(.*?),/;

	    ### get rid of special char
	    $author =~ s/[{}]//g;
	    $author =~ s/\\.//g;
	    
	    $key = $author . $year;

	    $key =~ s/\s//g;
	    
	    &printout_this($key) if (@one);
	}
	$header = $li;
	@one = ();
	next;
    }
    
    push(@one, $li);
	
    if ($li =~ /\s*author\s*=(.*)/i) {
	$author = $1;
    }
    if ($li =~ /\s*year\s*=(.*)/i) {
	$year = $1;
    }
}
&printout_this($key) if (@one);

	  
sub printout_this {
    my ($key, ) = @_;
    #print "$key\n";
    if (!defined($h{$key})) {
	$h{$key} = 'a';
    } else {
	$h{$key}++;
	$key .= $h{$key};
    }
    #print "$author, $year, $key\n";	

    my $newheader = $header;
    $newheader =~ s/\{(.*),/{$key,/; 
    
    print "$newheader\n";
    print map("$_\n", @one);
}
