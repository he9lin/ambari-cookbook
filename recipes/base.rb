include_recipe 'ambari::setup_hosts'

package 'ntp'

service 'ntpd' do
  action [:enable, :start]
end

remote_file '/etc/yum.repos.d/ambari.repo' do
  source 'http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.6.0/ambari.repo'
  action :create_if_missing
end
