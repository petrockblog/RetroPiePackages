#!/bin/bash

pushd "/etc/emulationstation/themes/"

filelist=()

# XML, art and sound files, show with find /etc/emulationstation/themes/simple/ -type f -name "*.jpg" -o -name "*.png" -o -name "*.wav" -o -name "*.xml" -o -name "*.txt" -o -name "*.ttf" | sort
filelist+=("./simple/3do/art/3do_art_blur.jpg")
filelist+=("./simple/3do/art/3do_art.png")
filelist+=("./simple/3do/theme.xml")
filelist+=("./simple/amiga/art/ami_art_blur.jpg")
filelist+=("./simple/amiga/art/ami_art.png")
filelist+=("./simple/amiga/theme.xml")
filelist+=("./simple/amstradcpc/art/cpc_art_blur.jpg")
filelist+=("./simple/amstradcpc/art/cpc_art.png")
filelist+=("./simple/amstradcpc/theme.xml")
filelist+=("./simple/apple2/art/apple2_art_blur.jpg")
filelist+=("./simple/apple2/art/apple2_art.png")
filelist+=("./simple/apple2/theme.xml")
filelist+=("./simple/art/bright.png")
filelist+=("./simple/art/dark.png")
filelist+=("./simple/art/mid.png")
filelist+=("./simple/art/white.png")
filelist+=("./simple/atari2600/art/a2600_art_blur.jpg")
filelist+=("./simple/atari2600/art/a2600_art.png")
filelist+=("./simple/atari2600/theme.xml")
filelist+=("./simple/atari5200/art/a5200_art_blur.jpg")
filelist+=("./simple/atari5200/art/a5200_art.png")
filelist+=("./simple/atari5200/theme.xml")
filelist+=("./simple/atari7800/art/a7800_art_blur.jpg")
filelist+=("./simple/atari7800/art/a7800_art.png")
filelist+=("./simple/atari7800/theme.xml")
filelist+=("./simple/atari800/art/a800_art_blur.jpg")
filelist+=("./simple/atari800/art/a800_art.png")
filelist+=("./simple/atari800/theme.xml")
filelist+=("./simple/atarifalcon/art/atafal_art_blur.jpg")
filelist+=("./simple/atarifalcon/art/atafal_art.png")
filelist+=("./simple/atarifalcon/theme.xml")
filelist+=("./simple/atarijaguar/art/jag_art_blur.jpg")
filelist+=("./simple/atarijaguar/art/jag_art.png")
filelist+=("./simple/atarijaguarcd/art/jcd_art_blur.jpg")
filelist+=("./simple/atarijaguarcd/art/jcd_art.png")
filelist+=("./simple/atarijaguarcd/theme.xml")
filelist+=("./simple/atarijaguar/theme.xml")
filelist+=("./simple/atarist/art/ast_art_blur.jpg")
filelist+=("./simple/atarist/art/ast_art.png")
filelist+=("./simple/atarist/theme.xml")
filelist+=("./simple/atarixe/art/axe_art_blur.jpg")
filelist+=("./simple/atarixe/art/axe_art.png")
filelist+=("./simple/atarixe/theme.xml")
filelist+=("./simple/c64/art/c64_art_blur.jpg")
filelist+=("./simple/c64/art/c64_art.png")
filelist+=("./simple/c64/theme.xml")
filelist+=("./simple/colecovision/art/col_art_blur.jpg")
filelist+=("./simple/colecovision/art/col_art.png")
filelist+=("./simple/colecovision/theme.xml")
filelist+=("./simple/fba/art/fba_art_blur.jpg")
filelist+=("./simple/fba/art/fba_art.png")
filelist+=("./simple/fba/theme.xml")
filelist+=("./simple/gamegear/art/gg_art_blur.jpg")
filelist+=("./simple/gamegear/art/gg_art.png")
filelist+=("./simple/gamegear/theme.xml")
filelist+=("./simple/gba/art/gba_art_blur.jpg")
filelist+=("./simple/gba/art/gba_art.png")
filelist+=("./simple/gb/art/gb_art_blur.jpg")
filelist+=("./simple/gb/art/gb_art.png")
filelist+=("./simple/gba/theme.xml")
filelist+=("./simple/gbc/art/gbc_art_blur.jpg")
filelist+=("./simple/gbc/art/gbc_art.png")
filelist+=("./simple/gbc/theme.xml")
filelist+=("./simple/gb/theme.xml")
filelist+=("./simple/gc/art/gc_art_blur.jpg")
filelist+=("./simple/gc/art/gc_art.png")
filelist+=("./simple/gc/theme.xml")
filelist+=("./simple/intellivision/art/int_art_blur.jpg")
filelist+=("./simple/intellivision/art/int_art.png")
filelist+=("./simple/intellivision/theme.xml")
filelist+=("./simple/macintosh/art/mac_art_blur.jpg")
filelist+=("./simple/macintosh/art/mac_art.png")
filelist+=("./simple/macintosh/theme.xml")
filelist+=("./simple/mame/art/mame_art_blur.jpg")
filelist+=("./simple/mame/art/mame_art.png")
filelist+=("./simple/mame/theme.xml")
filelist+=("./simple/mastersystem/art/sms_art_blur.jpg")
filelist+=("./simple/mastersystem/art/sms_art.png")
filelist+=("./simple/mastersystem/theme.xml")
filelist+=("./simple/megadrive/art/gen_art_blur.jpg")
filelist+=("./simple/megadrive/art/gen_art.png")
filelist+=("./simple/megadrive/theme.xml")
filelist+=("./simple/n64/art/n64_art_blur.jpg")
filelist+=("./simple/n64/art/n64_art.png")
filelist+=("./simple/n64/theme.xml")
filelist+=("./simple/neogeo/art/neogeo_art_blur.jpg")
filelist+=("./simple/neogeo/art/neogeo_art.png")
filelist+=("./simple/neogeo/theme.xml")
filelist+=("./simple/nes/art/nes_art_blur.jpg")
filelist+=("./simple/nes/art/nes_art.png")
filelist+=("./simple/nes/theme.xml")
filelist+=("./simple/ngp/art/ngp_art_blur.jpg")
filelist+=("./simple/ngp/art/ngp_art.png")
filelist+=("./simple/ngpc/art/ngpc_art_blur.jpg")
filelist+=("./simple/ngpc/art/ngpc_art.png")
filelist+=("./simple/ngpc/theme.xml")
filelist+=("./simple/ngp/theme.xml")
filelist+=("./simple/pc/art/pc1_art_blur.jpg")
filelist+=("./simple/pc/art/pc1_art.png")
filelist+=("./simple/pc/art/pc2_art_blur.jpg")
filelist+=("./simple/pc/art/pc2_art.jpg")
filelist+=("./simple/pcengine/art/tg16_art_blur.jpg")
filelist+=("./simple/pcengine/art/tg16_art.png")
filelist+=("./simple/pcengine/theme.xml")
filelist+=("./simple/pc/theme.xml")
filelist+=("./simple/ports/art/ports2_art_blur.jpg")
filelist+=("./simple/ports/art/ports2_art.png")
filelist+=("./simple/ports/art/ports_art_blur.jpg")
filelist+=("./simple/ports/art/ports_art.png")
filelist+=("./simple/ports/theme.xml")
filelist+=("./simple/psx/art/psx_art_blur.jpg")
filelist+=("./simple/psx/art/psx_art.png")
filelist+=("./simple/psx/theme.xml")
filelist+=("./simple/readme.txt")
filelist+=("./simple/scummvm/art/scummvm_art_blur.jpg")
filelist+=("./simple/scummvm/art/scummvm_art.png")
filelist+=("./simple/scummvm/theme.xml")
filelist+=("./simple/sega32x/art/32x_art_blur.jpg")
filelist+=("./simple/sega32x/art/32x_art.png")
filelist+=("./simple/sega32x/theme.xml")
filelist+=("./simple/segacd/art/scd_art_blur.jpg")
filelist+=("./simple/segacd/art/scd_art.png")
filelist+=("./simple/segacd/theme.xml")
filelist+=("./simple/simple.xml")
filelist+=("./simple/snes/art/snes_art_blur.jpg")
filelist+=("./simple/snes/art/snes_art.png")
filelist+=("./simple/snes/theme.xml")
filelist+=("./simple/zmachine/art/izm_art_blur.jpg")
filelist+=("./simple/zmachine/art/izm_art.png")
filelist+=("./simple/zmachine/theme.xml")
filelist+=("./simple/zxspectrum/art/zxs_art_blur.jpg")
filelist+=("./simple/zxspectrum/art/zxs_art.png")
filelist+=("./simple/zxspectrum/theme.xml")

echo "Checking, if all directories/files exist"
tLen=${#filelist[@]}
for (( i=0; i<${tLen}; i++ ));
do
	if [[ ! -d "${filelist[$i]}" && ! -f "${filelist[$i]}" ]]
	then
	  echo "Cannot find directory ${filelist[$i]}."
	  exit
	fi
done

tar -c -vf /home/pi/ESThemeSimple_`date +%d%m%y`.tar ${filelist[0]}

tLen=${#filelist[@]}
for (( i=1; i<${tLen}; i++ ));
do
	tar -r -vf /home/pi/ESThemeSimple_`date +%d%m%y`.tar ${filelist[$i]}
done

if [[ -f /home/pi/ESThemeSimple_`date +%d%m%y`.tar.bz2 ]]; then
	rm /home/pi/ESThemeSimple_`date +%d%m%y`.tar.bz2
fi
bzip2 /home/pi/ESThemeSimple_`date +%d%m%y`.tar

echo "Done."

popd
