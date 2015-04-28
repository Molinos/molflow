require 'thor'
require 'pry'
require 'molflow/command_options'
require 'molflow/commands/jira'

module Molflow
  class CLI < Thor
    extend CommandOptions
    register(Commands::Jira, 'jira', 'jira <resource>', 'show info jira resource')

    # molflow install
    method_option  'path', install_options('path')
    desc 'install', 'molflow setup'
    def install
      require 'molflow/commands/install'
      Install.start
    end
  end
end
