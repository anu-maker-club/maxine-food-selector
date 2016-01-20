package MFS::Reader;
use strict;
use warnings;

sub menu_import {
  # menu_import(filename of CSV menu)
  # from http://stackoverflow.com/a/3065232
  # and http://stackoverflow.com/a/14407167
  # Standard menu entry: $name, $cost, $satiation, @tags, $upvotes, $downvotes
  my $menu_filename=$_[0];
  my @menu;
  open(my $menu_fh, '<', $menu_filename) or die "Can't read file '$menu_filename' [$!]\n";
  my $menu_header = <$menu_fh>; # eliminate first line
  while (my $line = <$menu_fh>) {
      my %menu_entry;
      my ($name,$cost,$satiation,$tags,$upvotes,$downvotes) = (split(',', $line));
      $name =~ s/^\s+|\s+$//g; # from http://perlmaven.com/trim
      $menu_entry{name}=$name;
      $menu_entry{cost}=$cost;
      $menu_entry{satiation}=$satiation;
      my @tags=(split('#', $tags));
      @{$menu_entry{tags}}=@tags;
      $menu_entry{upvotes}=$upvotes;
      $menu_entry{downvotes}=$downvotes;
      push @menu, {%menu_entry};
  }
  return @menu;
}

1;
