package Term::Size;

use strict;
use Carp;
use vars qw(@EXPORT_OK @ISA $VERSION);

use AutoLoader ();
use DynaLoader ();
use Exporter ();

@ISA = qw(Exporter DynaLoader);
@EXPORT_OK = qw(chars pixels);

$VERSION = '0.1';

=head1 NAME

Term::Size - Perl extension for retrieving terminal size

=head1 SYNOPSIS

    use Term::Size;

    ($columns, $rows) = Term::Size::chars;
    ($x, $y) = Term::Size::pixels

=head1 DESCRIPTION

B<Term::Size> is a Perl module which provides a straightforward way to
retrieve the terminal size.

The function C<Term::Size::chars> returns a list of two values, which
are the current width and height respectively of the terminal, in
characters.

The function C<Term::Size::pixels> returns a list of two values, which
are the current width and height respectively of the terminal, in
pixels.

In a scalar context, both functions return the first element of the
list, that is, the terminal width.

The functions may be imported.

=head1 EXAMPLES

1. Refuse to run in a too narrow window.

    use Term::Size;

    die "Need 80 column screen" if Term::Size::chars < 80;

2. Track window size changes.

    use Term::Size 'chars';

    my $changed = 1;

    while (1) {
            local $SIG{'WINCH'} = sub { $changed = 1 };

            if ($changed) {
                    ($cols, $rows) = chars;
                    # Redraw, or whatever.
                    $changed = 0;
            }
    }

=head1 RETURN VALUES

Both functions return C<undef> if there is an error.

If the terminal size information is not available, the functions
will normally return C<(0, 0)>, but this depends on your system.  On
character only terminals, C<pixels> will normally return C<(0, 0)>.

=head1 BUGS

It only works on Unix systems.

=head1 AUTHOR

Tim Goodwin, <tim@uunet.pipex.com>, 1997-04-23.

=cut

bootstrap Term::Size $VERSION;

1;

__END__
