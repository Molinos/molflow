require 'thor/group'

module Molflow
  class CLI < Thor
    # Class is used to customize the environment of the OS that will work with this gem.
    # Default settings for all heme is written to the file ~/.molflow, or as --path parameter
    # Added environment variable MOLFLOW_BASE_CONFIG where you will store the path to the configuration file.
    class Install < Thor::Group
      include Thor::Actions

      class_option  'path',
                    aliases: ['-p'], type: :string,
                    default: "#{ENV['HOME']}/.molflow",
                    desc: 'Specify a configuration file path. You then need to add
                           "export MOLFLOW_BASE_CONFIG= :you_path"
                           to the ~/.bashrc or ~/.zshrc file'

      def self.source_root
        File.expand_path('../install', __FILE__)
      end

      def create_configuration
        @site     = ask('Atlassian site: ')
        @username = ask('Atlassian username: ')
        @password = ask('Atlassian password: ')

        template('molflow', options[:path])
        binding.pry
        ENV['MOLFLOW_BASE_CONFIG'] = options[:path]
      end

      def complete
        say('COMPLETE!', :green)
      end
    end
  end
end
