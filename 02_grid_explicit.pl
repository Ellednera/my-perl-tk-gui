#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use 5.010;

use Tk;

my $window = MainWindow->new;

my $row_1 = $window->Button( -text => "Button 1" )->grid(
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

#print "$_\n" for $window->gridSize();
{
    my ($col, $row) = $window->gridSize();

    for ( 0..( $col-1 ) ) {
        $window->gridColumnconfigure( $_, -weight => 1 );
    }

    for ( 0..( $row-1 ) ) {
        $window->gridRowconfigure( $_, -weight => 1 );
    }
    
    #say for $row_1->gridBbox();
    #my ( $x_offset, $y_offset, $w, $h ) = $window->gridBbox(5, 3);
    #say "Exit button";
    #say "  x offset: ", $x_offset;
    #say "  offset: ", $y_offset;
    #say "  width: ", $w;
    #say "  height: ", $h;
}
MainLoop;

# besiyata d'shmaya
