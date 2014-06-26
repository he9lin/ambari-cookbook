require 'spec_helper'
require 'fileutils'

describe AmbariAgentInitFileEdit do
  it 'replaces hostname=.. line with ambari server fqdn' do
    ini_file = fixture_file('ambari-agent.ini')
    described_class.call(ini_file, 'ambari.server')

    result = File.new(ini_file).readlines.find do |line|
      line.match /^hostname=ambari.server/
    end

    expect(result).to_not be_nil

    # Clean up generated file
    FileUtils.mv fixture_file('ambari-agent.ini.old'), ini_file
  end
end
