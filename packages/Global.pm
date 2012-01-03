#!/usr/bin/perl
#

package Global;

  %Global::_commands = (
    "code"  => \&Git::handleCommand,
    "config" => \&Configuration::handleCommand,
    "build" => \&Build::handleCommand
  );

  sub init {
    Global::handleCommandLine();
  }

  sub doPrompt {
    my ($data,@baseData,$command,@options);
    print "?: ";
    $data = <STDIN>;
    @baseData = split(" ", $data);
    ($command,@options) = @baseData;
    return ($command,@options);
  }

  sub handlePrompt {
    my ($prompt,@args) = @_;

    if ($prompt eq "help" || $prompt eq ""){
      ## @todo Dump some help text here.
    }
    elsif (defined $_commands{$prompt}) {
      $_commands{$prompt}->(@args);
    } else {
      print "Invalid command '$prompt\'.\n";
      handlePrompt("help");
    }

    return handlePrompt(doPrompt());
  }

  sub handleCommandLine {
    my ($command,@options) = @ARGV;

    return handlePrompt($command,@options);
  }

1;