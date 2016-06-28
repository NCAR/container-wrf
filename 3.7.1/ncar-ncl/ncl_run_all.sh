#!/bin/bash
export NCARG_ROOT=/usr/local
#
#
cd /wrfoutput
for nclscript in `ls -1 /nclscripts/*ncl`
do
	ncl $nclscript
done
#
echo convert to animated gif
for file in `ls -1 *png`
do
   base=`basename $file .png`
   convert -trim $file $base.jpg
done
convert -delay 30 plt_Surface_multi*.jpg Surface_multi.gif
rm -f plt_Surface_multi*.jpg
convert -delay 30 plt_Precip_multi_total*.jpg Precip_total.gif
rm -f plt_Precip_multi_total*.jpg
rm -f plt_Precip_multi_total*.png
ls -alh *gif
echo Done.
