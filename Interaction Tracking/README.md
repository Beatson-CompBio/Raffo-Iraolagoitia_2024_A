# **Introduction**: 

This analysis pipeline that quantifies the interaction time between gamma-delta-T cells and Macrophage cells. Images were recorded using the Sartorius S3 incucyte, as reported in the paper:  *V-gamma-1  gamma-delta T cells steer airway macrophages towards a pro-fibrotic response in lung adenocarcinoma, X. Raffo-Iraolagoitia, 2024.* 

## **Summary of the analysis steps:** 
  1. Sort the image files from the incucyte into a standardised folder structure.
  2. Convert the individual time-lapse image files into a single time-lapse image containing all the time-points within a single file.
  3. Drift correct the time-lapse images using the "3D drift correction" macro in Fiji.
  4. Perform the interaction analysis between the two different cell types.

## **Summary of outputs from the pipeline**
  - A summary file for the whole experiment (.csv).
  - A summary file for each of the Plates used in the experiment.
  - The cell segmentation labels (.tif).
  - cell tracking data used in the analysis.
  - Information for the interactions between the gamma-delta-T cells and the macrophage cells.
  - Analysis of the distance travelled and cell speed for each cell.





