package Term::ANSIColor::Solarized;
use strict;
use warnings;

use vars qw(@ISA @EXPORT @EXPORT_OK);

# ABSTRACT: Solarized color names for Term::ANSIColor
# VERSION

use Exporter ();
BEGIN {
    @ISA         = qw( Exporter );
    @EXPORT      = qw( color );
}

use Term::ANSIColor ();

# These are extra color mappings
# Don't bother with trivial mappings (eg. red => 'red')
my %color_map = (
    base03     => 'bright_black',
    base02     => 'black',
    base01     => 'bright_green',
    base00     => 'bright_yellow',
    base0      => 'bright_blue',
    base1      => 'bright_cyan',
    base2      => 'white',
    base3      => 'bright_white',
    orange     => 'bright_red',
    violet     => 'bright_magenta',
    on_base02  => 'on_black',
    on_base2   => 'on_white',
);

sub color {
    return '' if defined $ENV{ANSI_COLORS_DISABLED};
    my @codes = map { $color_map{$_} || $_ }
                map { split }
                    @_;
    return Term::ANSIColor::color(@codes);
}

1;
