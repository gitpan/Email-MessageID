use ExtUtils::MakeMaker;

WriteMakefile (
               AUTHOR        => 'Casey West <casey@geeknest.com>',
               ABSTRACT      => "Generate world unique message-ids",
               NAME          => 'Email::MessageID',
               PREREQ_PM     => {
                                 'Test::More'        => '',
                                 'Class::Trigger'    => '',
                                 'Email::Address'    => '',
                                 'Time::HiRes'       => '',
                                 'Sys::Hostname'     => '',
                                },
               VERSION_FROM  => 'lib/Email/MessageID.pm',
              );
