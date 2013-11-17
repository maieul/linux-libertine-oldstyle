# nettoyage
rm -f *ttx
rm -f *ttf

#transformation
ttx *otf

#sauvegarde des anciennes versions
mkdir -p bak
mv *otf bak

#correction des ttx et generation des .otf
for i in *.ttx;
  do 
sed -i ttx 's#<map code="\(0x3[0-9]\)" name="\([a-z]*\)"/>#<map code="\1" name="\2.oldstyle"/>#' *ttx;
ttx $i;
mv ${i%%.ttx}.ttf ${i%%.ttx}.otf;
done