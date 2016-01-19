#!/usr/bin/env perl
use strict;
use warnings;
use MFS::Core;
use MFS::Reader;

require 'config.pl';

print MFS::Core::pop_score(1,2)."\n"; # testing
print MFS::Core::pop_score(2,4)."\n";
print MFS::Core::pop_score(200,40)."\n";
