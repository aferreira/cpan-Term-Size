#ifdef __cplusplus
extern "C" {
#endif

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <sys/termios.h>

#ifdef __cplusplus
}
#endif

MODULE = Term::Size		PACKAGE = Term::Size

PROTOTYPES: ENABLE

void
chars()
	
	PPCODE:
	struct winsize w;

	if (ioctl(0, TIOCGWINSZ, &w) == -1)
		XSRETURN_NO;

	XPUSHs(sv_2mortal(newSViv(w.ws_col)));
	if (GIMME != G_SCALAR)
		XPUSHs(sv_2mortal(newSViv(w.ws_row)));

void
pixels()

	PPCODE:
	struct winsize w;

	if (ioctl(0, TIOCGWINSZ, &w) == -1)
		XSRETURN_NO;

	XPUSHs(sv_2mortal(newSViv(w.ws_xpixel)));
	if (GIMME != G_SCALAR)
		XPUSHs(sv_2mortal(newSViv(w.ws_ypixel)));
