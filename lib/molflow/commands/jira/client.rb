require 'jira'
require 'yaml'

module Molflow
  module Commands
    class Jira < Thor
      module Client
        def client
          @client ||= JIRA::Client.new(atlassian_configuration)
        end

        def atlassian_configuration
          @atlassian_configuration ||= base_config['atlassian'].symbolize_keys
        end

        def base_config
          path = ENV['MOLFLOW_BASE_CONFIG'].present? ? ENV['MOLFLOW_BASE_CONFIG'] : "#{ENV['HOME']}/.molflow"

          @base_config ||= YAML.load_file(path)
        rescue
          raise BaseConfigurationLoadError, path
        end
      end
    end
  end
end
