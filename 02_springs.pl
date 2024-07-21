#!/usr/bin/perl

use strict;
use warnings;

use Tk;

my $window = MainWindow->new( -title => "Form - Springs" );

my $frame_1 = $window->Frame(
    -borderwidth => 2, -relief => "groove"
)->pack(
    -side => "bottom", -expand => 1, -fill => "both"
);

my $button_1 = $frame_1->Button( -text => "SPRING", -command => \&reForm )->form;

##################################################

my ($top, $top_spring, $bottom, $bottom_spring, 
    $left, $left_spring, $right, $right_spring);

my $frame_2 = $window->Frame->pack( -side => "top", -fill => "x" );

###
$frame_2->Label( -text => "-top" )->grid(
    $frame_2->Entry( -textvariable => \$top ), 
    
    $frame_2->Label( -text => "-topspring" ),
    $frame_2->Entry( -textvariable => \$top_spring ),
    
    # configs
    -sticky => "w", -padx => 2, -pady => 5
);

###
$frame_2->Label( -text => "-bottom" )->grid(
    $frame_2->Entry( -textvariable => \$bottom ),
    
    $frame_2->Label( -text => "-bottomspring" ),
    $frame_2->Entry( -textvariable => \$bottom_spring ),
    
    # configs
    -sticky => "w", -padx => 2, -pady => 5
);

###
$frame_2->Label( -text => "-left" )->grid(
    $frame_2->Entry( -textvariable => \$left ), 
    
    $frame_2->Label( -text => "-topspring" ),
    $frame_2->Entry( -textvariable => \$left_spring ),
    
    # configs
    -sticky => "w", -padx => 2, -pady => 5
);

###
$frame_2->Label( -text => "-right" )->grid(
    $frame_2->Entry( -textvariable => \$right ),
    
    $frame_2->Label( -text => "-rightspring" ),
    $frame_2->Entry( -textvariable => \$right_spring ),
    
    # configs
    -sticky => "w", -padx => 2, -pady => 5
);

##################################################
### results for spring
$frame_2->Button( 
    -text => "Go",
    -command => \&re_form,
)->grid(
    "-", "-", "-",
    -pady => 10,
);


MainLoop;

sub re_form {
    #print $_ . "\n" for $frame_2->gridSize();
}



# besiyata d'shmaya
