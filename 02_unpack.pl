#!/usr/bin/perl

use strict;
use warnings;

use Tk;

my $window = MainWindow->new;
my $packing_msg = "Unpack me!";

my $unpack_btn = $window->Button( 
                     -textvariable => \$packing_msg, 
                     -command => \&unpack_button 
                 )->pack(
                     -fill => "both",
                     -expand => 1,                    
                 );
                 
my $pack_button = $window->Button( 
                      -textvariable => \$packing_msg,
                      -command => \&pack_button,
                  );

my $exit_btn = $window->Button( 
                   -text => "Exit", 
                   -command => sub { exit; },
               )->pack(
                   -fill => "both",
                   -expand => 1,
               );

MainLoop;
########################################################
sub unpack_button {
    $unpack_btn->packForget();
    $packing_msg = "Pack a new button";
    $pack_button->pack( -before => $exit_btn, -fill => "both", -expand => 1 );
}

sub pack_button {
    #print "pack_button subroutine called\n";
    $unpack_btn->pack( -before => $exit_btn, -fill => "both", -expand => 1 );
    $packing_msg = "Unpack this new button!";
    $pack_button->packForget;
}

# besiyata d'shmaya
