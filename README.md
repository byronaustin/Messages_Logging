Messages_Logging
================

Allows use of simplified messaging syntax for logging at multiple priority levels

Messages version 0.01
==============================

This module provides a logging handler that allows easy messaging tags. 
To use the module make sure the Messages::Messages.pm is in your lib directory

use Messages':all': to import all functions

The available functions are: set_message
                             debug
                             info
                             warn
                             error
                             fatal
                             trace

You must initialize the logger by calling set_messages($0, @ARGV);
  This passes the name of your perlscript and the command line arguments that were passed into your script. 
  
Features: The Messages.pm module provides an easy method of creating a log file with several different levels of message logging available. Additionally, you can pass a name on the command line that will be used to name your log file. In the absence of this name argument, the module will parse the name from your perl script and append .txt to create the log file for you. 

Inside your script you can choose what messages will appear at the various levels. For example if you want a message to appear when the level is set to debug, you use the debug() function: debug("Your debugging message here");

When the script runs and the level is set to debug, this message will print out to the screen and the log. 

The levels have a hierarchy. Each level prints messages at its own level along with all messages at levels LOWER than itself. Here is a list of the debug levels and the messages that they print:
 
  TRACE - trace, debug, warn, error, fatal
  DEBUG - debug, info, warn, error, fatal
  INFO - info, error, warn, fatal
  WARN - warning, error, fatal
  ERROR - error, fatal
  FATAL - fatal

When you use the fatal label - if that message is encountered in your script, it will print at all debug levels. On the other hand, when you use trace in the script, the trace messages will only print when the debug leve is set to trace. 

Here are some sample lines of messages: 

  trace("Log a trace message"); #this message is printed when -t is passed
  debug("Debug message");       # this message is printed when -d is passed
  info("Info message");         # this message is printed when -v is passed
  warn("Warning message");# this message is printed when no parameter is passed
  error("Error message"); # this message is printed at all debug levels
  fatal("Fatal message"); # this message is printed at all debug levels
 

At this time there are no error or fatal debug levels, but they may be added in the future. 

When you run your script from command line with no parameters, the debug level defaults to messages which translates to warn, error and fatal messages will be printed and logged. It will be logged to a file with the same name as your script name.txt.

To change the logfile name, you can pass the desired name as a command line argument. Do not use any punctuation (such as name.v3.01) as it is not supported at this time. 

Command line arguments can be in any order: i.e. filename -d, or -v filename.
The switches are -t = trace, -v = warn, -d = debug.

If you pass other command line arguments into your script, make sure that you change the set_messages() function call to reflect this. Always pass $0 as the first argument, this assures that the script name is available to name the log file. If your script uses arguments 1 and 2 that are passed in, change the @ARGV to $ARGV[2], $ARGV[3] - set_messages($0, $ARGV[2],$ARGV[3]) to pass the 3rd and 4th command line parameters to the module.  


INSTALLATION

To install this module type the following:

   perl Makefile.PL
   make
   make test
   make install

DEPENDENCIES

This module requires these other modules and libraries:

Logs::Log4perl

COPYRIGHT AND LICENCE

Put the correct copyright and licence information here.

Copyright (C) 2013 by Byron Austin

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.



