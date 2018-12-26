# file for defining functions for personal use

# function for managing dotfiles
dot() {
case $1 in
    ''|'cd')
        cd $DOTFILES
    ;;
    'edit')
        pushd -q $DOTFILES
        shift 1
        eval $EDITOR $@
        popd -q
    ;;
    'git')
        shift 1
        git --git-dir=$DOTFILES/.git --work-tree=$DOTFILES $@
    ;;
    'source'|'src'|'.')
        if [[ -z $2 || $2 == 'zsh' ]] ; then
            echo "Sourcing $HOME/.zshrc"
            source $HOME/.zshrc
        fi
    ;;
    'ls')
        ls $DOTFILES
    ;;
    'tree')
        tree $DOTFILES
    ;;
    'dir')
        echo $DOTFILES
    ;;
    *)
        echo "error: $1 is not a recognized command" >&2
        return 1
    ;;
esac
}


tmuxcd() {
    (cd $@; tmux new-session -s${PWD##*/})
}


# function for creating time-stamped logfiles/notes
logmd() {
    local ext=".md"
    local tag=""
    local overwrite=false
    local edit=true
    local opts=''
    # parse options with getopt
    if ! opts=$(getopt -o 'e:fnt:' --long 'extension:,force,noedit,tag:' -n 'logmd' -- "$@") ; then
        return 1
    fi
    eval set -- "$opts"

    while true; do
    case "$1" in
        # set the file extension; must be plain text file; default is markdown (.md)
        '-e'|'--extension')
            if [[ -z $2 ]] ; then
                echo "error: no extension specified" >&2
                return 1
            fi
            ext="$2"
            shift 2
            continue
        ;;
        # force new copy of file; OVERWRITES THE FILE SO BE CAREFUL
        '-f'|'--force')
            overwrite=true
            shift 1
            continue
        ;;
        # don't edit file, just make sure it exists
        '-n'|'--noedit')
            edit=false
            shift 1
            continue
        ;;
        # the last call to tag will be the tag used
        '-t'|'--tag')
            if [[ -z $2 ]] ; then
                echo "error: no tag specified" >&2
                return 1
            fi
            tag="-$2"
            shift 2
            continue
        ;;
        '--')
            shift
            break
        ;;
        *)
            echo "error: $1 is not a recognized command" >&2
            return 1
        ;;
    esac
    done

    local logfile=$(date +"%F$tag$ext")
    
    # create new file if necessary
    if [[ $overwrite = true && -f $logfile ]] ; then
        # check whether to overwrite file
        if ! read -q "?Overwrite $logfile? [y/n] " ; then
            echo
            echo "Aborting"
            return 1
        fi
        echo
    fi
    
    if [[ -f $logfile && $overwrite != true ]] ; then
        echo "$logfile already exists"
    else
        echo > "$logfile"
        echo "Created new file $logfile."
    fi

    # open file for editing unless flagged
    if [[ $edit = true ]] ; then
        eval $EDITOR $logfile
    fi
}
