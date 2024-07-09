#!/usr/bin/perl

use strict;
use warnings;

use Tk;

my $window = MainWindow->new;

$window->Button( -text => "top" )->pack( -side => "top", -fill => "x" );
$window->Button( -text => "bottom" )->pack( -side => "bottom", -fill => "x" );
$window->Button( -text => "right" )->pack( -side => "right", -fill => "y" );

$window->Button( -text => "left" )->pack( -side => "left", -fill => "y" );

$window->Button( 
             -text => "exit", -command => sub {exit} 
         )->pack( -anchor => "c", -expand => 1, -fill => "both" );

MainLoop;

# besiyata d'shmaya
