#!/usr/bin/perl

use strict;
use warnings;

use Tk;

my $bg_color = "black"; # this corresponding radiobutton to be selected if any
my $window = MainWindow->new();

$window->configure( -background => $bg_color );

for ( qw( red powderblue limegreen lightgray brown pink ) ) {
    $window->Radiobutton(
        -text => $_,
        -value => $_,
        -variable => \$bg_color,
        -command => \&change_bg_color
    )->pack( -side => "left" );
}

$window->Button( -text => "Exit", -command => sub { exit } )->pack( -side => "left" );

MainLoop;

sub change_bg_color {
    print "Background color chosen: $bg_color\n";
    $window->configure( -background => $bg_color );
}

# besiyata d'shmaya
