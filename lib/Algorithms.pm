package Algorithms;

use strict;
use warnings;

our $AUTOLOAD;
our $VERSION = '0.02';

BEGIN {
	use Exporter;
	our @ISA=qw/Exporter/;
	our @EXPORT=qw/&AUTOLOAD/;
}

sub AUTOLOAD {
	my $subroutine=$AUTOLOAD;
	$subroutine=~s/.*:://;

	if($subroutine=~/Search/) {
		no strict 'refs';
		require Algorithms::Searching;
		my $module='Algorithms::Searching';
                my $callme=$module.'::'.$subroutine;

		&{$callme}(@_);
	}

	if($subroutine=~/Sort/) {
		no strict 'refs';
		require Algorithms::Sorting;
		my $module='Algorithms::Sorting';
		my $callme=$module.'::'.$subroutine;

		&{$callme}(@_);
	}
}

return 1;

END {}

__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Algorithms - Provide bunch of famous algorithms for Sorting and Searching.

=head1 SYNOPSIS

  use Algorithms;
  
  my @list=(1, "hello", 123, "abc");
    
  BubbleSort(\@list);
  print "@list\n"; #will print the sorted list.

  or

  use Algorithms;
  
  my @list=(1, "hello", 123, "abc");
  my $key="abc";
  
  #it will return index of the key if found, else -1
  my $index=SequentialSearch(\@list, $key);
  
  #it will return 1 if found, else -1
  my $return=BinarySearch(\@list, $key); 


=head1 DESCRIPTION

In this module, there are many very general sorting algorithms written for Perl. Those are

        Bubble Sort
        Shaker Sort
        Selection Sort
        Insertion Sort
        Shell Sort
        Quick Sort

And, there are two very general searching algorithms(Sequential Search & Binary Search) written for Perl.


=head1 SEE ALSO

Algorithms::Sorting and Algorithms::Searching

=head1 AUTHOR

Vipin Singh, E<lt>vipinsingh211@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013 by Vipin Singh

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.3 or,
at your option, any later version of Perl 5 you may have available.


=cut
