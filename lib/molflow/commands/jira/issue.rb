require "molflow/commands/jira"
require "molflow/commands/task"

module Molflow
  module Commands
    class Jira < Thor
      class Issue < Task

        def run
          client = Jira.client
          issue = client.Issue.find(options["issue_key"])

          puts "#{issue.key} : #{issue.summary} : #{issue.status.name}"
          puts "creator : #{issue.creator['name']}"
          puts ""
          puts issue.description
        end

        private

        def actions

        end
      end

      class Actions
        include Thor::Actions
      end
    end
  end
end
