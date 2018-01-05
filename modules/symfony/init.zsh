#
# Defines Symfony2 basic command aliases and enables command completion.
#
# Authors:
#   longkey1 <longkey1@gmail.com>
#
# This module ported from the symfony2 plugin of oh-my-zsh.
#
# Refs:
#   https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/symfony2/symfony2.plugin.zsh
#

_symfony_console () {
  echo "php $(find . -maxdepth 2 -mindepth 1 -name 'console' -type f | head -n 1)"
}

_symfony_get_command_list () {
   `_symfony_console` --no-ansi | sed "1,/Available commands/d" | awk '{ print $1 }' | grep ':'
}

_symfony () {
   compadd `_symfony_get_command_list`
}

compdef _symfony '`_symfony_console`'
compdef _symfony 'app/console'
compdef _symfony 'bin/console'
compdef _symfony sf

#Alias
alias sf='`_symfony_console`'
alias sfcl='sf cache:clear'
alias sfcle='sf cache:clear -e=prod'
alias sfai='sf assets:install'
alias sfsr='sf server:run -vvv'
alias sfsc='sf security:check'
alias sfcw='sf cache:warmup'
alias sfroute='sf debug:router'
alias sfcontainer='sf debug:container'
alias sfgb='sf generate:bundle'
alias sfgc='sf generate:controller'
alias sfdev='sf --env=dev'
alias sfprod='sf --env=prod'
#Doctrine alias
alias sfge='sf doctrine:generate:entity'
alias sfdc='sf doctrine:database:create'
alias sfdd='sf doctrine:database:drop --force'
alias sfsc='sf doctrine:schema:create'
alias sfsu='sf doctrine:schema:update'
alias sfdud='sf doctrine:schema:update --dump-sql'
alias sfduf='sf doctrine:schema:update --force'
#Need DoctrineFixturesBundle
alias sffixtures='sf doctrine:fixtures:load'