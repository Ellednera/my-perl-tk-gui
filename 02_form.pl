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

my $button_1 = $window->Button( -text => "left" )->form( -left => "%15", -top => "%75" );

$window->Button( 
    -text => "right" 
)->form( 
    -left => $button_1, -right => "%70", 
    -top => "%0", -bottom => "%80" 
);


MainLoop;

# besiyata d'shmaya
