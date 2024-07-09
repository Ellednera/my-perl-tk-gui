#!/usr/bin/perl

use strict;
use warnings;

use Tk;

my $window = MainWindow->new;


$window->Button( -text => "LEFT" )->pack( -side => "left", -fill => "y" );
$window->Button( -text => "TOP" )->pack( -side => "top", -fill => "x" );
$window->Button( -text => "RIGHT" )->pack( -side => "right", -fill => "y" );
$window->Button( -text => "BOTTOM" )->pack( -side => "bottom", -fill => "x" );

# -anchor => center must have -expand => 1
$window->Button( 
             -text => "EXIT", -command => sub {exit} 
         )->pack( -anchor => "c", -expand => 1, -fill => "both" );

MainLoop;

# besiyata d'shmaya
