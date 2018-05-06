# Load theme file
zplug "caiogondim/bullet-train.zsh", use:bullet-train.zsh-theme, defer:3 # defer until other plugins like oh-my-zsh is loaded

function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select

prompt_vi_mode()
{
    case ${KEYMAP} in
        vicmd)
            prompt='black white NORMAL'
            ;;
        viins|main|'')
            prompt='yellow black INSERT'
            ;;
        vivis)
            prompt='magenta white VISUAL'
            ;;
        *)
            prompt='208 black UNKNOWN'
            ;;
    esac
    prompt_segment $(echo $prompt)
}

BULLETTRAIN_PROMPT_ORDER=(
    vi_mode
    time
    status
    context
    dir
    screen
    virtualenv
    #nvm
    go
    rust
    git
    cmd_exec_time
  )

