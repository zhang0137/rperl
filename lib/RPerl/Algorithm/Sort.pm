package RPerl::Algorithm::Sort;
use strict;  use warnings;

our @ISA = ('RPerl::Algorithm');
use RPerl::Algorithm;

our void__method $inherited = sub { (my object $self, my string $person) = @_;  print "[[[ HOWDY \$self $self \$person $person FROM INSIDE inherited()!!! ]]]\n"; };
our void $not_inherited = sub { (my string $person) = @_;  print "[[[ HOW DO YOU DO \$person $person FROM INSIDE not_inherited()... ]]]\n"; };


# all of the following happen before the INIT block, and thus rely upon AUTOLOAD
print "WAZZUP FROM Sort.pm\n";
inherited('FAKESELF', "Spidey");
RPerl::Algorithm::Sort::inherited("FAKECLASS", "Peter Parker");
RPerl::Algorithm::Sort->inherited("Mary Jane");

not_inherited('Doc Oc');
RPerl::Algorithm::Sort::not_inherited("Doctor Octavius");
RPerl::Algorithm::Sort->not_inherited("Mad Scientist");  # ignores "Mad Scientist"
print "LATERZ FROM Sort.pm\n";
