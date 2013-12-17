class user::virtual {
  define ssh_user (
    $comment,
    $uid,
    $key) {
    user { $name:
      ensure     => present,
      managehome => true,
    }

    file { "/home/${name}/.ssh":
      ensure => directory,
      mode   => '0700',
      owner  => $name,
    }

    ssh_authorized_key { "${name}_key":
      key     => $key,
      type    => 'ssh-rsa',
      user    => $name,
      require => File["/home/${name}/.ssh"],
    }
  }

  @ssh_user { 'chris':
    comment => 'Chris Sura',
    uid     => 11000,
    key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCfxEHcQkdPlAMbpsG75hyCCLG41xXW5Z8/ozItbXsQrarO08RYw/DDEX8dVrHyzAYAfIZ/qTjFVNuKSauE4g/7u9RJWjl0htwHc0AXXGHitnzdsL/VXFKoUVIjZV3V/tLodx+G1+Xd3nDc0VIljPOxkGC9yJOZkzLcotvhkDcEOruX9jBRJxVJnf+tTkEy1gF1sMAG8CfBccxlqu2HEqGP9uQiH1mPsFotbO2+xCG44zH5wTRbODUucGZamSD695UQ4b0cXeil+m1+RT+IVb6FGNX88p0AKcTVxY2YCiiO+8thx2QAuOMdlAGzaMJJxjYpRuLa2ujkqcswIkB+8U8z'
  }
}
