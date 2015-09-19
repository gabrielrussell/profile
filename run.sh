git submodule update --init --recursive
for i in .??* ; do echo $i ; ln -sf $PWD/$i ~/ ; done
