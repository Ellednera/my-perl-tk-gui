#!/usr/bin/perl

use strict;
use warnings;

use Tk;

my $nice_window = MainWindow->new;

$nice_window->title( "Nice Window" );
$nice_window->Label( -text => "List of Ingredients" )->pack;


$nice_window->Button( 
    -text => "Exit",
    -command => sub { exit }
)->pack(
    -side => "bottom",
    -expand => 1,
    -fill => "x"
);

$nice_window->Checkbutton( -text => "Eggs" )->pack( 
                  -side => "left", -expand => 1
              );
$nice_window->Checkbutton( -text => "Flour" )->pack( 
                  -side => "left", -expand => 1
              );
$nice_window->Checkbutton( -text => "Sugar" )->pack(
                  -side => "left", -expand => 1
              );
$nice_window->Checkbutton( -text => "Chocolate" )->pack(
                  -side => "left", -expand => 1
              );
$nice_window->Checkbutton( -text => "Strawberries" )->pack(
                  -side => "left", -expand => 1
              );

MainLoop;

# besiyata d'shmaya

