package CIF::Observable::Ipv4;

use strict;
use warnings;

use Mouse;
use Data::Dumper;
use CIF qw/is_ip $Logger/;

with 'CIF::ObservableAddressIP';

has '+otype' => (
    is      => 'ro',
    default => 'ipv4',
);

sub process {}

sub understands {
    my $self = shift;
    my $args = shift;
    
    return unless($args->{'observable'});
    return unless(is_ip($args->{'observable'}) eq 'ipv4');
    return 1;
}

__PACKAGE__->meta()->make_immutable();

1;