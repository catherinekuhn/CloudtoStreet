require(ncdf4)
require(raster)
require(rgdal)
## Input: a netCDF file
file.nc <- 'Irene_flood.nc'

## Output: a GeoTIFF file
file.tiff <- 'Irene.tiff'

## Import netCDF
r.rain <- raster(file.nc)

## Save to disk as GeoTIFF
writeRaster(r.rain, filename = file.tiff, format = 'GTiff', overwrite = T)

## For multiple files, could use a for loop
## Input directory
dir.nc <- '/input/'
files.nc <- list.files(dir.nc, full.names = T, recursive = T)

## Output directory
dir.output <- '/output/'

## For simplicity, I use "i" as the file name, you could change any name you want, "substr" is a good function to do this.
for (i in 1:length(files.nc)) {
  r.nc <- raster(files.nc[i])
  writeRaster(r.nc, paste(dir.output, i, '.tiff', sep = ''), format = 'GTiff', overwrite = T)
}
