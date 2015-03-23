name             'lampbox'
maintainer       'Sean Kang'
maintainer_email 'es.guybrush@gmail.com'
license          'Apache License 2.0'
description      'Installs/Configures lampbox'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'apache2', '~> 3.0.1'
depends 'mysql', '< 6.0'
depends 'php', '~> 1.5.0'
depends 'database', '~> 4.0.3'
depends 'mysql2_chef_gem', '= 0.1.1' 
