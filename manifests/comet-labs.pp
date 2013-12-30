stage { 'prepare': before => Stage['main'] }

stage { 'aftermath': }

Stage['main'] -> Stage['aftermath']

class {
    'ubuntu':       stage => prepare;
    'php-cli':      stage => main;
    'php-fpm':      stage => main;
    'php-dev':      stage => main;
    'nginx':        stage => main;
    'dev':          stage => main;
    'composer':     stage => main;
    'mongodb':      stage => main;
    'apt':          stage => main;
    'stdlib':       stage => main;
    'ruby':         stage => main;
    'gems':         stage => main;
    'git':          stage => main;
    'time':         stage => aftermath;
    'cleaner':      stage => aftermath;
}

nginx::vhost {'dev': }