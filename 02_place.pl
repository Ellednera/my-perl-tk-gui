#!/usr/bin/perl

use strict;
use warnings;

use Tk;

my $window = MainWindow->new;

$window->Button(
    -text => "Exit",
    -command => sub { exit }
)->place( -x => 5, "-y" => 5 );

$window->Button(
    -text => "Exit",
    -command => sub { exit }
)->place( -x => 25, "-y" => 10 );

$window->Button( 
    -text => "Relative place"
)->place( -relx => 0.5, -rely => 0.5, -anchor => "center" );

$window->Button( 
    -text => "-anchor => sw" 
)->place( -x => 100, "-y" => 150, -anchor => "sw" );

MainLoop;
# besiyata d'shmaya
