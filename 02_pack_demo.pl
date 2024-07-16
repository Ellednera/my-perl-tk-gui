#!/usr/bin/perl

use strict;
use warnings;

use Tk;
use Tk::BrowseEntry;

my $total_widgets = 3;

my $window = MainWindow->new( -title => "Demo for 'Pack'" );

my $frame = $window->Frame( 
                -borderwidth => 2,
                -relief => 'groove',
            )->pack(
                -side => "top",
                -fill => "x",
            );

#$frame->BrowseEntry();

my @values; # as placeholders

for ( 0..$total_widgets ) {
    $values[ $_ ] = "top";
    my $browse_entry = $frame->BrowseEntry(
                            -label => "Widget $_",
                            -choices => [ "left", "right", "top", "bottom" ],
                            -autolimitheight => 1,
                            -variable => \$values[$_],
                            -browsecmd => \&repack,
                       )->pack();
}

$frame->Button(
    -text => "Repack",
    -command => \&repack,
)->pack(
    -anchor => "center",
);


my $top_level = $window->Toplevel( -title => "Output" );

my $count = 0;
for ( @values ) {
    my $button = $top_level->Button(
        -text => "Widget ".$count++.": $_",
    )->pack(
        -side => $_,
        -fill => "both",
        -expand => 1,
    );
}

MainLoop;


sub repack{
    my @widgets = $top_level->packSlaves();
    
    for ( @widgets ) {
        $_->packForget();
    }
    
    my $number = 0;
    for ( @widgets ) {
        $_->configure( -text => "$number: $values[ $number ]" );
        $_->pack(
            -side => $values[ $number++ ],
            -fill => "both",
            -expand => 1
        );
    }
}

# besiyata d'shmaya




