<<<<<<< HEAD
use inc::Module::Install;
 
# Define metadata
name           'Messages';
all_from       'lib/Messages.pm';

# Specific dependencies
requires       'Log::Log4perl' => '1.42';
test_requires  'Test::Simple'  => '0.88';
auto_install();
WriteAll;
=======




use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'Messages',
    VERSION_FROM => 'lib/Messages.pm', # finds \$VERSION
    AUTHOR       => 'Byron Austin (byronx.l.austin@intel.com)',
    ABSTRACT     => 'Module abstract (<= 44 characters) goes here',
    PREREQ_PM    => {
                     'Test::Simple' => 0.44,
                    },
);

>>>>>>> 7c05a6b8ed51aaeb4633fbc8601515099c112532
