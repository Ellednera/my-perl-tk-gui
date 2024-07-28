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
############################################
my $text_display = $window->Entry(
    -textvariable => \$banner_text,
    -width => 12, 
    -font => "FreeMono 55", # default display font
    -relief => "raised",
    -highlightthickness => 0,
)->pack(
    -expand => 1, -fill => "x", -side => "left"
);
############################################
$fonts_select->bind(
    "<Button>",
    sub {
        $text_display->configure(
            -font => "{". $fonts_select->get( $fonts_select->curselection ) ."} 80"
        );
    }
);

my $repeat_id = $window->repeat( 300, \&shift_banner );
my $button_frame = $left_frame->Frame->pack( -side => "bottom", -fill => "y" );

# start button
my $start_btn;
$start_btn = $button_frame->Button( 
    -text => "Start",
    -command => sub {
        $repeat_id = $window->repeat( 300, \&shift_banner );
        $start_btn->configure( -state => "disabled" );
    },
    -state => "disabled"
)->pack( -side => "left", -padx => 3 );

# stop button
my $stop_btn = $button_frame->Button(
    -text => "Stop",
    -command => sub {
        $repeat_id->cancel();
        $start_btn->configure( -state => "normal" );
    }
)->pack(
    -side => "left", -padx => 3
);

MainLoop;

sub shift_banner {
    $banner_text = substr( $banner_text, 1 ) . substr( $banner_text, 0, 1 );
}

# beisyata d'shmaya







