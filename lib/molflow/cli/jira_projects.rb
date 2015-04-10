require "molflow/jira"
require "molflow/cli/task"

module Molflow
  class CLI < Thor
    class JiraProjects < Task

      def run
        client = Jira.client
        @projects = client.Project.all

        @projects.each do |project|
          puts("#{project.key} : #{project.name}")
        end
      end
    end
  end
end
