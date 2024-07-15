#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

use Tk;

my $window = MainWindow->new;
my $packing_msg = "Unpack me!";
my $padding_xy = 0;

my $exit_btn = $window->Button( 
                   -text => "Exit", 
                   -command => sub { exit; },
               )->pack(
                   -fill => "both",
                   -expand => 1,
               );

my $widgets_info = $window->Button( 
                      -text => "Widgets Info", 
                      -command => \&print_widget_info 
                  )->pack(
                      -before => $exit_btn,
                      -fill => "both",
                      -expand => 1,
                  );

my $unpack_btn = $window->Button( 
                     -textvariable => \$packing_msg, 
                     -command => \&unpack_button 
                 )->pack(
                     -before => $widgets_info,
                     -fill => "both",
                     -expand => 1,
                     -side => "top",
                 );
                 
my $pack_button = $window->Button( 
                      -textvariable => \$packing_msg,
                      -command => \&pack_button,
                  );


         
my $add_padding = $window->Button(
                      -text => "Add padding",
                      -command => \&add_padding,
                  )->pack(
                      -before => $exit_btn,
                      -fill => "both",
                      -expand => 1,
                  );
         
my $reduce_padding = $window->Button(
                         -text => "Reduce padding",
                         -command => \&reduce_padding,
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
    $pack_button->pack( -before => $widgets_info, -fill => "both", -expand => 1 );
}

sub pack_button {
    #print "pack_button subroutine called\n";
    $unpack_btn->pack( -before => $widgets_info, -fill => "both", -expand => 1 );
    $packing_msg = "Unpack this new button!";
    $pack_button->packForget;
}

sub print_widget_info {
    my @widgets_info = $window->packSlaves();
    for ( @widgets_info ) {
        say $_, "\n\t", $_->packInfo, "\n";
    }
}

sub add_padding {
    $padding_xy += 5;
    my @widgets_info = $window->packSlaves();
    for ( @widgets_info ) {
        $_->pack( -ipadx => $padding_xy, -ipady => $padding_xy );
    }
}

sub reduce_padding {
    if ( $padding_xy >= 5 ) {
        $padding_xy -= 5;
    } else {
        $padding_xy = 0;
    }
    my @widgets_info = $window->packSlaves();
    for ( @widgets_info ) {
        $_->pack( -ipadx => $padding_xy, -ipady => $padding_xy );
    }
}

# besiyata d'shmaya
