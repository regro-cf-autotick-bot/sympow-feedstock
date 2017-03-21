sed -i -e "s|../sympow|sympow_bin|g" generate.c
sed -i -e "s|./sympow|sympow_bin|g" disk.c new_data
# Change the relative path of new_data to absolute path
sed -i -e "s|char PATH\[128\]=\"new_data\"|char PATH\[512\]=\"$PREFIX/bin/sympow_new_data\"|g" generate.c

./Configure
make

mkdir -p "$PREFIX"/{bin,share/sympow}
cp -r *.gp datafiles "$PREFIX"/share/sympow
cp sympow "$PREFIX"/bin/sympow_bin
cp new_data "$PREFIX"/bin/sympow_new_data
install -m755 "$RECIPE_DIR"/sympow.sh "$PREFIX"/bin/sympow

pushd "$PREFIX"/share/sympow/datafiles

for file in *.txt; do
  "$SRC_DIR"/sympow -txt2bin "$(grep -c AT $file)" <$file ${file/txt/bin}
done

popd
