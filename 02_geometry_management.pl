#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

use Tk;
use Tk::CheckButton;

my $bad_window = MainWindow->new;
my $nice_window = MainWindow->new;

# calling pack without any options
$bad_window->title( "Bad Window" );
$bad_window->Label( -text => "List of Items Available" );

$bad_window->CheckButton( -text => "Pen" )->pack;
$bad_window->CheckButton( -text => "Books" )->pack;
$bad_window->CheckButton( -text => "Bottle" )->pack;
$bad_window->CheckButton( -text => "Bread" )->pack;

$bad_window->Button( 
    -text => "Exit", 
    -command => sub { exit },
)->pack;

MainLoop;
# besiyata d'shmaya
