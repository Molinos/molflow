require 'molflow/jira'
require 'molflow/cli/task'

module Molflow
  class CLI < Thor
    class JiraIssues < Task

      def run
        client = Jira.client
        jql = 'assignee = currentUser() AND (status = "To Do" OR status = "In Progress") AND (labels not in (Приостановлен) OR labels is EMPTY) ORDER BY updatedDate DESC'

        issues = client.Issue.jql(jql)

        issues.each do |issue|
          puts "#{issue.key} : #{issue.summary}"
        end
      end
    end
  end
end
