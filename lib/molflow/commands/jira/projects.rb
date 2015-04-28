require "molflow/commands/jira"
require "molflow/commands/task"

module Molflow
  module Commands
    class Jira < Thor
      class Projects < Task
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
end
