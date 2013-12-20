package Messages;
use Log::Log4perl;
use strict;
use warnings;

BEGIN {
    use Exporter ();
    use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
    $VERSION     = '0.01';
    @ISA         = qw(Exporter);
    @EXPORT      = qw(set_messages);
    @EXPORT_OK   = qw(set_messages debug info warn error fatal trace);
    %EXPORT_TAGS = ( 
  		'all' => [ qw(
                 set_messages 
                 debug 
                 info 
                 warn 
                 error 
                 fatal 
                 trace
               ) ] );
    @EXPORT_OK   = ( @{ $EXPORT_TAGS{'all'} } );
}


#################### subroutine header begin ####################

=head2 debug(This is a sample Debug Message);

 Usage     : precede the desired message with the appropriate level that you
           : want it printed at, then pass a command line argument to set the 
           : level at runtime
 Purpose   : Provides simplification of logging functions from Log::Log4perl
 Returns   : nothing is returned
 Argument  : Pass message text that you want logged
 Comment   :  

See Also   : 

=cut

#################### subroutine header end ####################
####################################################################
#The following subroutines translate the functions from Log4perl to
#the simpler function names used with the Messages module
#USAGE:
# sub_name("quoted string to log to file");
# example: 
#  debug("This is a Debug message");
####################################################################
my $logger;
my $log_conf;

sub debug{
 $logger->debug($_[0]);
  return
}

sub info{
  $logger->info($_[0]);
  return
}

sub warn{
  $logger->warn($_[0]);
  return
}

sub error{
  $logger->error($_[0]);
  return
}

sub fatal{
  $logger->fatal($_[0]);
  return
}

sub trace{
  $logger->trace($_[0]);
  return
}
############################################################################
#The set_messages subroutine takes up to 3 arguments passed from the 
#calling program. The first one is always the name of the calling program
#the second and third can be in any order, they are the debug flag or verbose
#flag (-d -v -t) and the log file name
#if verbose level flags are not supplied, or if an invalid flag is set, 
#verbose level will automatically be set to messages
#if no logfile name is passed, the log file will be set to the calling program
#name .txt
#############################################################################
sub set_messages{
  my $verbose_level="";
  my $filename;
  my $log_file_name;
  $_  = $_[0];
  if ($_ =~ /(\.\/)?(.+)\./) #REGEX to extract the program name 
  {
    $log_file_name = $2;
  }
#  my $log_file_name = ($_[0]); #log file name to first argument and the 
  if($_[2]){
    if (substr($_[2],0,1) eq "-"){#check the lead character of the 3rd argument
      $verbose_level = $_[2];#to see if it is a '-', if so, then set verbose level
      $filename = $_[1];#set logfile value to second argument
    }
  }
  if($_[1]){
    if ( substr($_[1],0,1) eq "-" ){ #check the lead character of the 2nd argument
      $verbose_level = $_[1];      #if it is set verbose level
      $filename = $_[2];           #and set third argument to filename
    }
  }
  if (!$_[2]){
    if ($_[1]){
      if (substr($_[1],0,1) ne "-"){
        $filename = $_[1];
        $verbose_level = "";
      }else{
        $filename = "";
        $verbose_level = $_[1];
      }
    }
  }
  if($filename){  #if filename exists, set log file name
     $log_file_name = $filename;
  }
  $log_file_name = $log_file_name . ".txt";
  if ($verbose_level eq "-v"){
    $log_conf = q(log4perl.rootLogger              = INFO, LOG1, SCREEN);
  }elsif ($verbose_level eq "-d"){
    $log_conf = q(log4perl.rootLogger              = DEBUG, LOG1, SCREEN);
  }elsif ($verbose_level eq "-t"){
    $log_conf = q(log4perl.rootLogger              = TRACE, LOG1, SCREEN);
  }else
    {
    $log_conf = q(log4perl.rootLogger              = WARN, LOG1, SCREEN);
  }

  $log_file_name = "log4perl.appender.LOG1.filename  = ". $log_file_name;
  $log_conf = $log_conf . "\n" . $log_file_name;

  $log_conf = $log_conf . q(
log4perl.appender.SCREEN         = Log::Log4perl::Appender::Screen
log4perl.appender.SCREEN.stderr  = 0
log4perl.appender.SCREEN.layout  = Log::Log4perl::Layout::PatternLayout
log4perl.appender.SCREEN.layout.ConversionPattern = %m %n
log4perl.appender.LOG1           = Log::Log4perl::Appender::File
log4perl.appender.LOG1.mode      = append
log4perl.appender.LOG1.layout    = Log::Log4perl::Layout::PatternLayout
log4perl.appender.LOG1.layout.ConversionPattern = %d %p %m %n
);
Log::Log4perl::init(\$log_conf);
$logger = Log::Log4perl->get_logger();

return $log_conf;
}





#################### main pod documentation begin ###################
## Below is the stub of documentation for your module. 
## You better edit it!


=head1 NAME

Messages - Simplified logging for test environment. Creates a .txt log file based upon the script name or a file name that is passed in as a command line argument. Different levels of messages can be printed by passing different command line arguments. i.e. -d for debug prints all messages, -v for verbose prints all messages except debug and no argument prints all messages except verbose and debug

=head1 SYNOPSIS

  use Messages;
  


=head1 DESCRIPTION

The Messages module allows user to add debug/warning/pass/fail messages to a script and execute the script with command line arguments to set the level of messaging. The simplification eliminates the need to use countless if statements to decide if a message will be printed or not. Also allows messages to be left in code making future updates easier. 

=head1 USAGE

The following levels of messages are printed when the level is selected:
TRACE - trace, debug, warn, error, fatal
DEBUG - debug, info, warn, error, fatal
INFO - info, error, warn, fatal
WARN - warning, error, fatal
ERROR - error, fatal
FATAL - fatal

in other words, then the TRACE level is selected (-t), then all messages that are prepended with trace, debug, warn, error or fatal will be printed and logged. if the level is set to WARN, then only warning, error and fatal messages appear. 
A message line would appear as follows:

debug("this is a debug message");
info("this is an information message");

=head1 BUGS



=head1 SUPPORT



=head1 AUTHOR

    Byron Austin
    byronx.l.austin@intel.com

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.


=head1 SEE ALSO

perl(1).

=cut

#################### main pod documentation end ###################


1;
# The preceding line will help the module return a true value

