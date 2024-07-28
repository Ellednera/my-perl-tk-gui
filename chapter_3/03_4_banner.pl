#!/usr/bin/perl

use strict;
use warnings;

use Tk;

my $banner_text = "AaBbCcDdEeFfGgHhJj";
my $window = MainWindow->new();

my $left_frame = $window->Frame->pack(
    -side => "left", -expand => 1
);
my $fonts_select = $left_frame->Scrolled( 
    "Listbox", -scrollbars => "e", -height => 3
)->pack(
    -fill => "both", -expand => 1, -side => "top"
);
$fonts_select->insert( "end", sort $window->fontFamilies );

# hiding button
my $hiding_btn = $window->Button( -text => "<" )->pack(
    -side => "left", -fill => "y"
);

$hiding_btn->configure(
    -command => sub {
        if ( $hiding_btn->cget( -text ) eq "<" ) {
            $left_frame->packForget();
            $hiding_btn->configure( -text => ">" );
        } else {
            $left_frame->pack( 
                -before => $hiding_btn, 
                -fill => "both", -side => "left",
                -expand => 1
            );
            $hiding_btn->configure( -text => "<" );
        }
    }, 
    -font => "FreeSerif 12"
);

MainLoop;
# beisyata d'shmaya







