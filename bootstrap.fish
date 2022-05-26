#!/usr/bin/env fish

set script_dir (realpath (dirname (status -f)))

cd $script_dir;


if test -d ".git"
  git pull origin main;
end

function read_confirm
  while true
    read -l -P 'Any existing files will be renamed to filename.ext.bak. Do you want to continue? [y/N] ' confirm

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
  ln -s "$script_dir"/settings 
  for file in '.curlrc' '.editorconfig' '.gitconfig' '.gitignore' '.screenrc' '.wgetrc'
    if test -e ~/$file
      and not test -L ~/$file
      mv ~/"$file" ~/"$file".bak
    end

    if not test -e ~/$file
      and not test -L ~/$file
      echo "Symlinking $file"
      ln -s "$script_dir/$file"
     else
      echo "$file already symlinked"
    end
  end
end

argparse 'f/force' -- $argv
if set --query _flag_f
	doIt;
else
	if read_confirm
		doIt;
	end
end

