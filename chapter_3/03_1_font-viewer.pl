#!/usr/bin/perl

use strict;
use warnings;

use Tk;
use Tk::BrowseEntry;

my $font_family = "Courier";
my $font_size = 12;
my $font_weight = "normal";
my $font_style = "roman";

my $underline = 0;
my $overstrike = 0;

my $window = MainWindow->new( -title => "Font Viewer" );
my $frame = $window->Frame->pack( -side => "top" );

# font family selection
my $font_family_be = $frame->BrowseEntry( 
    -label => "Family: ", 
    -variable => \$font_family,
    -browsecmd => \&apply_font
)->pack( -fill => "x", -side => "left" );

$font_family_be->insert( "end", sort $window->fontFamilies );

# font size selection
my $font_size_be = $frame->BrowseEntry(
    -label => "Size: ",
    -variable => \$font_size,
    -browsecmd => \&apply_font
)->pack( -side => "left" );

$font_size_be->insert( "end", (5 .. 80) );

# font weight
$frame->Checkbutton( 
    -onvalue => "bold", -offvalue => "normal",
    -text => "Weight",
    -variable => \$font_weight,
    -command => \&apply_font
)->pack( -side => "left" );

# font style
$frame->Checkbutton(
    -onvalue => "italic", -offvalue => "roman",
    -text => "Slant", -variable => \$font_style,
    -command => \&apply_font
)->pack( -side => "left" );

# underline
$frame->Checkbutton(
    -text => "Underline",
    -variable => \$underline,
    -command => \&apply_font
)->pack( -side => "left" );

# overstrike
$frame->Checkbutton(
    -text => "Overstrike",
    -variable => \$overstrike,
    -command => \&apply_font
)->pack( -side => "left" );

MainLoop;

sub apply_font {
    ...
}

# besiyata d'shmaya
