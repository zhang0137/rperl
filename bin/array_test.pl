#!/usr/bin/perl
use strict;  use warnings;

# RPERL DRIVER BOILERPLATE
BEGIN { package main;  our $RPERL_INCLUDE_PATH = '/tmp/RPerl-latest/lib'; }  # NEED REMOVE hard-coded path
BEGIN { use lib $main::RPERL_INCLUDE_PATH . '/CPAN/';  use MyConfig; }  # RPerl's MyConfig.pm 
BEGIN { use lib $main::RPERL_INCLUDE_PATH;  use RPerl;  our @ISA = ('RPerl');  $RPerl::INCLUDE_PATH = $main::RPERL_INCLUDE_PATH; }  # RPerl system files
BEGIN { use Data::Dumper;  our $AUTOLOAD;  sub AUTOLOAD { die("AUTOLOAD purposefully disabled for debugging, have \$AUTOLOAD = '$AUTOLOAD' and \@_ = \n" . Dumper(\@_) . ", dying"); } }  ## no critic

# UNCOMMENT TO ENABLE C++
#use RPerl::DataStructure::Array_cpp;  RPerl::DataStructure::Array_cpp::cpp_load();  RPerl::DataStructure::Array_cpp::cpp_link();

# variable declarations
my string $retval_stringify;
my int__array_ref $retval_int__array_ref;
my number__array_ref $retval_number__array_ref;
my string__array_ref $my_peeps;
my string__array_ref $retval_jeffys;

# loop to test for memory leaks
my const_int $i_MAX = 1;
for (my int $i = 0;  $i < $i_MAX;  ++$i)
{
	print "in array_test.pl, top of for() loop $i/$i_MAX\n";

#	$retval_stringify = stringify_int__array_ref([2]);
	$retval_stringify = stringify_int__array_ref([2, 2112, 42, 23, 877, 33, 1701]);
#	$retval_stringify = stringify_int__array_ref(2);  # raise/throw exception
#	$retval_stringify = stringify_int__array_ref([2, 2112, 42.3, 23, 877, 33, 1701]);  # raise/throw exception
#	$retval_stringify = stringify_int__array_ref([2, 2112, '42', 23, 877, 33, 1701]);  # raise/throw exception
	print "in array_test.pl $i/$i_MAX, have \$retval_stringify =\n$retval_stringify\n";
	
	$retval_stringify = typetest___int__array_ref__in___string__out([2, 2112, 42, 23, 877, 33, 1701]);
#	$retval_stringify = typetest___int__array_ref__in___string__out([2, 2112, 42, 23, 877, "abcdefg\n", 33, 1701]);  # not-an-int error
	print "in array_test.pl $i/$i_MAX, have \$retval_stringify =\n$retval_stringify\n";
	
	my $howdy_retval = typetest___int__array_ref__in___string__out([444, 33, 1701]);
	print "in array_test.pl $i/$i_MAX, have \$howdy_retval =\n$howdy_retval\n";
	
	$retval_int__array_ref = typetest___int__in___int__array_ref__out(5);
	print "in array_test.pl $i/$i_MAX, have \$retval_int__array_ref = \n" . Dumper($retval_int__array_ref) . "\n";

#	$retval_stringify = stringify_number__array_ref(2);  # raise/throw exception
#	$retval_stringify = stringify_number__array_ref([2, 2112, 42, 23, 877, 33, 1701]);
#	$retval_stringify = stringify_number__array_ref([2.1, 2112.2, 42.3, 23, 877, 33, 1701]);
	$retval_stringify = stringify_number__array_ref([2.1234432112344321, 2112.4321, 42.4567, 23.765444444444444444, 877.5678, 33.876587658765875687658765, 1701.6789]);
	print "in array_test.pl $i/$i_MAX, have \$retval_stringify =\n$retval_stringify\n";

	$retval_stringify = typetest___number__array_ref__in___string__out([2.1234432112344321, 2112.4321, 42.4567, 23.765444444444444444, 877.5678, 33.876587658765875687658765, 1701.6789]);
#	$retval_stringify = typetest___number__array_ref__in___string__out([2.1234432112344321, 2112.4321, 42.4567, 23.765444444444444444, 877.5678, "abcdefg\n", 33.876587658765875687658765, 1701.6789]);  # not-a-number error
	print "in array_test.pl $i/$i_MAX, have \$retval_stringify =\n$retval_stringify\n";

	$retval_number__array_ref = typetest___int__in___number__array_ref__out(5);
	print "in array_test.pl $i/$i_MAX, have \$retval_number__array_ref = \n" . Dumper($retval_number__array_ref) . "\n";

	$my_peeps = ['Superman', 'Batman', 'Wonder Woman', 'Flash', 'Green Lantern', 'Aquaman', 'Martian Manhunter'];
#	$my_peeps = ['Superman', 'Batman', 'Wonder Woman', 'Flash', 'Green Lantern', 'Aquaman', 'Martian Manhunter', '23'];
#	$my_peeps = ['Superman', 'Batman', 'Wonder Woman', 'Flash', 'Green Lantern', 'Aquaman', 'Martian Manhunter', 23];  # raise/throw exception
#	$my_peeps = ['Superman', 'Batman', 'Wonder Woman', 'Flash', 'Green Lantern', 'Aquaman', 'Martian Manhunter', '-2112.23'];
#	$my_peeps = ['Superman', 'Batman', 'Wonder Woman', 'Flash', 'Green Lantern', 'Aquaman', 'Martian Manhunter', "-2112.23"];
#	$my_peeps = ['Superman', 'Batman', 'Wonder Woman', 'Flash', 'Green Lantern', 'Aquaman', 'Martian Manhunter', -2112.23];  # raise/throw exception
#	$my_peeps = ['Wonder Woman', 'Flash', 'Green Lantern', 'Aquaman', 'Martian Manhunter', {fuzz => 'bizz', bar => "stool!\n", bat => 24}];  # raise/throw exception
#	print "in array_test.pl $i/$i_MAX, have \$my_peeps =\n" . RPerl::DUMPER($my_peeps);
	$retval_stringify = stringify_string__array_ref($my_peeps);	
	print "in array_test.pl $i/$i_MAX, have \$retval_stringify =\n$retval_stringify\n";

	$retval_stringify = typetest___string__array_ref__in___string__out($my_peeps);
#	$retval_stringify = typetest___string__array_ref__in___string__out("Should be people, instead just a person!");  # break strict refs and then segfault, not test-worthy!
#	$retval_stringify = typetest___string__array_ref__in___string__out(['Superman', 'Batman', 'Wonder Woman', 'Flash', 'Green Lantern', 'Aquaman', 'Martian Manhunter']);
	print "in array_test.pl $i/$i_MAX, have \$retval_stringify =\n$retval_stringify\n";

	$retval_jeffys = typetest___int__in___string__array_ref__out(5);
	print "in type_test.pl $i/$i_MAX, have \$retval_jeffys =\n" . Dumper($retval_jeffys) . "\n";
}

#die("Done for now, dying");
