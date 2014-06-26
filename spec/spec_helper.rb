require 'chefspec'
require 'chefspec/berkshelf'

SPEC_DIR = File.dirname(__FILE__)
ROOT_DIR = File.join(SPEC_DIR, '..')

Dir[File.join(SPEC_DIR, "support/**/*.rb")].each { |f| require f }
require File.join(ROOT_DIR, 'libraries/ambari_agent_init_file_edit')
