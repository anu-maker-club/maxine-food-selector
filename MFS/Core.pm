package MFS::Core;
use strict;
use warnings;

sub pop_score {
  # use as pop_score(upvotes, downvotes)
  # from http://www.evanmiller.org/how-not-to-sort-by-average-rating.html
  my $upvotes=$_[0];
  my $downvotes=$_[1];
  my $n=$upvotes+$downvotes;
  if ($n == 0){
        return 0;
  }
  my $z = 1.281;
  my $phat = 1.0*$upvotes/$n;
  my $score = ($phat + $z * $z / (2 * $n) - $z * sqrt(($phat * (1 - $phat) + $z * $z / (4 * $n)) / $n)) / (1 + $z * $z / $n);
  return $score;
}

sub food_optimisation{ # Maxine's heart
  my $menu = $_[0];
}

1;
