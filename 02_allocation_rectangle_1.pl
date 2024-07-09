#!/usr/bin/perl

use strict;
use warnings;

use Tk;

my $window = MainWindow->new;

$window->Button( -text => "Top" )->pack( -side => "top" );
$window->Button( -text => "Left" )->pack( -side => "left" );
$window->Button( -text => "Bottom" )->pack( -side => "bottom" );
$window->Button( -text => "Right" )->pack( -side => "right" );

$window->Button( 
            -text => "Exit", 
            -command => sub { exit } 
        )->pack( -anchor => "c" );

MainLoop;

# besiyata d'shmaya
