#!/usr/bin/perl

use strict;
use Data::Dumper;

use FileHandle;
autoflush STDOUT 1;

my $fh = FileHandle->new;
$fh->autoflush();
$fh->open(">>portserver.log");

select((select(STDOUT),$| = 1)[0]);
select((select(STDERR),$| = 1)[0]);

print $fh "starting $$\n";

my $message = "";

while(my $line = <STDIN>) {
	print $fh "got: $line";

	if ($line eq "EOL\n") {
		chomp $message;

		print "PID: $$\n\n";
		print "MSG: $message\n\n";
#		select(undef,undef,undef,0.5);
		print "OK\nEOL\n";

		$message = "";
	} else {
		$message .= $line;
	}

	##die; ## for testing supervision restart
}
