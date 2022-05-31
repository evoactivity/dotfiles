#!/usr/bin/env fish

set script_dir (realpath (dirname (status -f)))

cd $script_dir


if test -d ".git"
    git pull origin main
end

function read_confirm
    while true
        read -l -P 'Any existing dotfiles will be renamed to filename.ext.bak. Do you want to continue? [y/N] ' confirm

        switch $confirm
            case Y y
                return 0
            case '' N n
                return 1
        end
    end
end

function doIt

    cd $HOME

    for file in .curlrc \
        .editorconfig \
        .gitconfig \
        .gitignore \
        .screenrc \
        .wgetrc \
        settings \
        .config/fish/completions \
        .config/fish/conf.d \
        .config/fish/functions \
        .config/fish/aliases.fish \
        .config/fish/config.fish \
        .config/fish/.iterm2_shell_integration.fish

        echo ''
        echo ''
        echo "------------------ $file ------------------"

        if test -e ~/$file
            if not test -L ~/$file
                echo "Not a symlink, will backup $file"
                mv ~/"$file" ~/"$file".bak
            end
        end

        echo "Symlinking $file"
        ln -s -f -h "$script_dir/$file" ~/$file

    end
end

argparse f/force -- $argv
if set --query _flag_f
    doIt
else
    if read_confirm
        doIt
    end
end
