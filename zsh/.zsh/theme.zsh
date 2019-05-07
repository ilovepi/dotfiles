# Load theme file
#zplug "caiogondim/bullet-train.zsh", use:bullet-train.zsh-theme, defer:3 # defer until other plugins like oh-my-zsh is loaded
#zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme
#zplug runthee/zsh-theme-nerdish, use:nerdish.zsh, from:github, as:theme
#SPACESHIP_VI_MODE_INSERT='%{\e[91m%}'  #'\ue780'
#SPACESHIP_VI_MODE_INSERT=%{$fg_bold[yellow]%}''  #'\ue780'
#SPACESHIP_VI_MODE_NORMAL='' #'\uf441'   #'' # '\ue7a9'
#SPACESHIP_VI_MODE_VISUAL=''  #'\ue7a7'


#SPACESHIP_VI_MODE_REPLACE=%{$fg_bold[red]%}'𝗥'  #'\U1d5e5'
#SPACESHIP_VI_MODE_NORMAL=%{$fg_bold[grey]%}'𝗡'  #'\U1d5e1'
#SPACESHIP_VI_MODE_INSERT=%{$fg_bold[yellow]%}'𝗜'  #'\U1d5dc'
#SPACESHIP_VI_MODE_VISUAL=%{$fg_bold[magenta]%}'𝗩'  #'\U1d5e9'
#SPACESHIP_VI_MODE_INSERT=''  #'\uf490'

#SPACESHIP_VI_MODE_NORMAL=%{$fg[blue]%}'Ⓝ'  #'\u24c3'
#SPACESHIP_VI_MODE_INSERT=%{$fg[yellow]%}'Ⓘ'  #'\u24be'
#SPACESHIP_VI_MODE_VISUAL=%{$fg[magenta]%}'Ⓥ'  #'\u24cb'
#SPACESHIP_HG_SHOW=false



zplugin light mafredri/zsh-async
zplugin light sindresorhus/pure

#zplug mafredri/zsh-async, from:github
#zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
#function zle-keymap-select() {
  #zle reset-prompt
  #zle -R
#}

#zle -N zle-keymap-select

#
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

