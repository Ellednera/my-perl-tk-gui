#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

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

$window->Button( 
             -text => "Widgets Info", 
             -command => \&print_widget_info 
         )->pack(
             -before => $exit_btn,
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

sub print_widget_info {
    my @widgets_info = $window->packSlaves();
    for ( @widgets_info ) {
        say $_, "\n\t", $_->packInfo, "\n";
    }
}

# besiyata d'shmaya
