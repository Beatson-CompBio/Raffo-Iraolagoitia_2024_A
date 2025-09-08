# Introduction

Here we have three scripts used in the analysis of the TCRD clustering within the $\gamma$ $\delta$ T cells:   

1. 20250611_CZI_to_MIP_tif.ipynb - A python script, written in Jupyter Lab, that takes the raw .czi image recorded from the microscope, with dimensions T, C, Z, Y, X. The TCRD channel (channel 3 in the script) is then
extracted from the .czi file and the np.max() function applied to the z dimension to generate a single-channel MIP-timelapse image. 

2. Create fixed-size ROIs for each timepoint with correct naming.ijm - An ImageJ macro designed to generate ROI's of fixed size that can be used to capture the cell of interest and a representative portion of the 
background in the image. These ROI's are generated for each time point in the MIP-timelapse generated in part 1 and then manually moved into the positions of interest by the user. The ROIs are then saved for analysis in part 3. 

3. 20250730_TCRD_clustering analysis.ipynb - This python script takes as inputs the MIP-timelaspe image in part 1, and the ROI's generated in part 2. Using the ROI's, the cell and the representative background area are extracted 
from the image. An intensity filter is applied to the cell so that only the pixels that have a value greater than 5 times the mean background intensity are used to generate a mask for the regions of interest within the cell.
From this mask, the properties of the TCRD clustering are analysed, and the results of the analysis are exported to a .csv file for further inspection. 
