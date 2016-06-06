package MFS::Core;
use strict;
use warnings;
use Data::Dumper;

sub pop_score {
  # use as pop_score(int $upvotes, int $downvotes)
  # from http://www.evanmiller.org/how-not-to-sort-by-average-rating.html
  # and https://github.com/reddit/reddit/blob/master/r2/r2/lib/db/_sorts.pyx
  my $upvotes=$_[0];
  my $downvotes=$_[1];
  my $n=$upvotes+$downvotes;
  if ($n == 0){
        return 0;
  }
  my $z = 1.281; # 80% confidence interval - from reddit
  my $phat = 1.0*$upvotes/$n;
  my $score = ($phat + $z * $z / (2 * $n) - $z * sqrt(($phat * (1 - $phat) + $z * $z / (4 * $n)) / $n)) / (1 + $z * $z / $n);
  return $score;
}

sub tag_filter { #Filter items by tags.
  # Use as tag_filter(%object, @tags)
  # Returns true if object has one or more tags, else returns false
  my @obj_tags = @{$_[0]{tags}};
  my @fil_tags = $_[1];
  print Dumper \@_;
  for my $tag1 (@obj_tags){
    $tag1 =~ s/^\s+|\s+$//g;
    for my $tag2 (@fil_tags){
      $tag2 =~ s/^\s+|\s+$//g;
      if ($tag1 eq $tag2){
        return 1;
      }
    }
  }
  return 0;
}

sub random_food {
  # Parameters: @menu, $budget
  my $data=[@_];
  my $budget=pop $data;
  my @menu=$data;
  my $menu_size=scalar @menu;
  my $item_choice_num=scalar int(rand($menu_size)+0.5); # +0.5 is hax. Replace with actual round function sometime
  my @item_choice=$menu[0][$item_choice_num];
  my $cost=$item_choice[0]{cost};
  my $max_item=int($budget/$cost);
  my $item_quantity=int(rand($max_item)+1);
  $item_choice[0]{quantity}=$item_quantity;
  my @food=(@item_choice);
  return @food;
}

sub new_food_set {
  # Parameters: @menu, %food_types, $budget
  my $budget=pop;
  my @menu=shift;
  my %food_types=[@_];
  my $not_validated=1;
  my @food_set;
  while ($not_validated) {
    foreach my $type (keys %food_types){
      my $times=$food_types{$type};
      for (my $i=0; $i < $times; $i++){
        my @new_food=random_food(@menu, $budget);
        push @food_set, @new_food;
      }
    }
    my $total_cost=0;
    foreach my $food (@food_set){
      $total_cost+=$$food[0]{cost};
    }
    if ($total_cost>$budget){
      
    }
  }
  return @food_set;
}

sub choose_food { # Maxine's heart
  # Parameters: @menu, %event,
  my @menu = $_[0];
  my %event = $_[1];

}

1;
