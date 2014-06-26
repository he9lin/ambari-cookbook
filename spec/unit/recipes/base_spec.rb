require 'spec_helper'

describe "ambari::base" do
  let(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end

  it "installs the ntp package" do
    expect(chef_run).to install_package 'ntp'
  end

  it 'enables the ntpd service' do
    expect(chef_run).to enable_service('ntpd')
  end

  it 'starts the ntpd service' do
    expect(chef_run).to start_service('ntpd')
  end

  it 'downloads the ambari repo from hortonworks public repo' do
    expect(chef_run).to \
      create_remote_file_if_missing('/etc/yum.repos.d/ambari.repo').with(
        source: 'http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.6.0/ambari.repo'
      )
  end
end
