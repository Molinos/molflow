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

    $ molflow jira:ps
    $ molflow jira:is

## Планы

    mf jira ps # list all projects
               # --my                       - only you projects

    mf jira is # list all issues
               # --user -u [:username]      – user issues; default current
               # --project -p [:projectkey] - user issues; default all
               # --todo -u                  - only "to do" status issues
               # --sprint -s [:sprint]      – issues by sprint, default: current
               # --fields -f :fields        - show fields, #TODO: default
               # --jql                      - jql request

    mf jira fs # list all filters
               # ? надо с фильтрами разобраться, к каким есть доступ

    mf jira i REN-215 # show issue info
                      # --fields -f :fields  - show fields, #TODO: default
                      # --comments -c        - show_comments

    mf jira i:start REN-215 # change status "to do" > "in progress"
                            # --branch -b : 'git checkout master; git checkout -b REN-215'


    mf jira i:verify REN-215 # change status "to do" > "in progress"
                             # --commit -c [:message]     - 'git add . ; git commit -m "REN-215: Task name"' #TODO: description
                             # --merge -m :branch         - 'git checkout :branch; git rebase REN-215'
                             # --log -l :time             - logwork issue

    mf jira i:delegate

    mf init_project # configuration file in directory