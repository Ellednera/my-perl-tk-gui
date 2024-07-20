#!/usr/bin/perl

use strict;
use warnings;

use Tk;

my $window = MainWindow->new;

my $btn_top = $window->Button( 
    -text => "top" 
)->form( 
    -left => "%0", 
    -right => "%100" # for stretching when window is resized
);

my $btn_bottom = $window->Button( 
    -text => "bottom button" 
)->form(
    -left => [ "&", $btn_top ],
    -right => "%100", # for stretching when window is resized
    -top => $btn_top
);

my $btn_bottom_2 = $window->Button(
    -text => "Btm#2"
)->form(
#    -left => "%60", # stretching doesn't seem to work with -left
    -right => [ "&", $btn_bottom ],
    -top => [ $btn_bottom, 25 ]
);

MainLoop;
# besiyata d'shmaya
