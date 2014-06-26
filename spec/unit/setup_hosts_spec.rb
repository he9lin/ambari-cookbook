require 'spec_helper'

describe 'ambari::setup_hosts' do
  let(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end

  let(:servers) do
    [
      { ipaddress: '192.168.1.101', fqdn: 'ambari1.heyooklabs', hostname: 'ambari1' }
    ]
  end

  let(:agents) do
    [
      { ipaddress: '192.168.1.102', fqdn: 'ambari2.heyooklabs', hostname: 'ambari2' },
      { ipaddress: '192.168.1.103', fqdn: 'ambari3.heyooklabs', hostname: 'ambari3' }
    ]
  end

  before do
    stub_search(:node, 'role:ambari_server').and_return(servers)
    stub_search(:node, 'role:ambari_agent').and_return(agents)
  end

  it 'creates a hostsfile entry for the ambari server' do
    expect(chef_run).to create_hostsfile_entry('192.168.1.101')
        .with_hostname('ambari1.heyooklabs')
  end

  it 'creates hostsfile entries for the ambari agents' do
    expect(chef_run).to create_hostsfile_entry('192.168.1.102')
        .with_hostname('ambari2.heyooklabs')
    expect(chef_run).to create_hostsfile_entry('192.168.1.103')
        .with_hostname('ambari3.heyooklabs')
  end
end
