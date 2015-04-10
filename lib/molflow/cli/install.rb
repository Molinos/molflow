require 'thor/group'

module Molflow
  class CLI < Thor
    class Install < Thor::Group
      include Thor::Actions

      class_option 'path',
                    aliases: ['-p'],
                    default: "#{ENV['HOME']}/.molflow",
                    desc: 'Specify a configuration file path'

      def self.source_root
        File.expand_path('../install', __FILE__)
      end

      def create_configuration
        @site = ask('Atlassian site: ')
        @username = ask('Atlassian username: ')
        @password = ask('Atlassian password: ')

        template('molflow', options[:path])
      end

      def complete
        say('COMPLETE!', :green)
      end
    end
  end
end
