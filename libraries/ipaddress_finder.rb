# Uses private ipaddress if available
# TODO: Use recipe attributes to turn on/off
module IpaddressFinder
  def self.call(node)
    node[:private_ipaddress] || node[:ipaddress]
  end
end
