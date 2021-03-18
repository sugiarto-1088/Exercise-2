#!/bin/bash
echo "Fahri"
echo "19 Maret 2021"
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
