#####################################################################
# options
######################################################################
# Options {{{
setopt auto_resume
# Ignore <C-d> logout
setopt ignore_eof
# Disable beeps
setopt no_beep
# {a-c} -> a b c
setopt brace_ccl
# Enable spellcheck
setopt correct
# Enable "=command" feature
setopt equals
# Disable flow control
setopt no_flow_control
# Better jobs
setopt long_list_jobs
# Enable completion in "--option=arg"
setopt magic_equal_subst
# Add "/" if completes directory
setopt mark_dirs
# Expand globs when completion
setopt glob_complete
# Enable multi io redirection
setopt multios
# Can search subdirectory in $PATH
setopt path_dirs
# For multi byte
setopt print_eight_bit
# Print exit value if return code is non-zero
unsetopt print_exit_value
setopt pushd_ignore_dups
setopt pushd_silent
# Short statements in for, repeat, select, if, function
setopt short_loops
setopt transient_rprompt
setopt hash_cmds
setopt numeric_glob_sort
# Enable comment string
setopt interactive_comments
# Enable extended glob
setopt extended_glob
unsetopt nomatch
# Note: It is a lot of errors in script
# setopt no_unset
# Prompt substitution
setopt prompt_subst
if [[ ${VIMSHELL_TERM:-""} != "" ]]; then
    setopt no_always_last_prompt
else
    setopt always_last_prompt
fi
# List completion
setopt auto_list
setopt auto_param_slash
setopt auto_param_keys
# List like "ls -F"
setopt list_types
# Compact completion
setopt list_packed
setopt auto_cd
setopt auto_pushd
setopt pushd_minus
setopt pushd_ignore_dups
# Check original command in alias completion
setopt complete_aliases
# }}}


