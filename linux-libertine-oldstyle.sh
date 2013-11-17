# nettoyage
rm -f *ttx
rm -f *ttf

#transformation
ttx *otf

#sauvegarde des anciennes versions
mkdir -p bak
mv *otf bak

#creation a partir des *ttx
for i in *.ttx;
  do 
ttx $i;
mv ${i%%.ttx}.ttf ${i%%.ttx}.otf;
done