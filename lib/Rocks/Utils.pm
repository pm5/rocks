package Rocks::Utils;

@EXPORT_OK = qw[zip2];

sub zip2 { @_[map { $_, $_ + @_/2 } 0..(@_/2 - 1)] }

1;
