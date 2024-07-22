# Description of the analysis pipeline

We provide the full analysis pipeline used to analyse the interactions between GDT and macrophage cells in time-lapse images recorded using a Sartorius S3 incucyte. In the following section, we provide a description of analysis scripts and their relation to the pipeline.  

# 1.Sort_incucyte_images.ipynb 
The raw images from the incucyte are exported as 1 image per time point, per well, per plate. This can result in many image files being exported into a single folder. In addition to being unhelpful from the point of view of making data "Findable" in the FAIR pipeline [1], this image storage format makes life difficult when creating scripts for bioimage analysis. This script is designed to take as an input from the user, the folder containing all the images exported from the incucyte. The script then uses the standard form of the file naming convention to generate a folder structure for the images and sort the images into the folders that match their file name. The general form of the folder structure is: 
- Experiment name
  - Plate Name
      - Well Number
          - Image region
              - Colour Channel
                  - Images for all time points

By changing the folder structure for the image files, creating the following analysis scripts was made significantly easier, as was automating the analysis pipeline. 


# 2. Create_stack_images.ipynb 
To make image analysis easier in the long term, this script collates the individual images recorded at every time point in the experiment into one complete time-lapse image as a .tif file. The input for this script is the "Plate Name" folder in the folder structure created by the script 1.Sort_incucyte_images.ipynb. The script then creates a time-lapse image for each of the three imaging channels from the experiment for each of the image-regions from each of the wells in the plate. These are then saved into a folder called "stack_images, " created in the same folder level as the "Well Number" folders. Each time-lapse image is then saved into a folder with the name of the well-name from which the images originated.  
The only user input required for this script is to select the "Plate Name" folder from the file directory. 

# 3.Drift_correction_macro.ijm
This is a script that is used to correct the drift that arises during the process of imaging the plate across the time-lapse experiment. To correct for the image drift, we make use of the macro in Fiji called "Correct 3d Drift" [2]. The script asks the user to select the folder containing the time-lapse files created when running the script 2. Create_stack_images.ipynb, the script expects the folder "stack_images" to be selected. The script is automated to convert the three image channels to an 8-bit image, and then merge all the channels into a single image. The drift correction is then applied to the merged image, with the third image channel (phase channel) used for the drift correction. The following parameters for the drift correction macro are used in this script: 
  - channel=3
  - sub_pixel only=0
  - lowest=1
  - highest=1
  - max_shift_x=25
  - max_shift_y=25
  - max_shift_z=10

Once the drift correction has finished, the channels in the drift-corrected merged image are split, and each of the drift-corrected channels are saved as individual .tif files. The drift-corrected files are saved into a parent folder called "Drift_Correction", within sub-folders with the name of the wells that the image file originated from. 

# 4.Automated_Incucyte_Cell_tracking_and_contact.ipynb
All the steps before the present script are to format the folder structure and the time-lapse images for the main image-analysis pipeline, which is contained with the script: 4.Automated_Incucyte_Cell_tracking_and_contact.ipynb. 

The steps for the analysis are: 
1. User inputs: the time between frames and image resolution from the experiment
2. User selects: the parent folder for all images (Experiment Name),
3. Locate the "Drift_Correction folder for each of the well plates and image regions for each of the plates. 
4. Locate the segmentation models.
5. For each of the Drift_Correction sub-folders:  
    i. Load in the three image channels for the image region.  
   ii. Threshold the fluorescence image channel (Green and Red channels).  
  iii. Use cellpose to segment the fluorescence imaging channels using the thresholded images [3].  
   iv. Segment the phase channel using cellpose.  
    v. Sort the phase masks into different cell groups:  
       &nbsp;    - GDT cells   
       &nbsp;    - Macrophage cells  
       &nbsp;    - Dead cells  
   vi. Filter the GDT masks to remove false positives by size.  
  vii. Count the number of each of the cell types.  
 viii. Track the cells using the BTrack package [4].  
   ix. Filter tracks to only include those cells tracked for over 90% of the time-lapse duration.  
    x. Detect the interaction between the GDT cells and the Macrophage cells, by looking at the overlap between the Macrophage masks, and the GDT cell masks.  
   xi. Quantify the interactions between the two different cell types.  
  xii. Generate a summary file for the image region being analysed.  
 xiii. Save: The data analysis, the cellpose segmentation for each channel, and the tracking.   

# Bibliography
1. Wilkinson, M., Dumontier, M., Aalbersberg, I. et al. The FAIR Guiding Principles for scientific data management and stewardship. Sci Data 3, 160018 (2016). https://doi.org/10.1038/sdata.2016.18
2. Parslow A, Cardona A, Bryson-Richardson RJ. Sample drift correction following 4D confocal time-lapse imaging. J Vis Exp. 2014 Apr 12;(86):51086. doi: 10.3791/51086. PMID: 24747942; PMCID: PMC4166950.
3. Pachitariu, M., Stringer, C. Cellpose 2.0: how to train your own model. Nat Methods 19, 1634–1641 (2022). https://doi.org/10.1038/s41592-022-01663-4
4. Ulicna K, Vallardi G, Charras G and Lowe AR, Automated deep lineage tree analysis using a Bayesian single cell tracking approach, Front in Comp Sci (2021), https://doi.org/10.3389/fcomp.2021.734559






















