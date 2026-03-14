if [[ "$target_platform" == osx-arm64 ]]; then
  export SYMPOW_EXTRA_CFLAGS="-std=gnu17 -fno-fast-math -ffp-contract=on -O3"
  export SYMPOW_FPUBITS_IS_53=1
  export SYMPOW_ENDIANTUPLE=le64
fi

export ADDBINPATH=no

if [[ "$CONDA_BUILD_CROSS_COMPILATION" == 1 ]]; then
  export SYMPOW_EXTRA_MAKE="HELP2MAN=echo"
  touch sympow.1
fi

VARPREFIX=$PREFIX/share sh Configure
make all $SYMPOW_EXTRA_MAKE
make install $SYMPOW_EXTRA_MAKE

mkdir -p $PREFIX/share/cache/sympow/datafiles/
touch $PREFIX/share/cache/sympow/datafiles/.keep
