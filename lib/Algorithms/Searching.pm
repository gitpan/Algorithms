package Algorithms::Searching;

use strict;
use warnings;

our $VERSION = '0.02';



BEGIN { 
	use Exporter();
	use Algorithms::Sorting;
	our @ISA=qw(Exporter Algorithms::Sorting);
	our @EXPORT=qw(&SequentialSearch &BinarySearch);
}


sub _filter {
        my $array=shift;

        my @charstrings=grep(/[a-zA-Z]/, @$array);
        my @numbers=grep(/^-?\d*\.?\d*$/, @$array);

        return \@charstrings, $#charstrings+1, \@numbers, $#numbers+1;
}

sub SequentialSearch {
	my ($list, $key)=@_;
	my $size=$#$list+1;
	my $t;
	
	for($t=0; $t<$size; ++$t) {
		return $t if("$key" eq "$list->[$t]");
	}
	return -1;
}

sub BinarySearch {
	my ($list, $key)=@_;
	my @nlist=@$list;
	
	QuickSort(\@nlist);
	my ($c, $cc, $n, $nc)=_filter(\@nlist);
	my ($low, $high, $mid);
	if($key=~/[a-zA-Z]/) {	
		$low=0;
		$high=$cc-1;
		while($low<=$high) {
			$mid=int(($low+$high)/2);
			if($key lt $c->[$mid]) {
				$high=$mid-1;
				next;
			} 
			if($key gt $c->[$mid]) {
				$low=$mid+1;
				next;
			}
			return 1;
		}
	} else {
		$low=0;
		$high=$nc-1;
		while($low<=$high) {
			$mid=int(($low+$high)/2);
			if($key lt $n->[$mid]) {
				$high=$mid-1;
				next;
			} 
			if($key gt $n->[$mid]) {
				$low=$mid+1;
				next;
			}
			return 1;
		}
	}
	return -1;
}
		

return 1;

END {}


__END__

=head1 NAME

Algorithms::Searching - Provide Sequential Search & Binary Search methods.

=head1 SYNOPSIS

  use Algorithms::Searching;
  
  my @list=(1, "hello", 123, "abc");
  my $key="abc";
  
  #it will return index of the key if found, else -1
  my $index=SequentialSearch(\@list, $key);
  
  #it will return 1 if found, else -1
  my $return=BinarySearch(\@list, $key);  
  

=head1 DESCRIPTION

In this module, there are two very general searching algorithms(Sequential Search & Binary Search) written for Perl.

=over 4

=item SequentialSearch

The subroutine performs sequential search on the list which may contain number or/and characters. In return gives index of the item searching for if found, else -1.

	my $index=SequentialSearch(\@array, $key);

=item BinarySearch

The subroutine performs the Binary search method on the list which may contain number or/and characters. In return it gives 1 if found, else -1.

	my $return=BinarySearch(\@array, $key);

Here, function returns 1 on success instead of index, because binary search can be performed on sorted array only. Therefore, before operation starts, BinarySearch() function sorts the array using Quick Sort algorithm.


=back


=head1 SEE ALSO

Algorithms::Sorting and Algorithms

=head1 AUTHOR

Vipin Singh, E<lt>vipinsingh211@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013 by Vipin Singh

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.3 or,
at your option, any later version of Perl 5 you may have available.


=cut
