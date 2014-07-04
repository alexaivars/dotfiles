source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config
source ~/.bash/functions

# use settings specific to one system
if [ -f ~/.bash/`uname -n` ]; then
  source ~/.bash/`uname -n`
fi

if [ -f ~/.rvm/scripts/rvm ]; then
  source ~/.rvm/scripts/rvm
fi

if [ -f ~/.nvm/nvm.sh ]; then
	[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM
fi

if [ -f /usr/local/bin/direnv ]; then
	eval `/usr/local/bin/direnv hook $0`
fi
