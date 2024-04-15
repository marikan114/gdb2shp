#!/usr/bin/env python3
##
## Mahmut Arikan :: 2005 - 2024
## email        ::  marikan114@gmail.com
##
import fiona
import geopandas as gpd
import os
import logging

##################
### PARAMETERS ###
##################

# Path to a sample geodatabase directory
gdb_dir = 'EMSN048_UTM32N.gdb'
# Downloaded from https://emergency.copernicus.eu/mapping/list-of-components/EMSN177/ALL/ALL

# Layer selection criteria
query_word = 'FLOODRISK01POPRISK'

# Directory name for storing extracted shapefiles
output_dir = 'extracted_shapefiles'

# GIS converter parameters
output_format='ESRI Shapefile'
file_ext='.shp'

# Configure logging
file_log='extraction.log'
logging.basicConfig(filename=file_log, level=logging.INFO,
                    format='%(asctime)s - %(levelname)s - %(message)s')

#################
### EXECUTION ###
#################

# Get all the layers from the .gdb file
layers = fiona.listlayers(gdb_dir)

# Create a list to store matching layer names
matching_layers = [layer for layer in layers if query_word in layer]

# Create a directory to store the extracted shapefiles
os.makedirs(output_dir, exist_ok=True)

# Iterate through the matching layers
for layer in matching_layers:
    logging.info(f'Extracting {layer}...')

    gdf = gpd.read_file(gdb_dir, layer=layer)

    # Create a spatial index for the GeoDataFrame
    gdf.sindex

    # Export the GeoDataFrame as a shapefile
    gdf.to_file(f'{output_dir}/{layer}{file_ext}', driver=output_format)

    logging.info(f'Extraction of {layer} completed.')

logging.info('Extraction process completed.')

#EOF
