require 'spec_helper'

describe "ambari::agent" do
  let(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end

  let(:ambari_servers) do
    [{ ipaddress: '192.168.1.101', fqdn: 'ambari1.heyooklabs', hostname: 'ambari1' }]
  end

  before do
    stub_search("node", "role:ambari_server").and_return(ambari_servers)
  end

  it 'includes the `base` recipe' do
    p fixture_path
    expect(chef_run).to include_recipe('ambari::base')
  end

  it 'installs the ambari-agent package' do
    expect(chef_run).to install_package('ambari-agent')
  end

  it 'edits ambari agent ini file' do
    expect(chef_run).to run_ruby_block('edit ambari agent ini file')
  end

  it 'starts the ambari-agent' do
    expect(chef_run).to \
      run_execute('start ambari agent').with(command: 'ambari-agent start')
  end
end
