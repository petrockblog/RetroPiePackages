#!/usr/bin/env bash

# global variables
__cmdid=()
__description=()
__sources=()
__build=()
__install=()
__configure=()
__package=()
__doPackages=0

rootdir="/opt/retropie"
romroot="~/RetroPie/roms"

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

# params: $1=ID, $2=description, $3=sources, $4=build, $5=install, $6=configure, $7=package
function rp_registerFunction() {
	__cmdid+=($1)
	__description[$1]=$2
	__sources[$1]=$3
	__build[$1]=$4
	__install[$1]=$5
	__configure[$1]=$6
	__package[$1]=$7
}

function rp_listFunctions() {
	local id

    echo -e "Command-ID: Description:\tList of available actions [sources|build|install|configure|package]"
    echo "--------------------------------------------------"
	for (( i = 0; i < ${#__cmdid[@]}; i++ )); do
		id=${__cmdid[$i]};
		echo -e "$id:\t${__description[$id]}:\t\c"
		fn_exists ${__sources[$id]} && echo -e "sources \c"
		fn_exists ${__build[$id]} && echo -e "build \c"
		fn_exists ${__install[$id]} && echo -e "install \c"
		fn_exists ${__configure[$id]} && echo -e "configure \c"
		fn_exists ${__package[$id]} && echo -e "package \c"
		echo ""
	done
    echo "=================================================="
}

function rp_printUsageinfo() {
    echo -e "Usage information:\nCall retropackages.sh in the following way:\n./retropackages.sh <ID>\nThis will run the actions sources, build, install, configure, and package automatically.\n"
    echo -e "Alternatively, retropackages.sh can be called as\n./retropackages.sh <ID> [sources|build|install|configure|package]\n"
    echo -e "This is a list of valid commands:\n"
    rp_listFunctions
}

# -------------------------------------------------------------

# check, if sudo is used
if [ $(id -u) -ne 0 ]; then
    printf "Script must be run as root. Try 'sudo ./retropackages'\n"
    exit 1
fi   

# load script modules
script_invoke_path="$0"
script_name=`basename "$0"`
getScriptAbsoluteDir "$script_invoke_path"
script_absolute_dir=$RESULT
home=$(eval echo ~$user)
import "scriptmodules/helpers"
import "scriptmodules/emulators"
import "scriptmodules/libretrocores"
import "scriptmodules/supplementary"

# ==========================================================================
# ==========================================================================

# register script functions
# rp_registerFunction "" "" "" "" "" "" ""

# Emulators
rp_registerFunction "100" "RetroArch                      " "sources_retroarch"       "build_retroarch"         "install_retroarch"         "configure_retroarch"       ""
rp_registerFunction "101" "AdvMame                        " "sources_advmame"         "build_advmame"           "install_advmame"           "configure_advmame"         ""
rp_registerFunction "102" "Amiga emulator UAE4All         " "sources_uae4all"         "build_uae4all"           "install_uae4all"           "configure_uae4all"         ""
rp_registerFunction "103" "Atari 800 emulator             " "sources_atari800"        "build_atari800"          "install_atari800"          "configure_atari800"        ""
rp_registerFunction "104" "Armstrad CPC emulator          " "sources_cpc"             "build_cpc"               "install_cpc"               "configure_cpc"             ""
rp_registerFunction "105" "DOS Emulator Dosbox            " ""                        ""                        "install_dosbox"            "configure_dosbox"          ""
rp_registerFunction "106" "Atari2600 emulator STELLA      " ""                        ""                        "install_stella"            "configure_stella"          ""
rp_registerFunction "107" "Macintosh emulator             " "sources_basilisk"        "build_basilisk"          "install_basilisk"          "configure_basilisk"        ""
rp_registerFunction "108" "C64 emulator VICE              " "sources_vice"            "build_vice"              "install_vice"              "configure_vice"            ""
rp_registerFunction "108" "C64 ROMs                       " ""                        ""                        "install_c64roms"           ""                          ""
rp_registerFunction "109" "Duke3D Port                    " ""                        ""                        "install_eduke32"           ""                          ""
rp_registerFunction "110" "GameBoy Advance emulator       " "sources_gpsp"            "build_gpsp"              "install_gpsp"              "configure_gpsp"            ""
rp_registerFunction "111" "NeoGeo emulator GnGeoPi        " "sources_gngeopi"         "build_gngeopi"           "install_gngeopi"           "configure_gngeopi"         ""
rp_registerFunction "112" "Atari emulator Hatari          " ""                        ""                        "install_hatari"           ""                          ""

# LibretroCores functions
rp_registerFunction "200" "SNES LibretroCore PocketSNES   " "sources_pocketsnes"       "build_pocketsnes"       "install_pocketsnes"        "configure_pocketsnes"      ""
rp_registerFunction "201" "Genesis LibretroCore Picodrive " "sources_picodrive"        "build_picodrive"        "install_picodrive"         "configure_picodrive"       ""

# Supplementary functions
rp_registerFunction "300" "Update APT packages            " ""                         ""                       "install_APTPackages" "" ""
rp_registerFunction "301" "Package Repository             " ""                         ""                       "install_PackageRepository" "" ""
rp_registerFunction "302" "SDL 2.0.1                      " "sources_sdl"              "build_sdl"              "install_sdl"               "" ""
rp_registerFunction "303" "EmulationStation               " "sources_EmulationStation" "build_EmulationStation" "install_EmulationStation"  "configure_EmulationStation" "package_EmulationStation"
rp_registerFunction "304" "EmulationStation Theme Simple  " ""                         ""                       "install_ESThemeSimple"     "" ""

# ==========================================================================
# ==========================================================================


# ID mode
if [[ $# -eq 1 ]]; then
	id=$1
	fn_exists ${__sources[$id]} && ${__sources[$id]}
	fn_exists ${__build[$id]} && ${__build[$id]}
	fn_exists ${__install[$id]} && ${__install[$id]}
	fn_exists ${__configure[$id]} && ${__configure[$id]}
	fn_exists ${__package[$id]} && ${__package[$id]}
elif [[ $# -eq 2 ]]; then
    id=$1
    if [ "$2" == "sources" ]; then
        fn_exists ${__sources[$id]} && ${__sources[$id]}
    fi
    if [ "$2" == "build" ]; then
        fn_exists ${__build[$id]} && ${__build[$id]}
    fi
    if [ "$2" == "install" ]; then
        fn_exists ${__install[$id]} && ${__install[$id]}
    fi
    if [ "$2" == "configure" ]; then
        fn_exists ${__configure[$id]} && ${__configure[$id]}
    fi
    if [ "$2" == "install" ]; then
        fn_exists ${__package[$id]} && ${__package[$id]}
    fi
else
    rp_printUsageinfo
fi
