class time {
    exec { 'set-timezone':
        path => '/usr/bin:/usr/sbin:/bin',
        command => 'sed -i \'s/Etc\/UTC/Europe\/Warsaw/g\' /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata',
        unless => 'cat /etc/timezone | grep "Warsaw"'
    }
}