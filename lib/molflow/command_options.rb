module Molflow
  module CommandOptions

    # molflow install
    def install_options(key)
      case key
      when 'path'
        {
          aliases: ['-p'],
          type: :string,
          default: "#{ENV['HOME']}/.molflow",
          desc: 'Specify a configuration file path.'
        }
      end
    end

    def jira_options(key)
      case key
      when 'user'
        {
          aliases: ['-u'],
          type: :string,
          default: 'currentUser()',
          desc: 'show user issues'
        }
      when 'project'
        {
          aliases: ['-p'],
          type: :string,
          desc: 'show project issues'
        }
      when 'status'
        {
          type: :string,
          default: 'To Do,In Progress',
          desc: 'status filter'
        }
      when 'order'
        {
          type: :string,
          aliases: ['-o'],
          default: 'updatedDate DESC',
          desc: 'order issues'
        }
      when 'issue_key'
        {
          type: :string,
          aliases: [''],
          default: '',
          desc: 'order issues'
        }
      end
    end
  end
end
