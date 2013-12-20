# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 23;

BEGIN { use_ok( 'Messages' ); 

#Test 2
my $testlog = set_messages($0);
my $testfile;
ok( defined ($testlog),"initilization");
#Test 3
$_ = $testlog;
foreach (split(/\n/,$testlog)){
  if ($_ =~ /log4perl.appender.LOG1.filename\s+[=]+\s+(.+)?/){
    $testfile = $1 ;
  }
}
ok( $testfile eq "t/001_load.txt", "$testfile logfile name passed as argument");
unlink $testfile;
#Test 4
$ARGV[0] = "testfile";
$testlog = set_messages($0,@ARGV);
ok( defined ($testlog),'initialized with filename as argument');
#Test 5
$_ = $testlog;
foreach (split(/\n/,$testlog)){
  if ($_ =~ /log4perl.appender.LOG1.filename\s+[=]+\s+(.+)?/){
    $testfile = $1 ;
  }
}
ok($testfile eq "testfile.txt", 'Veried log file name is correct');
unlink $testfile;
#Test 6
  $ARGV[0] = debugTest;
  $ARGV[1] = '-d';
  $testlog = set_messages($0,@ARGV);
  ok( defined ($testlog), 'initialized with filename and debug flag');
#Test 7
  $_ = $testlog;
  foreach (split(/\n/,$testlog)){
    if ($_ =~ /log4perl.appender.LOG1.filename\s+[=]+\s+(.+)?/){
      $testfile = $1 ;
    }
  }
  ok($testfile eq "debugTest.txt",'debug flag with filename argument' );
 unlink $testfile;
#Test 8
  $_ = $testlog;
  foreach (split(/\n/,$testlog)){
    if ($_ =~ /log4perl.rootLogger\s+[=]+\s+(\w+)?/){
      $testfile = $1 ;
    }
  }
  ok($testfile eq "DEBUG",'Checking if DEBUG set');
  unlink $testfile;
#Test 9
  $ARGV[0] = verboseTest;
  $ARGV[1] = '-v';
  $testlog = set_messages($0,@ARGV);
  ok( defined ($testlog), 'initialized with filename and verbose flag ');
#Test 10
  $_ = $testlog;
  foreach (split(/\n/,$testlog)){
    if ($_ =~ /log4perl.appender.LOG1.filename\s+[=]+\s+(.+)?/){
      $testfile = $1 ;
    }
  }
  ok($testfile eq "verboseTest.txt",'verbose flag with filename argument' );
  unlink $testfile;
#Test 11
  $_ = $testlog;
  foreach (split(/\n/,$testlog)){
    if ($_ =~ /log4perl.rootLogger\s+[=]+\s+(\w+)?/){
      $testfile = $1 ;
    }
  }
  ok($testfile eq "INFO",'Checking if VERBOSE set');
#Test 12
  $ARGV[0] = messageTest;
  $ARGV[1] = "";
  $testlog = set_messages($0,@ARGV);
  ok( defined ($testlog), 'initialized with filename and no verbose flag');
#Test 13
  $_ = $testlog;
  foreach (split(/\n/,$testlog)){
    if ($_ =~ /log4perl.appender.LOG1.filename\s+[=]+\s+(.+)?/){
      $testfile = $1 ;
    }
  }
  ok($testfile eq "messageTest.txt",'no flag with filename argument' );
  unlink $testfile;
#Test 14
  $_ = $testlog;
  foreach (split(/\n/,$testlog)){
    if ($_ =~ /log4perl.rootLogger\s+[=]+\s+(\w+)?/){
      $testfile = $1 ;
    }
  }
  ok($testfile eq "WARN",'Checking if MESSAGES set');
#Test 15
  $ARGV[0] = '-d';
  $ARGV[1] = "";
  $testlog = set_messages($0,@ARGV);
  ok( defined ($testlog), 'initialized with debug flag');
#Test 16
  $_ = $testlog;
  foreach (split(/\n/,$testlog)){
    if ($_ =~ /log4perl.appender.LOG1.filename\s+[=]+\s+(.+)?/){
      $testfile = $1 ;
    }
  }
  ok($testfile eq "t/001_load.txt",'debug flag and no filename argument' );
#Test 17
  $_ = $testlog;
  foreach (split(/\n/,$testlog)){
    if ($_ =~ /log4perl.rootLogger\s+[=]+\s+(\w+)?/){
      $testfile = $1 ;
    }
  }
  ok($testfile eq "DEBUG",'Checking if DEBUG set');
#Test 18
  $ARGV[0] = '-v';
  $ARGV[1] = "";
  $testlog = set_messages($0,@ARGV);
  ok( defined ($testlog), 'initialized with verbose flag');
#Test 19
  $_ = $testlog;
  foreach (split(/\n/,$testlog)){
    if ($_ =~ /log4perl.appender.LOG1.filename\s+[=]+\s+(.+)?/){
      $testfile = $1 ;
    }
  }
  ok($testfile eq "t/001_load.txt",'verbose flag and no filename argument' );
#Test 20
  $_ = $testlog;
  foreach (split(/\n/,$testlog)){
    if ($_ =~ /log4perl.rootLogger\s+[=]+\s+(\w+)?/){
      $testfile = $1 ;
    }
  }
  ok($testfile eq "INFO",'Checking if VERBOSE set');
#Test 21
  $ARGV[0] = "";
  $ARGV[1] = "";
  $testlog = set_messages($0,@ARGV);
  ok( defined ($testlog), 'initialized with verbose flag');
#Test 22
  $_ = $testlog;
  foreach (split(/\n/,$testlog)){
    if ($_ =~ /log4perl.appender.LOG1.filename\s+[=]+\s+(.+)?/){
      $testfile = $1 ;
    }
  }
  ok($testfile eq "t/001_load.txt",'verbose flag and no filename argument' );
  unlink $testfile;
#Test 23
  $_ = $testlog;
  foreach (split(/\n/,$testlog)){
    if ($_ =~ /log4perl.rootLogger\s+[=]+\s+(\w+)?/){
      $testfile = $1 ;
    }
  }
  ok($testfile eq "WARN",'Checking if MESSAGES set');

}
