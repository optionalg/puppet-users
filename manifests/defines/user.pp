define users::user(
    $name = '',
    $group = 'users',
    $ensure = 'present'
    $comment = '',
    $home = "/home/${name}",
    $managehome = true,
    $password = '',
    $shell = '/bin/sh',
    $system = false,
    $ssh_key = ''
    $ssh_key_type = 'ssh-rsa'
) {

user { $name : 
    comment     => $comment,
    ensure      => $ensure,
    gid         => $group,
    home        => "/home/${name}",
    managehome  => $managehome,
    password    => sha1($password),
    shell       => $shell,
    system      => $system
    }

ssh_authorized_key { "$name-primary" : 
    ensure  => $ensure,
    key     => $ssh_key,
    type    => $ssh_key_type,
    user    => $name
    }

}