#!/usr/bin/perl

use strict;
use warnings;

use Tk;

my $window = MainWindow->new;


$window->Button( 
             -text => "LEFT"
         )->pack(
             -side => "left", -fill => "y", -ipadx => 20
         );
         
$window->Button(
             -text => "TOP"
         )->pack(
             -side => "top", -fill => "x",  -ipady => 20
         );
         
$window->Button( 
             -text => "RIGHT" 
         )->pack( 
             -side => "right", -fill => "y", -ipadx => 20
         );
$window->Button( 
             -text => "BOTTOM"
         )->pack(
             -side => "bottom", -fill => "x", -ipady => 20
         );

# -anchor => center must have -expand => 1
$window->Button( 
             -text => "EXIT", -command => sub {exit} 
         )->pack( 
             -anchor => "c", -expand => 1, -fill => "both",
             -ipadx => 50, -ipady => 50
         );

MainLoop;

# besiyata d'shmaya
