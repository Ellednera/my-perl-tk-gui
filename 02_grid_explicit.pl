#!/usr/bin/perl

use strict;
use warnings;
use utf8;

use Tk;

my $window = MainWindow->new;

$window->Button( -text => "Button 1" )->grid(
    $window->Button( -text => "Button 3" ),
    $window->Button( -text => "Button 5" ),
    "x",
    $window->Button( -text => "Pencils" ),
    -ipadx => 9, -ipady => 12,
    -sticky => "nsew" # need this thing to 'align' all the cells
);

$window->Button( -text => "Book" )->grid(
    "^",
    $window->Button( -text => "Pens" ),
    $window->Button( -text => "Ruler"),
    $window->Button( -text => "Markers" ),
    -ipadx => 9, -ipady => 12,
    -sticky => "nsew"
);

$window->Button( -text => "花朵" )->grid("-", "-", 
    $window->Button( -text => "Dictionary" ),
    $window->Button( # exit button
        -text => "退出", 
        -command => sub { exit }, 
        -background => "deeppink", -foreground => "pink", 
        -activebackground => "orange", -activeforeground => "brown"
    ),
    "-",
    -ipadx => 9, -ipady => 12,
    -sticky => "nsew"
);

$window->Button( -text => "\x{23F0}" )->grid( 
    -row => 0, -column => 3, 
    -sticky => "nsew"
);

# oops... :)
$window->Button( -text => "\x{2705}" )->grid( 
    -row => 0, -column => 4,
    -sticky => "se"
);

MainLoop;

# besiyata d'shmaya
