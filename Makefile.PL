
use 5;
use ExtUtils::MakeMaker;

my $is_win32 = ($^O =~ /MSWin/i);

my $EUMM_VERSION = eval $ExtUtils::MakeMaker::VERSION;

WriteMakefile(
	'NAME'          => 'Term::Size',
	'VERSION_FROM'  => 'Size.pm',
	'PREREQ_PM'     => {
		($is_win32 ? (
			'Term::Size::Win32' => 0, # Win32 only
        ) : (
			'Term::Size::Unix' => 0
		)),
		'Test::More'            => 0, # build
	}, 
	($] >= 5.005 ? (
		'ABSTRACT_FROM' => 'Size.pm',
		'AUTHOR'        => 'Tim Goodwin <tim@uunet.pipex.com>'
	) : ()),
	($EUMM_VERSION >= 6.30_01 ? (
		LICENSE => 'perl', 
		EXTRA_META => "dynamic_config: 1\n",
    ) :())

);


