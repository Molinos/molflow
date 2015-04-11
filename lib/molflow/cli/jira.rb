require 'jira'
require 'yaml'
require 'molflow/error'

module Molflow
  class CLI < Thor
    class Jira
      def self.client
        @client ||= JIRA::Client.new(atlassian_configuration)
      end

      def self.atlassian_configuration
        @atlassian_configuration ||= base_config['atlassian'].symbolize_keys
      end

      def self.base_config
        path = ENV['MOLFLOW_BASE_CONFIG'].present? ? ENV['MOLFLOW_BASE_CONFIG'] : "#{ENV['HOME']}/.molflow"

        @base_config ||= YAML.load_file(path)
      rescue
        raise BaseConfigurationLoadError, path
      end
    end
  end
end
