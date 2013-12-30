class php-cli::preinstall {
    apt::ppa { 'ppa:ondrej/php5-oldstable': }
    exec { 'remove-old-ondrej-ppa':
        path => '/usr/bin:/usr/sbin:/bin',
        command => 'rm -f /etc/apt/sources.list.d/ondrej-php5-raring.list'
    }
}

class php-cli::install {
    package { 'php5':
        ensure => installed,
        require => Class['php-cli::preinstall']
    }
    package { 'php5-dev':
        ensure => installed,
        require => Class['php-cli::preinstall']
    }
    package { 'php5-cli':
        ensure => installed,
        require => Class['php-cli::preinstall']
    }
    package { 'php5-sqlite':
        ensure => installed,
        require => Class['php-cli::preinstall']
    }
    package { 'php5-mysql':
        ensure => installed,
        require => Class['php-cli::preinstall']
    }
    package { 'php5-intl':
        ensure => installed,
        require => Class['php-cli::preinstall']
    }
    package { 'php5-curl':
        ensure => installed,
        require => Class['php-cli::preinstall']
    }
    package { 'php-apc':
        ensure => installed,
        require => Class['php-cli::preinstall']
    }
    package { 'php-pear':
        ensure => installed,
        require => Class['php-cli::preinstall']
    }
    exec { "php5-mongo":
        command => "pecl install mongo",
        path => "/usr/bin/",
        require => Package["php-pear"],
        unless => 'pecl info mongo'
    }
    file { "/etc/php5/conf.d/mongo.ini":
        content=> 'extension=mongo.so',
        require => Exec["php5-mongo"]
    }
}

class php-cli::configure {
    exec { 'php-cli-set-timezone':
        path => '/usr/bin:/usr/sbin:/bin',
        command => 'sed -i \'s/^[; ]*date.timezone =.*/date.timezone = Europe\/Warsaw/g\' /etc/php5/cli/php.ini',
        onlyif => 'test "`php -c /etc/php5/cli/php.ini -r \"echo ini_get(\'date.timezone\');\"`" = ""',
        require => Class['php-cli::install']
    }
    exec { 'php-cli-disable-short-open-tag':
        path => '/usr/bin:/usr/sbin:/bin',
        command => 'sed -i \'s/^[; ]*short_open_tag =.*/short_open_tag = Off/g\' /etc/php5/cli/php.ini',
        onlyif => 'test "`php -c /etc/php5/cli/php.ini -r \"echo ini_get(\'short_open_tag\');\"`" = "1"',
        require => Class['php-cli::install']
    }
}

class php-cli {
    include php-cli::preinstall
    include php-cli::install
    include php-cli::configure
}