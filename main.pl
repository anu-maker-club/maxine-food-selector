#!/usr/bin/env perl
use strict;
use warnings;
use MFS::Core;
use MFS::Reader;
use Data::Dumper;

# config stuff
require 'config.pl';
our $menu_filename;
our $event_filename;
our $debug;

# get event-specific settings
require $event_filename;

# debugging
if ($debug) {
  print MFS::Core::pop_score(1,2)."\n"; # testing
  print MFS::Core::pop_score(2,4)."\n";
  print MFS::Core::pop_score(200,40)."\n";
  my @menu_out=MFS::Reader::menu_import($menu_filename);
  my @tags_test=('lunch');
  print MFS::Core::pop_score(\$menu_out[0]{upvotes},\$menu_out[0]{downvotes})."\n";
  print Dumper \$menu_out[0]{tags};
  print Dumper \@tags_test;
  print MFS::Core::tag_filter($menu_out[0], @tags_test)."\n";
}
