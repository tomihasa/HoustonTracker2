#!/bin/sh

#pasmo -d --alocal main.asm main.bin
#if [ "$?" = "0" ]
#then
	cp _bin/oysterpac oysterpac
	
	if [ "$1" = "-82" ]
	then
		pasmo -d --equ MODEL=1 --alocal main.asm main.bin main.sym #> dump.lst
		if [ "$?" = "0" ]
		then
			./oysterpac main.bin ht2.82p ht2
			rm main.bin
			tilem2 -a -r "/path/to/your/rom/romfile.bin" -m ti82 ht2.82p -p "macro/ti82cr.txt"
		fi
	fi
	if [ "$1" = "-8p" ]
	then
		pasmo -d --equ MODEL=4 --alocal main.asm main.bin main.sym #> dump.lst
		if [ "$?" = "0" ]
		then
			./oysterpac main.bin ht2p.82p ht2
			rm main.bin
			tilem2 -a -r "/path/to/your/rom/romfile.bin" -m ti82 ht2p.82p
		fi
	fi
	if [ "$1" = "-83" ]
	then
		pasmo --equ MODEL=2 --alocal main.asm main.bin main.sym
		if [ "$?" = "0" ]
		then
			./oysterpac main.bin ht2.83p ht2
			rm main.bin
			tilem2 -a -r "/path/to/your/rom/romfile.bin" -m ti83 ht2.83p
		fi
	fi
	if [ "$1" = "-8x" ]
	then
		pasmo -d --equ MODEL=3 --alocal main.asm main.bin main.sym
		if [ "$?" = "0" ]
		then
			./oysterpac main.bin ht2.8xp ht2
			rm main.bin
			tilem2 -a -r "/path/to/your/rom/romfile.bin" -m ti83p ht2.8xp
		fi
	fi
	if [ "$1" = "-8xs" ]
	then
		pasmo -d --equ MODEL=5 --alocal main.asm main.bin main.sym
		if [ "$?" = "0" ]
		then
			./oysterpac main.bin ht2.8xp ht2
			rm main.bin
			tilem2 -a -r "/path/to/your/rom/romfile.bin" -m ti83p ht2s.8xp
		fi
	fi
	if [ "$1" = "-all" ]
	then
		pasmo --equ MODEL=1 --alocal main.asm main.bin main.sym #> dump.lst
		if [ "$?" = "0" ]
		then
			./oysterpac main.bin ht2.82p ht2
			echo "ti82 ok";
		fi
		
		pasmo --equ MODEL=2 --alocal main.asm main.bin main.sym
		if [ "$?" = "0" ]
		then
			./oysterpac main.bin ht2.83p ht2
			echo "ti83 ok";
		fi
		
		pasmo --equ MODEL=3 --alocal main.asm main.bin main.sym
		if [ "$?" = "0" ]
		then
			./oysterpac main.bin ht2.8xp ht2
			echo "ti8x ok";
		fi
		
		pasmo --equ MODEL=4 --alocal main.asm main.bin main.sym #> dump.lst
		if [ "$?" = "0" ]
		then
			./oysterpac main.bin ht2p.82p ht2
			echo "ti82 parcus ok";
		fi
		
		pasmo --equ MODEL=5 --alocal main.asm main.bin main.sym
		if [ "$?" = "0" ]
		then
			./oysterpac main.bin ht2s.8xp ht2s
			echo "ti8x small ok";
		fi
		rm main.bin
	fi
	
	rm oysterpac
# 	if [ "$1" = "-73" ]
# 	then
# 		cp _bin/as73.bat as73.bat
# 		cp _bin/asm73.exe asm73.exe
# 		./bin8x -i mark2.bin -o mark2.83p -nMARK2 -3 -v
# 		rm mark2.bin
# 		rm bin8x
# 		dosbox -c "cd texasi~1\PROG\mark-2" -exit "as73.bat"
# 		rm as73.bat
# 		rm asm73.exe
# 		mv MARK2.73P mark2.73p
# 		tilem2 -a -r "/home/heinz/classic/texasinstruments/roms/TI-73 Explorer OS 1.91.rom" -m ti73 mark2.73p
# 	fi

#fi
