require 'molflow/error'
require 'molflow/commands/jira/client'
require 'molflow/command_options'
require 'launchy'
require 'thor'

module Molflow
  module Commands
    class Open < Thor
      include Thor::Actions
      extend Jira::Client
      extend CommandOptions

      desc 'open p PROJECT_KEY', 'open project in browser'
      def pr(project_key)
        options.merge! project_key: project_key

        client = Jira.client
        project =  client.Project.find(options[:project_key])

        Launchy.open URI("#{client.options[:site]}/browse/#{project.key}").to_s
      rescue
        puts 'Not found'
      end

      desc 'open i ISSUE_KEY', 'open issue in browser'
      def i(issue_key)
        options.merge! issue_key: issue_key

        client = Jira.client
        issue =  client.Issue.find(options[:issue_key])

        Launchy.open URI("#{client.options[:site]}/browse/#{issue.key}").to_s
       rescue
        puts 'Not found'
      end

      desc 'open any JIRA element. skip api request', 'open browse page in jira'
      def j(jira_key)
        options.merge! jira_key: jira_key

        client = Jira.client
        Launchy.open URI("#{client.options[:site]}/browse/#{options[:jira_key]}").to_s
       rescue
        puts 'ERROR!'
      end

    end
  end
end
