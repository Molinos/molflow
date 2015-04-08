require 'jira'
require 'yaml'
require 'pry'

namespace :jira do
  molflow_config_file = Pathname.new(ENV['HOME']).join('.molflow')

  if File.exist?(molflow_config_file)
    YAML.load_file(molflow_config_file)

    options = {
            :username => molflow_config['username'],
            :password => molflow_config['password'],
            :site     => molflow_config['site'],
            :auth_type => :basic,
            :context_path => '',
            :use_ssl => true
          }

    @client = JIRA::Client.new(options)
  end

  task :ps do
    # Show all projects
    @projects = @client.Project.all
    @projects.each do |project|
      puts "#{project.key} : #{project.name}"
    end
  end

  task :is do
    jql = 'assignee = currentUser() AND (status = "To Do" OR status = "In Progress") AND (labels not in (Приостановлен) OR labels is EMPTY) ORDER BY updatedDate DESC'

    @issues = @client.Issue.jql(jql)

    @issues.each do |issue|
      puts "#{issue.key} : #{issue.summary}"
    end
  end
end

