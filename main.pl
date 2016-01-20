#!/usr/bin/env perl
use strict;
use warnings;
use MFS::Core;
use MFS::Reader;
use Data::Dumper;

require 'config.pl';

our $menu_filename;

print MFS::Core::pop_score(1,2)."\n"; # testing
print MFS::Core::pop_score(2,4)."\n";
print MFS::Core::pop_score(200,40)."\n";

my @tags_test=('lunch');
print Dumper \$menu_out[0]{tags};
print Dumper \@tags_test;
print MFS::Core::tag_filter($menu_out[0], @tags_test)."\n";
