use ExtUtils::MakeMaker;

WriteMakefile(
	'NAME'		=> 'Term::Size',
	'VERSION_FROM'	=> 'Size.pm',
	'PREREQ_PM'         => {
		'Test::More'   => 0, 
	}, 

);
