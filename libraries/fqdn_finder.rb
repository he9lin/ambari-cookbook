# Falls back to machinename
module FQDNFinder
  def self.call(node)
    node[:fqdn] || node[:machinename]
  end
end
