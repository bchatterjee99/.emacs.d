
go() # go marker
{
    case $1 in
## isi -------------------------------------------------------------
	"isi")
	        cd /mnt/localdisk_d/__isi/
	;;
	"prob") # probability and statistics
	        cd /mnt/localdisk_d/__isi/sem1/prob/
	;;
	"ant") # algebra and number theory
	        cd /mnt/localdisk_d/__isi/sem1/ant/
	;;
	"book") # boi
	        cd /mnt/localdisk_d/__isi/book/
	;;
	"golpo") # golper boi
	        cd /mnt/localdisk_d/__isi/book/golpo/
	;;
	"l") # local disk
	        cd /mnt/localdisk_d/
	;;

## faltu --------------------------------------------------------------------------------
	"faltu")
		cd /mnt/localdisk_d/__isi/faltu/
	;;
	"ju")
		cd /mnt/localdisk_d/__jadavpur/
	;;
	"curses")
		cd /mnt/localdisk_d/__jadavpur/faltu/curses/
	;;
	"graph")
		cd /mnt/localdisk_d/__jadavpur/book/graph/
	;;
	"ctf")
		cd /mnt/localdisk_d/__jadavpur/ctf/
	;;
	"history")
		cd /mnt/localdisk_d/__jadavpur/faltu/history/
	;;
	"engine") # asadharon ascii renderer
		cd /mnt/localdisk_d/__jadavpur/faltu/curses/engine/
	;;
	"dm") # asadharon dm
		cd /mnt/localdisk_d/__jadavpur/faltu/curses/asadharon-dm/
	;;
	"emudev")
		cd /mnt/localdisk_d/__jadavpur/faltu/emudev/
	;;
	"prolog")
		cd /mnt/localdisk_d/__jadavpur/sem6/ppl/prolog/
	;;
	"chip")
		cd /mnt/localdisk_d/__jadavpur/faltu/emudev/chip8/emu/
	;;
	"infocom")
		cd /mnt/localdisk_d/__jadavpur/infocom/
	;;
	"dwarf")
		cd /mnt/localdisk_d/__jadavpur/infocom/dwarf-fortress-LNP/df_linux/data/save/
	;;
	"cdda")
		cd /mnt/localdisk_d/__jadavpur/infocom/cataclysm/Cataclysm-DDA/
	;;
	"snes")
		cd /mnt/localdisk_d/__jadavpur/infocom/snes/
	;;
	"gba")
		cd /mnt/localdisk_d/__jadavpur/infocom/gba/
	;;
	"comp")
		cd /mnt/localdisk_d/__jadavpur/sem8/turing-complete/
	;;
	"nes")
		cd /mnt/localdisk_d/__jadavpur/faltu/emudev/nes/
	;;
	"advent")
		cd /mnt/localdisk_d/__jadavpur/faltu/algo/advent/
	;;
	"general")
		cd /mnt/localdisk_d/__jadavpur/general/
	;;
	"d") # downloads
		cd /home/user1/Downloads/
	;;
	"t") # theory
		cd /mnt/localdisk_d/__jadavpur/theory/
	;;
	"stat") # stat
		cd /mnt/localdisk_d/__jadavpur/theory/stat/
	;;
	"m") # music
		cd /mnt/localdisk_d/music/
	;;
	"j") # local disk
		cd /mnt/localdisk_d/__jadavpur/
	;;
## roguelikes ----------------------------------------------------------------------
	"rogue")
		cd "/mnt/localdisk_d/linux-video-game/source/NetHack"
	;;
	"nethack")
		cd /mnt/localdisk_d/linux-video-game/nethack/
	;;
	"redvault")
	        cd /mnt/localdisk_d/monty_python/dwarf-fortress/kruggsmash_redvault/
	;;

    esac
    tput reset;
}
