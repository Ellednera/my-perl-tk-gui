#!/usr/bin/perl

use strict;
use warnings;

use Tk;

my $window = MainWindow->new();

my $check_btn_value = 0;

# actual button
my $check_btn = $window->Checkbutton(
    -text => "Checkbutton",
    -variable => \$check_btn_value,
    -command => sub { print "Checkbutton clicked, value = $check_btn_value\n"; }
)->pack( -side => "top" );

# on button
$window->Button(
    -text => "Turn On",
    -command => sub { $check_btn_value = 1 }
)->pack( -side => "left", -fill => "both", -expand => 1 );

# off button
$window->Button(
    -text => "Turn Off",
    -command => sub { $check_btn_value = 0 }
)->pack( -side => "left", -fill => "both", -expand => 1 );

MainLoop;
# besiyata d'shmaya
