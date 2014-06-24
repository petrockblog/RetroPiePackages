#!/usr/bin/env bash

function getScriptAbsoluteDir() {
    # @description used to get the script path
    # @param $1 the script $0 parameter
    local script_invoke_path="$1"
    local cwd=`pwd`

    # absolute path ? if so, the first character is a /
    if test "x${script_invoke_path:0:1}" = 'x/'
    then
        RESULT=`dirname "$script_invoke_path"`
    else
        RESULT=`dirname "$cwd/$script_invoke_path"`
    fi
}

function import() { 
    # @description importer routine to get external functionality.
    # @description the first location searched is the script directory.
    # @description if not found, search the module in the paths contained in $SHELL_LIBRARY_PATH environment variable
    # @param $1 the .shinc file to import, without .shinc extension
    module=$1

    if test "x$module" == "x"
    then
        echo "$script_name : Unable to import unspecified module. Dying."
        exit 1
    fi

    if test "x${script_absolute_dir:-notset}" == "xnotset"
    then
        echo "$script_name : Undefined script absolute dir. Did you remove getScriptAbsoluteDir? Dying."
        exit 1
    fi

    if test "x$script_absolute_dir" == "x"
    then
        echo "$script_name : empty script path. Dying."
        exit 1
    fi

    if test -e "$script_absolute_dir/$module.shinc"
    then
        # import from script directory
        . "$script_absolute_dir/$module.shinc"
        # echo "Loaded module $script_absolute_dir/$module.shinc"
        return
    elif test "x${SHELL_LIBRARY_PATH:-notset}" != "xnotset"
    then
        # import from the shell script library path
        # save the separator and use the ':' instead
        local saved_IFS="$IFS"
        IFS=':'
        for path in $SHELL_LIBRARY_PATH
        do
            if test -e "$path/$module.shinc"
            then
                . "$path/$module.shinc"
                return
            fi
        done
        # restore the standard separator
        IFS="$saved_IFS"
    fi
    echo "$script_name : Unable to find module $module."
    exit 1
}

rps_checkNeededPackages
import "scriptmodules/retropiesetup"

# make sure that RetroPie-Setup log directory exists
if [[ ! -d $scriptdir/logs ]]; then
    mkdir -p "$scriptdir/logs"
    chown $user "$scriptdir/logs"
    chgrp $user "$scriptdir/logs"
    if [[ ! -d $scriptdir/logs ]]; then
      echo "Couldn't make directory $scriptdir/logs"
      exit 1
    fi
fi

rootdir=/opt/RetroPie

# make sure that enough space is available
rps_availFreeDiskSpace 800000

while true; do
    cmd=(dialog --backtitle "PetRockBlock.com - RetroPie Setup. Installation folder: $rootdir for user $user" --menu "Choose installation either based on binaries or on sources." 22 76 16)
    options=(1 "Binaries-based INSTALLATION (faster, but possibly not up-to-date)"
             2 "Source-based INSTALLATION (16-20 hours (!), but up-to-date versions)"
             3 "SETUP (only if you already have run one of the installations above)"
             4 "UPDATE RetroPie Setup script"
             5 "UPDATE RetroPie Binaries"
             6 "UNINSTALL RetroPie installation"
             7 "Perform REBOOT" )
    choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)    
    if [ "$choices" != "" ]; then
        case $choices in
            1) now=$(date +'%d%m%Y_%H%M%S')
               {
                    rps_main_binaries
               } 2>&1 | tee >(gzip --stdout > $scriptdir/logs/run_$now.log.gz)
               chown -R $user $scriptdir/logs/run_$now.log.gz
               chgrp -R $user $scriptdir/logs/run_$now.log.gz
               ;;
            2) rps_main_options ;;
            3) rps_main_setup ;;
            4) rps_main_updatescript ;;
            5) rps_downloadBinaries ;;
            6) rc_removeAPTPackages ;;
            7) rps_main_reboot ;;
        esac
    else
        break
    fi
done
