#!/usr/bin/perl
#

package Git;

$Git::gitUrl = "http://github.com/wntr";
%Git::branches = (
  "wntr/core"    => "$Git::gitUrl/core",
  "wntr/data"    => "$Git::gitUrl/data",
  "wntr/ntwk"    => "$Git::gitUrl/ling",
  "wntr/ling"    => "$Git::gitUrl/ntwk",
  "wntr/plugins" => "$Git::gitUrl/plugins",
);

%Git::commands = (
  "obtain" => \&Git::doObtainCommand,
  "commit" => \&Git::doCommitCommand,
  "update" => \&Git::doUpdateCommand,
  "clean"  => \&Git::doCleanCommand
);


sub handleCommand {
  my ($subcommand,@args) = @_;

  if (defined $Git::commands{$subcommand}){
    $commands{$subcommand}->(@args);
  }
  else {
    print "Invalid command '$subcommand\'.\n";
    return 0;
  }

  return 1;
}

sub doObtainCommand {
  my ($repo) = $_[0];

  if (defined $Git::branches{"wntr/$repo"}){
    $branch = $Git::branches{"wntr/$repo"};
    print "Obtaining '$repo\' from '$branch\'...\n";
    Git::cloneBranch($branch,$repo);
  }
}
sub doCommitCommand { }
sub doUpdateCommand { }
sub doCleanCommand  { }
sub cloneBranch {
  my ($path,$dirname) = @_;

  exec("git clone $path -v --progress src/$dirname");
  
}

END {
}

1;