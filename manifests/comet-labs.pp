stage { 'prepare': before => Stage['main'] }

stage { 'aftermath': }

Stage['main'] -> Stage['aftermath']

class {
    'ubuntu':          stage => prepare;
    'wget':            stage => main;
    'stdlib':          stage => main;
    'php-cli':         stage => main;
    'php-fpm':         stage => main;
    'php-dev':         stage => main;
    'nginx':           stage => main;
    'composer':        stage => main;
    'mongodb::server': stage => main;
    'apt':             stage => main;
    'git':             stage => main;
    'time':            stage => aftermath;
    'cleaner':         stage => aftermath;
}

nginx::vhost {'dev': }