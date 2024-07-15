# **Introduction**: 

This is the analysis pipeline that quantification the interaction between gamma-delta-T cells and Macrophage cells that were recorded using the Sartorius S3 incucyte, as reported in the paper ..... 

Included here is the full analysis pipeline: 
  1. Sort the image files from the incucyte into a standardised folder structure.
  2. Convert the individual time-lapse image files into a single time-lapse image containing all the time-points within a single file.
  3. Drift correction is applied to the time-lapse images using the "3D drift correction" macro in fiji.
  4. Perform the interaction analysis between the two different cell types.

The outputs from part 4 of the analysis pipeline are
  - A summary file for the whole experiment is generated as a .csv file.
  - A summary file for each of the Plates used in the experiment.
  - The cell segmentation labels as a .tif
  - cell tracking data used in the analysis.
  - Information for the interactions between the gamma-delta-T cells and the macrophage cells.
  - Analysis of the distance travelled and cell speed for each cell. 

# **How to install**






