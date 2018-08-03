VARPREFIX=$PREFIX/share sh Configure
make all
make install

mkdir -p $PREFIX/share/cache/sympow/datafiles/
touch $PREFIX/share/cache/sympow/datafiles/.keep
