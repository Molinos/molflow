require 'jira'
require 'yaml'

module Molflow
  class Jira
    def self.client
      config_path = "#{ENV['HOME']}/.molflow"
      config_of_file = YAML.load_file(config_path)

      options = {
        username: config_of_file['username'],
        password: config_of_file['password'],
        site:     config_of_file['site'],
        auth_type: :basic,
        context_path: '',
        use_ssl: true
      }

      JIRA::Client.new(options)
    end
  end
end
