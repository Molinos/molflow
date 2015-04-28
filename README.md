# Molflow


## Установка

Установите гем из репозитория

    $ gem install molflow

Затем нужно сконфигурировать

    $ molflow install [-p 'PATH']

**Важно!**: Если выбран не стандартный путь `~/.molflow`, тогда нужно добавить в `~/.bashrc` или `~/.zshrc`
следующую строчку:

    export MOLFLOW_BASE_CONFIG = /custom/path/to/config/.file

Адрес для atlassian molinos: https://molinos.atlassian.net


## Использование

    mf help [COMMAND]   # Describe available commands or one specific command
    mf install          # molflow setup
    mf jira help [COMMAND]    # Describe subcommands or one specific subcommand
    mf jira i ISSUE_KEY  # show issue
    mf jira is           # list issues
    mf jira ps           # list projects

## Планы


    mf jira fs # list all filters
               # ? надо с фильтрами разобраться, к каким есть доступ


    mf jira i:start REN-215 # change status "to do" > "in progress"
                            # --branch -b : 'git checkout master; git checkout -b REN-215'


    mf jira i:verify REN-215 # change status "to do" > "in progress"
                             # --commit -c [:message]     - 'git add . ; git commit -m "REN-215: Task name"' #TODO: description
                             # --merge -m :branch         - 'git checkout :branch; git rebase REN-215'
                             # --log -l :time             - logwork issue

    mf jira i:delegate

    mf init_project # configuration file in directory