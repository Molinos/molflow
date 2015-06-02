require 'thor'
require 'pry'
require 'molflow/command_options'
require 'molflow/commands/jira'
require 'molflow/commands/open'

module Molflow
  class CLI < Thor
    extend CommandOptions
    register(Commands::Jira, 'jira', 'jira <resource>', 'show info jira resource')
    register(Commands::Open, 'open', 'open <resource>', 'open resource in browser')

    # molflow install
    method_option  'path', install_options('path')
    desc 'install', 'molflow setup'
    def install
      require 'molflow/commands/install'
      Commands::Install.start
    end

  end
end
