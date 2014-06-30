server = search(:node, 'role:ambari_server')
agents = search(:node, 'role:ambari_agent')
nodes  = server + agents

return log("Could not find ambari nodes") if nodes.empty?

nodes.each do |node|
  log "Add hostsfile entry #{node.inspect}."

  hostsfile_entry node[:ipaddress] do
    hostname  node[:hostname]
    aliases   [FQDNFinder.(node)]
    unique    true
  end
end
