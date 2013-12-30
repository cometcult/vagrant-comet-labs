class git {
    package { 'git':
        ensure => latest
    }
    exec { 'git-colors':
        path => '/usr/bin:/usr/sbin:/bin/',
        command => '/usr/bin/git config --system color.ui auto',
        unless => '/usr/bin/git config --system color.ui | grep "auto"',
        require => Package['git']
    }
}