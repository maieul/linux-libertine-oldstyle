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
sed -i ttx 's#<map code="\(0x3[0-9]\)" name="\([a-z]*\)"/>#<map code="\1" name="\2.oldstyle"/>#' $i;# correction
sed -i ttx "s/Linux Libertine O/Linux Libertine OldStyleNumber O/" $i;
sed -i ttx 's#<Ligature components="" glyph="slash"/>##g' $i;#bug temporaire
ttx $i;
mv ${i%%.ttx}.ttf ${i%%.ttx}.otf;
done