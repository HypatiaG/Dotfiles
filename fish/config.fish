source /usr/share/cachyos-fish-config/cachyos-config.fish

alias musicsync "adbsync push /home/hypatiac/Music/. /sdcard/Music/Seeker/nicotine/"

function cd
    builtin cd $argv
    eza --grid --icons
end

zoxide init fish | source

function z --wraps=__zoxide_z
    __zoxide_z $argv
    eza --grid --icons
end

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
