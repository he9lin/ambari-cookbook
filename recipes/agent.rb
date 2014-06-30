include_recipe 'ambari::base'

package 'ambari-agent'

# Find FQDN of an Ambari server
ambari_servers = search(:node, 'role:ambari_server')

return log('Could not find any Ambari servers. Ambari agents not started') \
  if ambari_servers.empty?

ambari_server_fqdn = FQDNFinder.(ambari_servers[0])

return log("Ambari server configuation is missing fqdn") \
  unless ambari_server_fqdn

ruby_block 'edit ambari agent ini file' do
  block do
    AmbariAgentInitFileEdit.call(
      '/etc/ambari-agent/conf/ambari-agent.ini', ambari_server_fqdn)
  end
end

execute 'start ambari agent' do
  command 'ambari-agent restart'
end
