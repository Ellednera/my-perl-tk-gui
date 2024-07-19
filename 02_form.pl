#!/usr/bin/perl

use strict;
use warnings;

use Tk;

my $window = MainWindow->new();

for ( 1..5 ) {
    $window->Button( 
        -text => $_ * 7 
    )->form(
        -left => "%" . $_ * 10,
        -top => "%" . $_ * 5
    );
}

# Buttons at (10, 5), (20, 10), (30, 15), (40, 20), (50, 25)

MainLoop;

# besiyata d'shmaya
