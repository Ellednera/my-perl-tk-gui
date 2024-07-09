#!/usr/bin/perl

use strict;
use warnings;

use Tk;

my $window = MainWindow->new;



$window->Button( -text => "Top" )->pack( -side => "top" );
$window->Button( -text => "Bottom" )->pack( -side => "bottom" );
$window->Button( -text => "Left" )->pack( -side => "left" );
$window->Button( -text => "Right" )->pack( -side => "right" );



MainLoop;

# besiyata d'shmaya
