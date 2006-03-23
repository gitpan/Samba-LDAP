#!perl -w

use warnings;
use strict;
use Test::More tests => 6;

BEGIN {
        use_ok( 'Samba::LDAP::Config');
}

my $config = Samba::LDAP::Config->new();
isa_ok ( $config, 'Samba::LDAP::Config' );
can_ok( $config, qw(find_smbldap find_smbldap_bind find_samba) );

SKIP: {

    skip 'smbldap tools installed, so not point in testing this', 
    1 if -e '/etc/smbldap-tools/smbldap.conf';
    
    is ( $config->find_smbldap(), '/etc/opt/IDEALX/smbldap-tools/smbldap.conf',
        'Should return the default directory for where smbldap.conf is stored' );
}        

SKIP: {

    skip 'smbldap tools installed, so not point in testing this', 
    1 if -e '/etc/smbldap-tools/smbldap_bind.conf';
    
    is ( $config->find_smbldap_bind(), '/etc/opt/IDEALX/smbldap-tools/smbldap_bind.conf',
    'Should return the default directory for where smbldap_bind.conf is stored' );
}

SKIP: {

    skip 'Samba installed, so not point in testing this', 
    1 if -e '/etc/samba/smb.conf';
    
    is ( $config->find_samba(), '/usr/local/samba/lib/smb.conf',
    'Should return the default directory for where smb.conf is stored' );
}

