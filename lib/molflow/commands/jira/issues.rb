require "molflow/commands/jira"
require "molflow/commands/task"

module Molflow
  module Commands
    class Jira < Thor
      class Issues < Task
        def run
          client = Jira.client
          jql = "assignee = #{options['user']}"
          jql += " AND project = '#{options['project']}'" unless options["project"].nil?
          if options['status'].present?
            jql += ' AND ('
            statuses = options['status'].split(',')
            statuses.each do |status|
              jql += " OR" if status != statuses.first
              jql += " status = '#{status}'"
            end
            jql += ')'
          end

          jql += " ORDER BY #{options['order']}"
          issues = client.Issue.jql(jql)

          issues.each do |issue|
            puts "#{issue.key} : #{issue.summary}"
          end
        end
      end
    end
  end
end
