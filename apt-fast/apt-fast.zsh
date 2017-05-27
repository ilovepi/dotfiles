

# superuser operations ######################################################

alias afa='sudo apt-fast autoclean' # aac
alias afb='sudo apt-fast build-dep' # abd
alias afc='sudo apt-fast clean'     # adc
alias afd='sudo apt-fast dselect-upgrade' # ads
alias afi='sudo apt-fast install'  # ai
alias afp='sudo apt-fast purge'    # ap
alias afr='sudo apt-fast remove'   # ar
alias afu='sudo apt-fast update'   # ad
alias afud='sudo apt-fast update && sudo apt-fast dist-upgrade' #adu
alias afug='sudo apt-fast upgrade' # ag
alias afuu='sudo apt-fast update && sudo apt-fast upgrade'      #adg
alias afar='sudo apt-fast autoremove'

compdef _afa afa='sudo apt-fast autoclean'
compdef _afb afb='sudo apt-fast build-dep'
compdef _afc afc='sudo apt-fast clean'
compdef _afd afd='sudo apt-fast dselect-upgrade'
compdef _afi afi='sudo apt-fast install'
compdef _afp afp='sudo apt-fast purge'
compdef _afr afr='sudo apt-fast remove'
compdef _afu afu='sudo apt-fast update'
compdef _afud afud='sudo apt-fast update && sudo apt-fast dist-upgrade'
compdef _afug afug='sudo apt-fast upgrade'
compdef _afuu afuu='sudo apt-fast update && sudo apt-fast upgrade'
compdef _afar afar='sudo apt-fast autoremove'

