server = search(:node, 'role:ambari_server')
agents = search(:node, 'role:ambari_agent')
nodes  = server + agents

nodes.each do |node|
  hostsfile_entry node[:ipaddress] do
    hostname  node[:fqdn]
    aliases   [node[:hostname]]
    unique    true
  end
end
