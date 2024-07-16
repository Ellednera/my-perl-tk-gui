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
                            -variable => \$values[$_],
                            #-browsecmd => \$repack,
                       )->pack();
}

$frame->Button(
    -text => "Repack",
    -command => \&repack,
)->pack(
    -anchor => "center",
);

MainLoop;


sub repack{
    ...
}

# besiyata d'shmaya




