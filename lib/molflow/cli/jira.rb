require 'jira'
require 'yaml'
require 'molflow/error'

module Molflow
  class CLI < Thor
    class Jira
      def self.client
        @client ||= JIRA::Client.new(@base_config)
      end

      def self.base_config
        @base_config ||= YAML.load_file(ENV['MOLFLOW_BASE_CONFIG'])
      rescue
        raise BaseConfigurationLoadError, ENV['MOLFLOW_BASE_CONFIG']
      end
    end
  end
end
