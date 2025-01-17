#!/usr/bin/perl

use strict;
use warnings;

use Tk;

my $window = MainWindow->new();

my $check_btn_value = "hello";

# actual button
my $check_btn = $window->Checkbutton(
    -text => "Checkbutton",
    -variable => \$check_btn_value,
    -onvalue => "hello", -offvalue => "bye",
    -command => sub { print "Checkbutton value = $check_btn_value\n"; }
)->pack( -side => "top" );

# on button
$window->Button(
    -text => "Turn On",
    -command => [ \&change_value, "on" ]
)->pack( -side => "left", -fill => "both", -expand => 1 );

# off button
$window->Button(
    -text => "Turn Off",
    -command => [ \&change_value, "off" ]
)->pack( -side => "left", -fill => "both", -expand => 1 );

MainLoop;

# this is working correctly, but something is wrong
sub change_value {
    #print $_[0];
    #$check_btn_value = undef;
    if ( $_[0] eq "on" ) {
        print "turning on...\n";
        $check_btn->deselect(); # ???
        #$check_btn_value = "hello"; # not working
    } else {
        print "turning off...\n";
        $check_btn->select; # ???
        #$check_btn_value = "bye"; # not working
    }
    #$check_btn->toggle; # not working
    $check_btn->invoke();
}

# besiyata d'shmaya
