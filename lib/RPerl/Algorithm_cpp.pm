use strict; use warnings;
package RPerl::Algorithm_cpp;
our $CPP_LOADED = 0;
our $CPP_LINKED = 0;
our @ISA = ('RPerl::CompileUnit::Module::Class');
use RPerl::CompileUnit::Module::Class;  use RPerl;

use RPerl::HelperFunctions_cpp;

our void__method $cpp_load = sub {
;	
	if (defined($RPerl::Algorithm_cpp::CPP_LOADED)) { print STDERR "in Algorithm_cpp::cpp_load(), have \$RPerl::Algorithm_cpp::CPP_LOADED = '" . $RPerl::Algorithm_cpp::CPP_LOADED . "'\n"; }
		else { print STDERR "in Algorithm_cpp::cpp_load(), have \$RPerl::Algorithm_cpp::CPP_LOADED = 'UNDEF'\n"; }
	if (not(defined($RPerl::Algorithm_cpp::CPP_LOADED)) or not($RPerl::Algorithm_cpp::CPP_LOADED))
	{
		$RPerl::HelperFunctions_cpp::CPP_LOADED = 1;  # HelperFunctions.cpp loaded by C++ #include in Algorithm.h 
		
		my $eval_string = <<'EOF';
package main;
BEGIN { print STDERR "[[[ BEGIN 'use Inline' STAGE for 'RPerl/Algorithm.cpp' ]]]\n"x3; }
use Inline
(
	CPP => '$RPerl::INCLUDE_PATH/RPerl/Algorithm.cpp',
	TYPEMAPS => '$RPerl::INCLUDE_PATH/typemap.rperl',
	CCFLAGS => '-Wno-deprecated -std=c++0x -Wno-reserved-user-defined-literal',
	INC => '-I$RPerl::INCLUDE_PATH',
	BUILD_NOISY => 1,
	CLEAN_AFTER_BUILD => 0,
	WARNINGS => 1,
	FILTERS => 'Preprocess',
	AUTO_INCLUDE => # DEV NOTE: include non-RPerl files using AUTO_INCLUDE so they are not parsed by the 'Preprocess' filter
	[
		'#include <iostream>',
		'#include <string>',
		'#include <sstream>',
		'#include <limits>',
		'#include <vector>',
		'#include <unordered_map>',  # DEV NOTE: unordered_map may require '-std=c++0x' in CCFLAGS above
	],
);
print STDERR "[[[ END 'use Inline' STAGE for 'RPerl/Algorithm.cpp' ]]]\n"x3;
1;
EOF
		print STDERR "in Algorithm_cpp::cpp_load(), CPP not yet loaded, about to call eval() on \$eval_string =\n<<< BEGIN EVAL STRING>>>\n" . $eval_string . "<<< END EVAL STRING >>>\n";

		eval($eval_string);  ## no critic
		die($@) if ($@);
		
		RPerl::HelperFunctions_cpp::cpp_link();
		$RPerl::Algorithm_cpp::CPP_LOADED = 1;
	}
	else { print STDERR "in Algorithm_cpp::cpp_load(), CPP already loaded, DOING NOTHING\n"; }
};

our void__method $cpp_link = sub {
;
#	if (defined($RPerl::Algorithm_cpp::CPP_LINKED)) { print STDERR "in Algorithm_cpp::cpp_link(), have \$RPerl::Algorithm_cpp::CPP_LINKED = '" . $RPerl::Algorithm_cpp::CPP_LINKED . "'\n"; }
#		else { print STDERR "in Algorithm_cpp::cpp_link(), have \$RPerl::Algorithm_cpp::CPP_LINKED = 'UNDEF'\n"; }
	if (not(defined($RPerl::Algorithm_cpp::CPP_LINKED)) or not($RPerl::Algorithm_cpp::CPP_LINKED))
	{
		my $eval_string = <<'EOF';
package RPerl::Algorithm_cpp;
$CPP_LINKED = 1;
1;
package RPerl::Algorithm;
our @ISA = ('main::CPP__RPerl__Algorithm', 'RPerl::CompileUnit::Module::Class');
1;
EOF
#		print STDERR "in Algorithm_cpp::cpp_link(), CPP not yet linked, about to call eval() on \$eval_string =\n<<< BEGIN EVAL STRING>>>\n" . $eval_string . "<<< END EVAL STRING >>>\n";

		eval($eval_string);  ## no critic
		die($@) if ($@);
	}
#	else { print STDERR "in Algorithm_cpp::cpp_link(), CPP already linked, DOING NOTHING\n"; }
};

package RPerl::Algorithm_cpp;
1;