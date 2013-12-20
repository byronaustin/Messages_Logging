use inc::Module::Install;
 
# Define metadata
name           'Messages';
all_from       'lib/Messages.pm';

# Specific dependencies
requires       'Log::Log4perl' => '1.42';
test_requires  'Test::Simple'  => '0.88';
auto_install();
WriteAll;
