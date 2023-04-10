#!/bin/bash
# This creates the interior files for the lulu print option
scriptdir="/home/yochai/github/cairn/scripts"
sourcedir="/home/yochai/github/cairn/resources/monsters"
tmpdir="/home/yochai/Downloads/tmp"
destdir="/home/yochai/Google Drive/Games/Personal WIP/Cairn/bestiary/"
currentdate="$(date +%m-%Y)"
mkdir -p $tmpdir/monsters
rsync -av $sourcedir/ $tmpdir/monsters/
sed -i -f sources/prep.sed $tmpdir/monsters/*.md
cat $tmpdir/monsters/*.md >> $tmpdir/cairn-bestiary-tmp.md
cp sources/lulu.tex $tmpdir/cairn-bestiary.tex
pandoc $tmpdir/cairn-bestiary-tmp.md -f markdown -t latex -o $tmpdir/cairn-bestiary-tmp.tex
cat $tmpdir/cairn-bestiary-tmp.tex >> $tmpdir/cairn-bestiary.tex
sed -i '$a \\\end{document}' $tmpdir/cairn-bestiary.tex
pdflatex -output-directory=$tmpdir $tmpdir/cairn-bestiary.tex 
pdflatex -output-directory=$tmpdir $tmpdir/cairn-bestiary.tex 
mv $tmpdir/cairn-bestiary.pdf "$destdir/cairn-bestiary-lulu-interior-$currentdate.pdf"
rm -rf $tmpdir