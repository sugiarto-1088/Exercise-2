#!/bin/bash
echo "Fahri"
echo "20 Maret 2021"
echo "Raster Processing with GDAL"
mkdir -p data output
echo "Downloading data"
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
echo "Calculate NDVI"
gdal_calc.py -A $fn --A_band=4 -B $fn --B_band=3 --outfile=$outfn --calc="(A.astype(float)-B)/(A.astype(float)+B)" --type='Float32'
