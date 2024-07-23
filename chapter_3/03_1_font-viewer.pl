#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

use Tk;
use Tk::BrowseEntry;

my $font_family = "Courier";
my $font_size = 12;
my $font_weight = "normal";
my $font_style = "roman";
my $sample_text = "Lorem ipsum dolor sit amet...";

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

# sample text
my $text_display = $window->Entry( 
    -textvariable => \$sample_text 
)->pack( -fill => "x");

apply_font();

MainLoop;

sub apply_font {
    #print "something is clicked\n";

    #print $_ for $text_display->configure( "-font" );
    #print $font_family, "\n";
    #print $font_size, "\n";
    
    # this part is not really working, documentation missing too
    $text_display->configure(
        -font => [
            -family => $font_family,
            -size => $font_size,
            -weight => $font_weight,
            -slant => $font_style,
            -underline => $underline,
            -overstrike => $overstrike
        ]
    );
}

# besiyata d'shmaya
