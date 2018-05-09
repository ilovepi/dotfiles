# Load theme file
#zplug "caiogondim/bullet-train.zsh", use:bullet-train.zsh-theme, defer:3 # defer until other plugins like oh-my-zsh is loaded
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme
SPACESHIP_VI_MODE_INSERT='\e[91m'  #'\ue780'
SPACESHIP_VI_MODE_NORMAL='' #'\uf441'   #'' # '\ue7a9'
SPACESHIP_VI_MODE_VISUAL=''  #'\ue7a7'



#zplug mafredri/zsh-async, from:github
#zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
#function zle-keymap-select() {
  #zle reset-prompt
  #zle -R
#}

#zle -N zle-keymap-select

#prompt_vi_mode()
#{
    #case ${KEYMAP} in
        #vicmd)
            #prompt='black white %BNORMAL%b'
            #;;
        #viins|main|'')
            #prompt='yellow black %BINSERT%b'
            #;;
        #vivis)
            #prompt='magenta white %BVISUAL%b'
            #;;
        #*)
            #prompt='208 black UNKNOWN'
            #;;
    #esac
    #prompt_segment $(echo $prompt)
#}

#BULLETTRAIN_PROMPT_ORDER=(
    #vi_mode
    #time
    #status
    #context
    #dir
    #screen
    #virtualenv
    ##nvm
    #go
    #rust
    #git
    #cmd_exec_time
  #)

