#!/bin/bash
echo "Fahri"
echo "23 Maret 2021"
echo "--Exercise 2 Raster Processing with GDAL--"
mkdir -p data output
echo "Step 1 : Downloading data"
wget https://github.com/GeoScripting-WUR/IntroToRaster/raw/gh-pages/data/gewata.zip
unzip gewata.zip
find ./*.tif
cp ./*.tif input.tif
cp input.tif -t data
rm ./*.tif
rm ./*.zip
fn=data/input.tif
echo "The input file : $fn "
outfn=output/ndvi.tif
echo "The output file : $outfn"
echo "Step 2 : Calculate NDVI"
gdal_calc.py -A $fn --A_band=4 -B $fn --B_band=3 --outfile=$outfn --calc="(A.astype(float)-B)/(A.astype(float)+B)" --type='Float32'
echo "Step 3 : Resampling to 60 m"
gdalwarp -tr 60 60 $outfn ndvi.tif
rm $outfn
cp ndvi.tif -t output
rm ./*tif
echo "Step 4 : Reprojection"
gdalwarp -t_srs EPSG:4326 $outfn ndvi.tif
rm $outfn
cp ndvi.tif -t output
rm ./*tif
echo "Finished"
