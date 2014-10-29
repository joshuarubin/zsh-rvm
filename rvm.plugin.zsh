if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  path[1,0]="$HOME/.rvm/bin"
  source "$HOME/.rvm/scripts/rvm"

  if
    [[ -n "${ZSH_VERSION:-}" ]]
  then
    # zsh completion for Ruby Version Manager (RVM), thanks to https://github.com/JoeKun
    [[ " ${fpath[*]} " =~ " ${rvm_scripts_path:-$rvm_path/scripts}/extras/completion.zsh " ]] ||
    {
      fpath+=( "${rvm_scripts_path:-$rvm_path/scripts}/extras/completion.zsh" )
      if
        [[ -n "${_comp_dumpfile:-}" ]]
      then
        \rm -f "$_comp_dumpfile"
        compinit -d "$_comp_dumpfile"
      fi
    }
  elif
    [[ -n "${BASH_VERSION:-}" ]]
  then
    # bash completion for Ruby Version Manager (RVM)
    source "${rvm_scripts_path:-$rvm_path/scripts}/extras/completion.bash"
    complete -o default -o nospace -F _rvm rvm
  else
    echo "RVM does not support yours shell completion jet."
  fi
fi
