#!/usr/bin/perl

use strict;
use warnings;

use Tk;

my $window = MainWindow->new;

$window->Button( -text => "top" )->pack( -side => "top");
$window->Button( -text => "bottom" )->pack( -side => "bottom" );
$window->Button( -text => "right" )->pack( -side => "right" );

         
$window->Button( -text => "left" )->pack( -side => "left" );

$window->Button( 
             -text => "exit", -command => sub {exit} 
         )->pack( -anchor => "c", -expand => 1 );

MainLoop;

# besiyata d'shmaya
