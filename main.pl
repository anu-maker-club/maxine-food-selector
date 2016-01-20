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
our $event;

# debugging
if ($debug) {
  print "Testing menu_import\n";
  my @menu_out=MFS::Reader::menu_import($menu_filename);
  print "Testing pop_score\n";
  print MFS::Core::pop_score(1,2)."\n"; # testing
  print MFS::Core::pop_score(2,4)."\n";
  print MFS::Core::pop_score(200,40)."\n";
  print MFS::Core::pop_score(\$menu_out[0]{upvotes},\$menu_out[0]{downvotes})."\n";
  print "Testing tag_filter\n";
  my @tags_test1=('lunch');
  my @tags_test2=('tea');
  print Dumper \@menu_out;
  print MFS::Core::tag_filter($menu_out[0], @tags_test1)."\n";
  print MFS::Core::tag_filter($menu_out[0], @tags_test2)."\n";
  print "Testing random_food\n";
  print Dumper \$event;
  print Dumper \$$event{budget};
  my @test_food=MFS::Core::random_food(@menu_out, $$event{budget});
  print Dumper \@test_food;
}
