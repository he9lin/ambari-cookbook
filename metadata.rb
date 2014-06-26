name             'ambari'
maintainer       'Lin He'
maintainer_email 'he9lin@gmail.com'
license          'All rights reserved'
description      'Installs/Configures Apache Ambari server and agents'
long_description 'Installs/Configures Apache Ambari server and agents'
version          '0.1.0'

recipe "ambari::server", "Installs and configures Ambari server"
recipe "ambari::agent",  "Installs and configures Ambari agent"

depends 'yum',       '2.4.4'
depends 'hostsfile', '2.4.5'
