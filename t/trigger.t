use Test::More qw[no_plan];

use_ok 'Email::MessageID';

Email::MessageID->add_trigger( create_user => sub {
  ok 1, 'create_user trigger called';
  ${$_[1]} = "foo";
});

Email::MessageID->add_trigger( create_host => sub {
  ok 1, 'create_host trigger called';
  ${$_[1]} = "bar";
});

my $mid = Email::MessageID->new;
isa_ok $mid, 'Email::Address';
is $mid->user, 'foo', 'user was set to foo';
is $mid->host, 'bar', 'host was set to bar';
