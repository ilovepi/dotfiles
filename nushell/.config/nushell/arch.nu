# =============================================================================
# arch.nu — Arch Linux package management + system aliases.
# Sources: your zsh aliases.zsh (the pacman/paru/system block) plus a few of
# the common Oh-My-Zsh `archlinux` plugin (OMZP::archlinux) conveniences.
#
# NOTE: native nu `ls`/`ps` are builtins; external tools are called plainly.
# =============================================================================

# --- pacman / paru (your zsh aliases.zsh) ------------------------------------
alias pacman = sudo pacman --color auto
alias update = sudo pacman -Syyu
alias unlock = sudo rm /var/lib/pacman/db.lck
alias rmpacmanlock = sudo rm /var/lib/pacman/db.lck

# paru AUR helper
alias upall = paru -Syu --noconfirm
alias pksyua = paru -Syu --noconfirm
alias paruskip = paru -S --mflags --skipinteg
alias yayskip = yay -S --mflags --skipinteg

# --- OMZP::archlinux common conveniences (trim freely) -----------------------
alias pacin = sudo pacman -S          # install from repos
alias pacins = sudo pacman -U         # install from a local package file
alias pacre = sudo pacman -R          # remove package, keep deps/config
alias pacrem = sudo pacman -Rns       # remove package + deps + config
alias pacrep = pacman -Si             # info for a repo package
alias pacreps = pacman -Ss            # search repos
alias pacloc = pacman -Qi             # info for an installed package
alias paclocs = pacman -Qs            # search installed packages
alias pacupd = sudo pacman -Sy        # refresh package DB
alias pacfiles = pacman -F            # search for a package owning a file
alias pacls = pacman -Ql              # list files owned by a package
alias pacown = pacman -Qo             # which package owns a file

# --- cleanup / maintenance (your zsh aliases.zsh) ----------------------------
# remove orphaned packages
def cleanup [] {
  let orphans = (do -i { pacman -Qtdq | lines } | default [])
  if ($orphans | is-empty) {
    print "no orphaned packages"
  } else {
    sudo pacman -Rns ...$orphans
  }
}

# recently installed packages (needs `expac`)
def rip [] {
  expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | lines | sort | last 200 | enumerate | each {|r| $"($r.index + 1)\t($r.item)" } | str join "\n"
}

# --- system / boot / fonts (your zsh aliases.zsh) ----------------------------
alias update-grub = sudo grub-mkconfig -o /boot/grub/grub.cfg
alias update-fc = sudo fc-cache -fv
alias jctl = journalctl -p 3 -xb
alias hw = hwinfo --short
alias microcode = grep . /sys/devices/system/cpu/vulnerabilities/*

# --- mirror ranking (your zsh aliases.zsh) -----------------------------------
alias mirror = sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist
alias mirrord = sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist
alias mirrors = sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist
alias mirrora = sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist
alias mirrorx = sudo reflector --age 6 --latest 20 --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist
