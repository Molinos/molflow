require 'molflow/error'
require 'molflow/commands/jira/projects'
require 'molflow/commands/jira/issues'
require 'molflow/commands/jira/client'
require 'molflow/commands/jira/issue'
require 'molflow/command_options'
require 'thor'

module Molflow
  module Commands
    class Jira < Thor
      extend Client
      extend CommandOptions

      method_option  'path', install_options('path')
      desc 'jira ps', 'list projects'
      def ps
        Projects.run
      end

      method_option  'user', jira_options('user')
      method_option  'project', jira_options('project')
      method_option  'status', jira_options('status')
      method_option  'order', jira_options('order')
      desc 'jira is', 'list issues'
      def is
        Issues.run(options)
      end

      method_option  'issue_key', jira_options('issue_key')
      desc 'jira i ISSUE_KEY', 'show issue'
      def i(issue_key)
        Issue.run(options.merge issue_key: issue_key)
      end
    end
  end
end
