source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config

# use settings specific to one system
if [ -f ~/.bash/`uname -n` ]; then
  source ~/.bash/`uname -n`
fi

if [ -f ~/.rvm/scripts/rvm ]; then
  source ~/.rvm/scripts/rvm
fi

