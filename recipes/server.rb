include_recipe 'ambari::base'

package 'ambari-server'

execute 'setup ambari server' do
  command 'ambari-server setup -s'
end

execute 'start ambari server' do
  command 'ambari-server start'
end
