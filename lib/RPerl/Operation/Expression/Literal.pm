package RPerl::Operation::Expression::Literal;
use strict;
use warnings;
our $VERSION = 0.000_010;
use Carp;
use RPerl;

# [[[ SETUP ]]]
## no critic qw(ProhibitUselessNoCritic ProhibitMagicNumbers RequireCheckedSyscalls)  ## RPERL USER DEFAULT optionally allow numeric values, print operator
use Data::Dumper;
use Scalar::Util 'blessed';

# [[[ OO INHERITANCE ]]]
use parent qw(RPerl::Operation::Expression);

# [[[ OO PROPERTIES ]]]
our %properties = ( ## no critic qw(ProhibitPackageVars)  ## RPERL SYSTEM, allow OO properties
    type             => my string $KEY_type             = undef,
    string_separator => my string $KEY_string_separator = undef,
    value            => my string $KEY_value            = undef,
);

# [[[ OO METHODS ]]]

# TRANSLATE
our object__method $ppi_to_rperl__translate = sub {
    ( my string $class, my object $node) = @_;    # class method
    my object $node_translated;
    $node_translated = { STUB_AST_OBJECT =>
            'CREATED BY RPerl::Operation::Expression::Literal' };
    return ($node_translated);
};

# GENERATE CPPOPS_PERLTYPES
our string__method $rperl_to_cpp__generate__CPPOPS_PERLTYPES = sub {
    ( my object $self ) = @_;                     # object method
    my string $self_generated = q{};
    $self_generated
        .= 'STUB PERL CODE STRING, CREATED BY RPerl::Operation::Expression::Literal';
    return ($self_generated);
};

# GENERATE CPPOPS_CPPTYPES
our string__method $rperl_to_cpp__generate__CPPOPS_CPPTYPES = sub {
    ( my object $self ) = @_;                     # object method
    my string $self_generated = q{};
    $self_generated
        .= 'STUB CPP CODE STRING, CREATED BY RPerl::Operation::Expression::Literal';
    return ($self_generated);
};

1;
