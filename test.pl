# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

BEGIN {print "1..5\n";}
END {print "not ok 1\n" unless $loaded;}
use Term::Size;
$loaded = 1;
print "ok 1\n";

@chars = Term::Size::chars;
@chars == 2 or print 'not ';
print "ok 2\n";

$cols = Term::Size::chars;
$cols == $chars[0] or print 'not ';
print "ok 3\n";

@pixels = Term::Size::pixels;
@pixels == 2 or print 'not ';
print "ok 4\n";

$x = Term::Size::pixels;
$x == $pixels[0] or print 'not ';
print "ok 5\n";

print "\nThis terminal is $chars[0]x$chars[1] characters,\n";
print "  and $pixels[0]x$pixels[1] pixels.\n";
