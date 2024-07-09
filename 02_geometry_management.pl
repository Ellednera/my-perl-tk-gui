#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

use Tk;

my $bad_window = MainWindow->new;
my $nice_window = MainWindow->new;

# calling pack without any options
$bad_window->title( "Bad Window" );
$bad_window->Label( -text => "List of Items Available" )->pack;

$bad_window->Checkbutton( -text => "Pen" )->pack;
$bad_window->Checkbutton( -text => "Books" )->pack;
$bad_window->Checkbutton( -text => "Bottle" )->pack;
$bad_window->Checkbutton( -text => "Bread" )->pack;

$bad_window->Button( 
    -text => "Exit", 
    -command => sub { exit },
)->pack;

# a nicer window
$nice_window->title( "Nice Window" );
$nice_window->Label( -text => "List of Ingredients" )->pack;

$nice_window->Checkbutton( -text => "Eggs" )->pack( 
                  -side => "left",
              );
$nice_window->Checkbutton( -text => "Flour" )->pack( 
                  -side => "left",
              );
$nice_window->Checkbutton( -text => "Sugar" )->pack(
                  -side => "left",
              );
$nice_window->Checkbutton( -text => "Chocolate" )->pack(
                  -side => "left",
              );
$nice_window->Checkbutton( -text => "Strawberries" )->pack(
                  -side => "left", -expand => 1
              );

# button not packed at the bottom
$nice_window->Button( 
    -text => "Exit",
    -command => sub { exit }
)->pack(
    -side => "bottom",
    -expand => 1,
    -fill => "x"
);

MainLoop;
# besiyata d'shmaya



