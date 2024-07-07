#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

use Tk;

my $window = MainWindow->new;

$window->title( "Hello world!" );
$window->Button( 
    -text => "Close",
    -command => \&close,
)->pack;

MainLoop;

sub close {
    say "Program closed";
    exit;
}

# besiyata d'shmaya
