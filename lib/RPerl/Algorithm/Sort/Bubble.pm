## no critic qw(RequireInterpolationOfMetachars)  ## RPERL allow single-quoted control characters, sigils, and regexes
package RPerl::Algorithm::Sort::Bubble;
use strict;
use warnings;
use Carp;
our $VERSION = 0.003_015;
use parent ( 'RPerl::Algorithm::Sort', 'RPerl::Algorithm::Inefficient' ); # INHERITANCE TESTING
use RPerl::Algorithm::Sort;
use RPerl::Algorithm::Inefficient;    # INHERITANCE TESTING
use Data::Dumper;

# [[[ OO PROPERTIES ]]]
# [[[ OO PROPERTIES ]]]
# [[[ OO PROPERTIES ]]]

our %properties = ( ## no critic qw(ProhibitPackageVars)  ## RPERL SYSTEM, allow OO properties
    integer__data => my integer__array_ref $KEY_integer__data,
    number__data  => my number__array_ref $KEY_number__data
);

# [[[ OO METHODS ]]]
# [[[ OO METHODS ]]]
# [[[ OO METHODS ]]]

# call out to sort integer data, return nothing
our void__method $integer__sort = sub {
    ( my object $self) = @_;

# DEV NOTE: this is an in-place sorting algorithm, we don't actually need to set $self->{integer__data} as it has not changed location
    $self->{integer__data} = integer__bubblesort( $self->{integer__data} );
};

# call out to sort number data, return nothing
our void__method $number__sort = sub {
    ( my object $self) = @_;

    $self->{number__data} = number__bubblesort( $self->{number__data} );
};

# [[[ PROCEDURAL SUBROUTINES ]]]
# [[[ PROCEDURAL SUBROUTINES ]]]
# [[[ PROCEDURAL SUBROUTINES ]]]

# original algorithm: comparison-based and stable [O(n**2) average time, O(1) worst-case extra space]
# sort integer data, return sorted data
our integer__array_ref $integer__bubblesort = sub {
    ( my integer__array_ref $integer__data) = @_;
#    ::integer__array_ref__CHECK($integer__data);
    ::integer__array_ref__CHECKTRACE( $integer__data, '$integer__data', 'integer__bubblesort()' );
    my integer $is_sorted                  = 0;
    my const_integer $integer__data_length = scalar @{$integer__data};
    my integer $integer__data_i;
    my integer $integer__data_i_plus_1;
    my integer $swap;

#    print STDERR "in PERLOPS_PERLTYPES integer__bubblesort(), top of subroutine...\n" or croak();
#    print STDERR "in PERLOPS_PERLTYPES integer__bubblesort(), received \$integer__data\n" . Dumper($integer__data) . "\n" or croak();
#    print STDERR "in PERLOPS_PERLTYPES integer__bubblesort(), have \$integer__data_length = $integer__data_length\n" or croak();

# iterate through the length-n list up to n times (n * n == n**2), larger elements "bubble to the top" (end) of the list
    while ( not($is_sorted) ) {

#        print STDERR "in PERLOPS_PERLTYPES integer__bubblesort(), top of WHILE loop\n" or croak();
        $is_sorted = 1;
        for my integer $i ( 0 .. ( $integer__data_length - 2 ) ) {
            $integer__data_i = $integer__data->[$i];
            $integer__data_i_plus_1 = $integer__data->[ ( $i + 1 ) ];

#            print STDERR "in PERLOPS_PERLTYPES integer__bubblesort(), inside for() loop \$i = $i, have \$integer__data_i = $integer__data_i\n" or croak();
#            print STDERR "in PERLOPS_PERLTYPES integer__bubblesort(), inside for() loop \$i = $i, have \$integer__data_i_plus_1 = $integer__data_i_plus_1\n" or croak();

 # compare elements and swap if out-of-order, this is the core sort comparison
            if ( $integer__data_i > $integer__data_i_plus_1 ) {
#            if ( $integer__data->[$i] > $integer__data->[ ( $i + 1 ) ] ) {

#                print STDERR "in PERLOPS_PERLTYPES integer__bubblesort(), inside for() loop, SWAPPING\n" or croak();
                $is_sorted = 0;
                $swap      = $integer__data_i;
#                $swap      = $integer__data->[$i];
                $integer__data->[$i] = $integer__data_i_plus_1;
#                $integer__data->[$i] = $integer__data->[ ( $i + 1 ) ];
                $integer__data->[ ( $i + 1 ) ] = $swap;
            }
        }
    }

# data is now sorted via top-level nested iteration [O(n**2) total time, O(1) total extra space]
# DEV NOTE: this is an in-place sorting algorithm, we don't actually need to return $integer__data as it has not changed location, EXCEPT FOR IN C++ BECAUSE OF PACKING/UNPACKING!!!
    return $integer__data;
};

