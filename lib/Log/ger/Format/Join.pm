package Log::ger::Format::Join;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use warnings;

sub get_hooks {
    my %conf = @_;

    my $with = $conf{with} ? $conf{with} : '';

    return {
        create_formatter => [
            __PACKAGE__, # key
            50,          # priority
            sub {        # hook
                my %hook_args = @_; # see Log::ger::Manual::Internals/"Arguments passed to hook"

                my $formatter = sub { join $with, @_ };
                [$formatter];
            }],
    };
}

1;
# ABSTRACT: Join arguments together as string

=for Pod::Coverage ^(.+)$

=head1 SYNOPSIS

 use Log::ger::Format 'Join';
 use Log::ger;

 log_warn 'arg1';                  # becomes: arg1
 log_warn 'arg1', 'arg2', ' arg3'; # becomes: arg1arg2 arg3

You can supply a string to join the arguments with:

 use Log::ger::Format 'Join', with=>'; ';
 use Log::ger;

 log_warn 'arg1';                  # becomes: arg1
 log_warn 'arg1', 'arg2', ' arg3'; # becomes: arg1; arg2;  arg3


=head1 DESCRIPTION

This is an alternative format plugin if you do not like the
L<default|Log::ger::Format::Default> one. It does not do any sprintf()-style
formatting; it just joins the arguments into a string.


=head1 CONFIGURATION

=head2 with

String. Default empty string. Characters to use to join the arguments with.


=head1 SEE ALSO

L<Log::ger>
