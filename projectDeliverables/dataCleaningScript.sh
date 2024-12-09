#!/bin/bash

# Input file containing the star data
INPUT_FILE="dataGaia2.csv"

# Output file to store the filtered results
OUTPUT_FILE="filteredGaia.csv"

# Write header to the output file
echo "Source,Teff,Lum-Flame,SpType,Pstar,PWD" > "$OUTPUT_FILE"

# Process the input file
awk -F, '
    BEGIN { OFS = "," }
    NR > 1 {
        # Check the conditions for Pstar or PWD
        if ($29 == 1 || $30 > 0.99) {
            # Print the selected fields
            print $4, $32, $41, $46, $29, $30
        }
    }
' "$INPUT_FILE" >> "$OUTPUT_FILE"
