#!/usr/bin/perl
#

package Configuration;

%Configuration::commands = (
  "set" => \&Configuration::doSetCommand,
  "get" => \&Configuration::doGetCommand,
  "update" => \&Configuration::doUpdateCommand
);


sub handleCommand {
  my ($subcommand,@args) = @_;

  if (defined $Configuration::commands{$subcommand}){
    $commands{$subcommand}->(@args);
  }
  else {
    print "Invalid command '$subcommand\'.\n";
    return 0;
  }

  return 1;
}

sub doSetCommand { }
sub doGetCommand { }
sub doUpdateCommand { }

1;