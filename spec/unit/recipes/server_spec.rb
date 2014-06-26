require 'spec_helper'

describe "ambari::server" do
  let(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end

  it 'includes the `base` recipe' do
    expect(chef_run).to include_recipe('ambari::base')
  end

  it 'installs the ambari-server package' do
    expect(chef_run).to install_package 'ambari-server'
  end

  it 'runs a execute to setup ambari-server' do
    expect(chef_run).to \
      run_execute('setup ambari server').with(command: 'ambari-server setup -s')
  end

  it 'starts the ambari-server' do
    expect(chef_run).to \
      run_execute('start ambari server').with(command: 'ambari-server start')
  end
end
