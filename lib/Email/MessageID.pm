package Email::MessageID;
# $Id: MessageID.pm,v 1.2 2004/10/01 15:19:31 cwest Exp $
use strict;

use vars qw[$VERSION];
$VERSION = (qw$Revision: 1.2 $)[1];

use Email::Address;

=head1 NAME

Email::MessageID - Generate world unique message-ids.

=head1 SYNOPSIS

  use Email::MessageID;

  my $mid = Email::MessageID->new;

  print "Message-ID: $mid\x0A\x0D";

=head1 DESCRIPTION

Message-ids are optional, but highly recommended, headers that identify a
message uniquely. This software generates a unique message-id.

=head2 Methods

=over 4

=item new

  my $mid = Email::MessageID->new;

  my $new_mid = Email::MessageID->new( host => $myhost );

This class method constructs an L<Email::Address|Email::Address> object
containing a unique message-id. You may specify custom C<host> and C<user>
parameters.

By default, the C<host> is generated from C<Sys::Hostname::hostname>.

By default, the C<user> is generated using C<Time::HiRes>'s C<gettimeofday>
and the process ID.

Using these values we have the ability to ensure world uniqueness down to
a specific process running on a specific host, and the exact time down to
six digits of microsecond precision.

=cut

sub new {
    my ($class, %args) = @_;
    
    $args{user} ||= $class->create_user;
    $args{host} ||= $class->create_host;
        
    my $mid = join '@', @args{qw[user host]};
    
    return Email::Address->new(undef, $mid);
}

sub create_user {
    require Time::HiRes;
    return join '.', Time::HiRes::gettimeofday(), $$;
}

sub create_host {
    require Sys::Hostname;
    return Sys::Hostname::hostname();
}

1;

__END__

=pod

=back

=head1 SEE ALSO

L<Email::Address>, L<Time::HiRes>, L<Sys::Hostname>, L<perl>.

=head1 AUTHOR

Casey West, <F<casey@geeknest.com>>.

=head1 COPYRIGHT

  Copyright (c) 2004 Casey West.  All rights reserved.
  This module is free software; you can redistribute it and/or modify it
  under the same terms as Perl itself.

=cut
