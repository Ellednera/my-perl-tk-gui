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
    -selectmode => "browse",
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
    my $index = $_[0]; #print $index . "\n";
    #print $_ . "\n" for @_;
    #print $tlist->info;
    my $name = $tlist->entrycget( $index, -text );
    
    my $popup_window = $window->Toplevel( -title => $name );
    my $text = $popup_window->Scrolled( 
        "ROText", -wrap => "none" 
    )->pack(
        -expand => 1, -fill => "both"
    );

    # create a tag name, will be used later on
    $text->tagConfigure( "number", -font => [ "FreeSerif", "12" ] );
    $text->tagConfigure( "selected-font", -font => [ $name, "20" ] );
    $text->insert( "end", "abcdefghijklmnopqrstuvwxyzABCDEFG...", "selected-font" );
    
    
}

# besiyata d'shmaya