# sort number data, return sorted data
our number__array_ref $number__bubblesort = sub {
    ( my number__array_ref $number__data) = @_;
#    ::number__array_ref__CHECK($number__data);
    ::number__array_ref__CHECKTRACE( $number__data, '$number__data', 'number__bubblesort()' );
    my integer $is_sorted                  = 0;
    my const_integer $number__data_length = scalar @{$number__data};
    my integer $number__data_i;
    my integer $number__data_i_plus_1;
    my integer $swap;

#    print STDERR "in PERLOPS_PERLTYPES number__bubblesort(), top of subroutine...\n" or croak();
#    print STDERR "in PERLOPS_PERLTYPES number__bubblesort(), received \$number__data\n" . Dumper($number__data) . "\n" or croak();
#    print STDERR "in PERLOPS_PERLTYPES number__bubblesort(), have \$number__data_length = $number__data_length\n" or croak();

# iterate through the length-n list up to n times (n * n == n**2), larger elements "bubble to the top" (end) of the list
    while ( not($is_sorted) ) {
#        print STDERR "in PERLOPS_PERLTYPES number__bubblesort(), top of WHILE loop\n" or croak();
        $is_sorted = 1;
        for my integer $i ( 0 .. ( $number__data_length - 2 ) ) {
            $number__data_i = $number__data->[$i];
            $number__data_i_plus_1 = $number__data->[ ( $i + 1 ) ];

#            print STDERR "in PERLOPS_PERLTYPES number__bubblesort(), inside for() loop \$i = $i, have \$number__data_i = $number__data_i\n" or croak();
#            print STDERR "in PERLOPS_PERLTYPES number__bubblesort(), inside for() loop \$i = $i, have \$number__data_i_plus_1 = $number__data_i_plus_1\n" or croak();
 # compare elements and swap if out-of-order, this is the core sort comparison
            if ( $number__data_i > $number__data_i_plus_1 ) {
#                print STDERR "in PERLOPS_PERLTYPES number__bubblesort(), inside for() loop, SWAPPING\n" or croak();
                $is_sorted = 0;
                $swap      = $number__data_i;
                $number__data->[$i] = $number__data_i_plus_1;
                $number__data->[ ( $i + 1 ) ] = $swap;
            }
        }
    }
    return $number__data;
};

# [[[ OPERATIONS & DATA TYPES REPORTING ]]]
# [[[ OPERATIONS & DATA TYPES REPORTING ]]]
# [[[ OPERATIONS & DATA TYPES REPORTING ]]]

our integer $bubblesort__OPS_TYPES_ID = 0;    # PERLOPS_PERLTYPES is 0
our string $bubblesort__ops = sub { return ('PERL'); };
our string $bubblesort__types = sub { return ('PERL'); };

# [[[ TYPE TESTING ]]]
# [[[ TYPE TESTING ]]]
# [[[ TYPE TESTING ]]]

our string $integer__bubblesort__typetest0 = sub {
    ( my integer__array_ref $lucky_integers) = @_;

    #    ::integer__array_ref__CHECK($lucky_integers);
    ::integer__array_ref__CHECKTRACE( $lucky_integers, '$lucky_integers',
        'integer__bubblesort__typetest0()' );
=disable
    my integer $how_lucky = scalar @{$lucky_integers};
    for my integer $i ( 0 .. ( $how_lucky - 1 ) ) {
        my $lucky_integer = $lucky_integers->[$i];
        print STDERR "in PERLOPS_PERLTYPES integer__bubblesort__typetest0(), have lucky_integer $i/" . ( $how_lucky - 1 ) . ' = ' . $lucky_integers->[$i] . ", BATBAR\n" or croak();
    }
    print STDERR "in PERLOPS_PERLTYPES integer__bubblesort__typetest0(), bottom of subroutine\n" or croak();
=cut

    return (
        ::integer__array_ref__stringify(
            integer__bubblesort($lucky_integers)
            )
            . 'PERLOPS_PERLTYPES'
    );
};

our string $number__bubblesort__typetest0 = sub {
    ( my number__array_ref $lucky_numbers) = @_;

    #    ::number__array_ref__CHECK($lucky_numbers);
    ::number__array_ref__CHECKTRACE( $lucky_numbers, '$lucky_numbers',
        'number__bubblesort__typetest0()' );
=disable
    my integer $how_lucky = scalar @{$lucky_numbers};
    for my integer $i ( 0 .. ( $how_lucky - 1 ) ) {
        my $lucky_number = $lucky_numbers->[$i];
        print STDERR "in PERLOPS_PERLTYPES number__bubblesort__typetest0(), have lucky_number $i/" . ( $how_lucky - 1 ) . ' = ' . $lucky_numbers->[$i] . ", BATBAR\n" or croak();
    }
    print STDERR "in PERLOPS_PERLTYPES number__bubblesort__typetest0(), bottom of subroutine\n" or croak();
=cut

    return (
        ::number__array_ref__stringify(
            number__bubblesort($lucky_numbers)
            )
            . 'PERLOPS_PERLTYPES'
    );
};

# [[[ INHERITANCE TESTING ]]]
# [[[ INHERITANCE TESTING ]]]
# [[[ INHERITANCE TESTING ]]]

our void__method $inherited__Bubble = sub {
    ( my object $self, my string $person) = @_;
    print STDERR
        "in PERLOPS_PERLTYPES Bubble->inherited__Bubble(), have \$self = '$self' and \$person = '$person', FRIED\n"
        or croak();
};

our void__method $inherited = sub {
    ( my object $self, my string $person) = @_;
    print STDERR
        "in PERLOPS_PERLTYPES Bubble->inherited(), have \$self = '$self' and \$person = '$person', ILLOGICAL\n"
        or croak();
};

our string $uninherited__Bubble = sub {
    ( my string $person) = @_;
    print STDERR
        "in PERLOPS_PERLTYPES Bubble::uninherited__Bubble(), \$person = '$person', MITOCHONDRIAL\n"
        or croak();
    return ('Bubble::uninherited__Bubble() RULES! PERLOPS_PERLTYPES');
};

# DEV NOTE: this will clash in RPerl/Class.pm with other shared global subs with the same name uninherited(), such as from Algorithm.pm
our string $uninherited = sub {
    ( my string $person) = @_;
    print STDERR
        "in PERLOPS_PERLTYPES Bubble::uninherited(), \$person = '$person', TETRAHEDRON\n"
        or croak();
    return ('Bubble::uninherited() ROCKS! PERLOPS_PERLTYPES');
};

1;
