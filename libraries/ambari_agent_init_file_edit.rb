module AmbariAgentInitFileEdit
  def self.call(init_file, ambari_server_fqdn)
    rc = Chef::Util::FileEdit.new(init_file)
    rc.search_file_replace_line(/^hostname=/,
                                "hostname=#{ambari_server_fqdn}")
    rc.write_file
  end
end
