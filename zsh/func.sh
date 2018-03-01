# file for defining functions for personal use

# function for managing dotfiles
dot() {
case $1 in
    'edit')
        cd $DOTFILES
        shift 1
        eval $EDITOR $@
        cd - 1>/dev/null
    ;;
    'git')
        shift 1
        git --git-dir=$DOTFILES/.git --work-tree=$DOTFILES $@
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
    '')
        cd $DOTFILES
    ;;
    *)
        echo "error: $1 is not a recognized command" >&2
        return 1
    ;;
esac
}

# function for creating time-stamped logfiles/notes
logmd() {
    local ext="md"
    local tag=""
    local overwrite=false
    local edit=true
    local optstr=$(getopt -o 'e::fnt::' --long 'extension::,force,noedit,tag::' -n 'logmd' -- "$@")
    if [ $? -ne 0 ]; then
        return 1
    fi

    eval set -- "$optstr"
    unset optstr

    while true; do
        case "$1" in
            # set the file extension; must be plain text file; default is markdown (.md)
            '-e'|'--extension')
                if [ -z $2 ] ; then
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
                if [ -z $2 ] ; then
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

    local logfile=$(date +"%F$tag.$ext")

    # create new file if necessary
    if [ "$overwrite" = true ] ; then
        read -p "Overwrite $logfile? [y/n]" -n 1 -r
        echo
        #TODO make -y option to bypass confirmation
        if [[ $REPLY =~ ^[^Yy]$ ]] ; then
            echo "Leaving file as is."
        else
            echo > "$logfile"
            echo "Created new file $logfile."
        fi
    fi

    # check if to open file for editing
    if [ "$edit" = false ] && [ ! -f "$logfile" ] ; then
        echo > "$logfile"
        echo "Created new file $logfile."
    elif [ "$edit" = true ] ; then
        eval $EDITOR $logfile
    fi
}
