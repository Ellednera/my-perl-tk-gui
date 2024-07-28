#!/usr/bin/perl

use strict;
use warnings;

use 5.010;

use Tk;
use Tk::Font;

my $window = MainWindow->new;

$window->fontCreate( "some_font_1", -family => "FreeSerif", -size => 36 );

my %font_info = $window->fontActual( "some_font_1" );
say %font_info;

my $slant = $window->fontActual( "some_font_1", -slant );
say "Slant: $slant";

say $_->actual( -family ) for $window->fontNames;

# besiyata d'shmaya
