require 'thor/group'

module Molflow
  class CLI < Thor
    # Class is used to customize the environment of the OS that will work with this gem.
    # Default settings for all heme is written to the file ~/.molflow, or as --path parameter
    class Install < Thor::Group
      include Thor::Actions

      class_option  'path',
                    aliases: ['-p'], type: :string,
                    default: "#{ENV['HOME']}/.molflow",
                    desc: 'Specify a configuration file path.'

      def self.source_root
        File.expand_path('../install', __FILE__)
      end

      def init_variables
        say('')
        say('Enter your Atlassian credentials.')
        @site     = ask('URL: ')
        @username = ask('Username: ')
        @password = ask('Password: ')
        say('')
      end

      def copy_configuration
        template('molflow', options[:path])
        say('')
      end

      def enviroment_variable_warning
        say("IMPORTANT!!! Add 'export MOLFLOW_BASE_CONFIG=#{options[:path]}' to you shell rc file(~/.bashrc or ~/.zshrc)", :yellow)
        say('')
      end

      def complete
        say('COMPLETE!', :green)
        say('')
      end
    end
  end
end
