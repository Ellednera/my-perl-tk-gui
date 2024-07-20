#!/usr/bin/perl

use strict;
use warnings;

use Tk;

my $window = MainWindow->new;

my $btn_1 = $window->Button( -text => "small" )->form( -left => "%10" );

$window->Button(
    -text => "big"
)->form( 
    -left => [$btn_1, 20], -right => "%70",
    -top => "%25", -bottom => "%80"
);

MainLoop;

# besiyata d'shmaya
