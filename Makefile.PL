use ExtUtils::MakeMaker;

WriteMakefile (
               AUTHOR        => 'Casey West <casey@geeknest.com>',
               ABSTRACT      => "Generate world unique message-ids",
               NAME          => 'Email::MessageID',
               PREREQ_PM     => {
                                 'Email::Address' => '1.3',
                                 'Sys::Hostname' => '1.11',
                                 'Test::More' => '0.47',
                                 'Time::HiRes' => '1.52',
                                },
               VERSION_FROM  => 'lib/Email/MessageID.pm',
              );
