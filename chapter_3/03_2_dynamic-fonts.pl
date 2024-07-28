#!/usr/bin/perl

use strict;
use warnings;

use Tk;
use Tk::TList;
use Tk::ROText;

my $window = MainWindow->new( -title => "Fonts" );
$window->minsize( 700, 400 );

my $tlist = $window->Scrolled( 
    "TList", 
    -font => [ "FreeSerif", "12" ],
    -command => \&show_font
)->pack(
    -fill => "both",
    -expand => 1
);


for ( sort $window->fontFamilies ) {
    $tlist->insert( "end", -itemtype => "text", -text => $_ );
}

MainLoop;

sub show_font {
    
    
    
}

# besiyata d'shmaya




