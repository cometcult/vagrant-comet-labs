class cleaner {
    exec { 'apache stop':
        path => '/usr/bin:/usr/sbin:/bin',
        command => '/etc/init.d/apache2 stop'
    }
    exec { 'nginx restart':
        path => '/usr/bin:/usr/sbin:/bin',
        command => '/etc/init.d/nginx restart'
    }
}