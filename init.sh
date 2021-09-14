if [ "$1" == "-c" ];
then
	FLAG=1
else
	FLAG=0
fi

if test -f "~/.bashrc" && [ "$FLAG" ]; then
	echo ".bashrc already exists, cleaning."
else if test -f "~/.bashrc"; then
	echo ".bashrc already exists, please remove."
fi
