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

my $button_1 = $frame_1->Button( 
    -text => "SPRING", -command => \&re_form 
)->form;

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
    
    $frame_2->Label( -text => "-leftspring" ),
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
    -text => "Run",
    -command => \&re_form,
)->grid(
    "-", "-",
    $frame_2->Button( -text => "Exit", -command => sub { exit } ),
    -pady => 10,
);


MainLoop;

sub re_form {
    my @configs = ();
    # using a hash will not work, hash keys cannot be used as scalar ref
    
    #for ( keys %$config_items ) {
    #    print $_, "=>", $config_items->{ $_ };
    #    if ( $_ eq '' ) {
    #        $config_items->{ $_ } = 0;
    #    }
    #    push @configs, ( $_, $config_items->{ $_ } );
    #}

    #print $_ . "\n" for $frame_2->gridSize();

    ###
    # top
    if ( !$top ) {
        $top = 0;
    }
    # topspring
    if ( !$top_spring ) {
        $top_spring = 0;
    }
    push @configs, ( "-top", $top, "-topspring", $top_spring);
    
    ###
    # bottom
    if ( !$bottom ) {
        $bottom = 0;
    }
    # bottomspring
    if ( !$bottom_spring ) {
        $bottom_spring = 0;
    }
    push @configs, ( "-bottom", $bottom, "-bottomspring", $bottom_spring);
    
    ###
    # left
    if ( !$left ) {
        $left = 0;
    }
    # leftspring
    if ( !$left_spring ) {
        $left_spring = 0;
    }
    push @configs, ( "-left", $left, "-leftspring", $left_spring);
    
    ###
    # right
    if ( !$right ) {
        $right = 0
    }
    # rightspring
    if ( !$right_spring ) {
        $right_spring = 0;
    }
    push @configs, ( "-right", $right, "-rightspring", $right_spring);
    
    ############################
    print "-top => $top\t", "-topspring => $top_spring\n";
    print "-bottom => $bottom\t", "-bottomspring => $bottom_spring\n";
    print "-left => $left\t", "-leftspring => $left_spring\n";
    print "-right => $right\t", "-rightspring => $right_spring\n";
    print "########################################\n";

    # configure the "SPRING" button using the new input
    $button_1->formForget();
    $button_1->form( @configs );
    print for @configs;
    print "\n";
}

# besiyata d'shmaya
