all : install
install :
	sudo cp math.sh /usr/bin/math
	sudo chmod 755 /usr/bin/math
uninstall :
	sudo rm -f /usr/bin/math
