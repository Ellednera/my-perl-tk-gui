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
)->place( -relx => 0.5, -rely => 0.5, -anchor => "center", -width => 150 );

# resize the window to see -relwidth and -relheight in effect
$window->Button( 
    -text => "-anchor => sw" 
)->place( -x => 150, "-y" => 150, -anchor => "sw", -relwidth => 0.1, -relheight => 0.1 );

MainLoop;
# besiyata d'shmaya
