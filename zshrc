# TEMPLATE WITH (original) COMMENTS AT ~/.oh-my-zsh/templates/zshrc.zsh-template

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH path, recommended to keep default
export ZSH="/home/$USER/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true"
# DISABLE_MAGIC_FUNCTIONS=true
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Highlight foreground color (note: make sure your terminal background is _darker_ than this value)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"
# Suggest by history first, try auto completion afterwards
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(zsh-256color git zsh-autosuggestions fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# Set consistent language to en_GB
export LANG=en_GB.UTF-8
export LANGUAGE="en_GB:en"

# Add deno to exports
export DENO_INSTALL="/home/userr00t/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Add mon2cam alias (for discord screensharing)
alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"

# Load local file in case it exists, custom exports and such for local system (not published to git)
[[ ! -f ~/.zshrc.local ]] || source ~/.zshrc.local

# This loads nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Remove user prompt, TODO: might not be needed with p10k; have to confirm someday
prompt_context(){}

# Auto attach to existing tmux session, otherwise create a new one
if which tmux 2>&1 >/dev/null; then
  if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux attach -t main || tmux new -s main; exit
  fi
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
