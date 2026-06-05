# =============================================================================
# functions.nu — ported zsh functions (aliases.zsh `ex`, clang.sh, psgrep).
# These are `def`s rather than aliases because they take args / pipe / branch.
# =============================================================================

# open args in $EDITOR (nvim, vim fallback). Used by the edit-config defs.
def --wrapped e [...args] { ^$env.EDITOR ...$args }

# structured psgrep — nu-native, nicer than `ps aux | grep`
def psgrep [pattern: string] {
  ps | where name =~ $pattern
}

# EXtractor for archives (zsh `ex`)
def ex [file: path] {
  if not ($file | path exists) {
    print $"'($file)' is not a valid file"
    return
  }
  let f = ($file | str downcase)
  if   ($f | str ends-with .tar.bz2)  { tar xjf $file
  } else if ($f | str ends-with .tar.gz)  { tar xzf $file
  } else if ($f | str ends-with .tar.xz)  { tar xf  $file
  } else if ($f | str ends-with .tar.zst) { tar xf  $file
  } else if ($f | str ends-with .tbz2)    { tar xjf $file
  } else if ($f | str ends-with .tgz)     { tar xzf $file
  } else if ($f | str ends-with .tar)     { tar xf  $file
  } else if ($f | str ends-with .bz2)     { bunzip2 $file
  } else if ($f | str ends-with .gz)      { gunzip  $file
  } else if ($f | str ends-with .rar)     { unrar x $file
  } else if ($f | str ends-with .zip)     { unzip   $file
  } else if ($f | str ends-with .7z)      { ^7z x   $file
  } else if ($f | str ends-with .deb)     { ar x    $file
  } else if ($f | str ends-with .z)       { uncompress $file
  } else { print $"'($file)' cannot be extracted via ex" }
}

# clang-format every C/C++ file under the given dirs (zsh clang.sh)
def clang-format-all [...dirs: path] {
  for dir in $dirs {
    if (($dir | path type) != "dir") {
      print $"($dir) is not a directory"
      continue
    }
    glob ($dir | path join "**" "*.{c,cc,cpp,h,hh,hpp}")
    | each {|f| clang-format -i $f }
  }
}
