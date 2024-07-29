#!/usr/bin/perl

use strict;
use warnings;

use Tk;

my @built_in_bitmaps = qw( error gray12 gray25 gray50 gray75 hourglass
                           info questhead question warning Tk transparent );

my $window = MainWindow->new();

for ( @built_in_bitmaps ) {
    $window->Button( 
        -bitmap => $_,
        -command => [ \&on_click, $_ ]
    )->pack( -side => "left", -fill => "both", -expand => 1 );
}

MainLoop;

sub on_click {
    print "Button '", $_[0], "' clicked...\n";
}

# besiyata d'shamaya
