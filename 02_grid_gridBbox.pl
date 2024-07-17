#!/usr/bin/perl

use strict;
use warnings;
use 5.010;
use utf8;

use Tk;

binmode STDOUT, ":encoding(UTF-8)";

my $window = MainWindow->new;

my $row_1 = $window->Button( -text => "Button 1" )->grid(
    $window->Button( -text => "Button 3" ),
    $window->Button( -text => "Button 5" ),
    -ipadx => 9, -ipady => 12,
    -sticky => "nsew" # need this thing to 'align' all the cells
);

$window->Button( -text => "Book" )->grid(
    $window->Button( -text => "Pens" ),
    $window->Button( -text => "Ruler"),
    -ipadx => 9, -ipady => 12,
    -sticky => "nsew"
);

$window->Button( -text => "花朵" )->grid(
    $window->Button( -text => "Dictionary" ),
    $window->Button( # exit button
        -text => "退出", 
        -command => sub { exit }, 
        -background => "deeppink", -foreground => "pink", 
        -activebackground => "orange", -activeforeground => "brown"
    ),
    -ipadx => 9, -ipady => 12,
    -sticky => "nsew"
);

$window->Button( 
    -text => "Widget Info", 
    -command => \&geometry_info 
)->grid( 
    -sticky => "nsew", 
    -columnspan => 3, 
    -ipadx => 9, -ipady => 12, 
);

$window->Button( 
    -text => "Bounding Box Info (Exit button)", 
    -command => \&bounding_box_info
)->grid( 
    -sticky => "nsew", 
    -columnspan => 3, 
    -ipadx => 9, -ipady => 12, 
);

{
    my ($col, $row) = $window->gridSize();

    for ( 0..( $col-1 ) ) {
        $window->gridColumnconfigure( $_, -weight => 1 );
    }

    for ( 0..( $row-1 ) ) {
        $window->gridRowconfigure( $_, -weight => 1 );
    }
}

MainLoop;

# say "Hello world"; # no output in console after MainLoop
# so geomtery related functions will always give 0 if directly called before MainLoop

sub bounding_box_info {
    my ( $x_offset, $y_offset, $w, $h ) = $window->gridBbox(2, 2);
    say "Exit button";
    say "  x offset: ", $x_offset;
    say "  y offset: ", $y_offset;
    say "  width: ", $w;
    say "  height: ", $h;
}

sub geometry_info {
    for ( $window->gridSlaves( -row => 2 ) ) {
        say "$_ : ", $_->cget( "-text" );
        say "  Geometry: ", $_->geometry();
        say "  Height: ", $_->reqheight, ", Width: ", $_->reqwidth;
        say "  Location: (", $_->x, ", ", $_->y, ")";
        say "  ", $_->gridInfo();
        say "";
    }
}


# besiyata d'shmaya
