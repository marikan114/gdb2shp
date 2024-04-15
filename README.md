# gdb2shp

This Python script extracts shapefiles from an ESRI geodatabase file (`.gdb`) based on a specified query word. The extracted shapefiles are saved in a directory named `extracted_shapefiles`.

## Prerequisites

Before running the script, you need to have the following installed:

- Python 3.x
- `fiona` library
- `geopandas` library

## Installation

1. Clone this repository or download the source code.

2. Navigate to the project directory.

3. Create a virtual environment (optional but recommended): 

    ```bash 
    python3 -m venv venv
    ```

4. Activate the virtual environment:

   - On Windows:

     ```
     venv\Scripts\activate
     ```

   - On Unix or macOS:

     ```bash
     source venv/bin/activate
     ```

5. Install the required Python packages: 

    ```bash
    pip install -r requirements.txt
    ```

## Usage

1. Download a geodatabase file (`.gdb`) containing the layers you want to extract shapefiles from.

     Download the [sample data](https://emergency.copernicus.eu/mapping/list-of-components/EMSN177/ALL/ALL) from Copernicus.eu.

2. Place and/or extract the geodatabase file in the project directory.

3. Open the `gdb2shp.py` script and modify the following parameters according to your needs:

   - `gdb_dir`: Path to the geodatabase directory (e.g., `'EMSN048_UTM32N.gdb'`).
   - `query_word`: The word or phrase to search for in the layer names (e.g., `'FLOODRISK01POPRISK'`).
   - `output_dir`: Directory name for storing the extracted shapefiles (default: `'extracted_shapefiles'`).

4. Run the script: `python gdb2shp.py`

The script will extract all the layers from the geodatabase that match the specified `query_word` and save them as shapefiles in the `output_dir` directory.

## Makefile

This project includes a Makefile to simplify the installation and usage process. Here are the available commands:

- `make venv`: Create a virtual environment named `venv`.
- `make install`: Install the required Python packages in the virtual environment.
- `make run`: Run the `gdb2shp.py` script in the virtual environment.
- `make all`: Create the virtual environment, install the requirements, and run the script.
- `make clean`: Clean up the extracted shapefiles, log file, and virtual environment.
- `make help`: Show the help message with the available commands.

## License

This project is licensed under the [MIT License](LICENSE).


