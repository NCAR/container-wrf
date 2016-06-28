#!/bin/bash
echo convert to animated gif
cd /wrfoutput
for file in `ls -1 *png`
do
#   echo $file
   base=`basename $file .png`
   convert -trim $file $base.jpg
done
#
#echo rename 7 files with single digits
#for f in `seq 1 7`
#do
#	echo $f
#        mv $base-$f.jpg $base-00${f}.jpg
#done
convert -delay 30 plt_Surface_multi*.jpg Surface_multi.gif
rm -f plt_Surface_multi*.jpg
convert -delay 30 plt_Precip_multi_total*.jpg Precip_total.gif
rm -f plt_Precip_multi_total*.jpg
rm -f plt_Precip_multi_total*.png
ls -alh *gif
echo Done.
