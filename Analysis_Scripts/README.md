# Description of the analysis pipeline

We provide the full analysis pipeline used to analyse the interactions between GDT and macrophage cells in time-lapse images recorded using a Sartorius S3 incucyte. In the following section, we provide a description of analysis scripts and their relation to the pipeline.  

# 1.Sort_incucyte_images.ipynb 
The raw images from the incucyte are exported as 1 image per time point, per well, per plate. This can result in many image files being exported into a single folder. In addition to being unhelpful from the point of view of making data "Findable" in the FAIR pipeline, this format of image storage makes life difficult when creating scripts for bioimage analysis. This script is designed to take as an input from the user, the folder containing all the images exported from the incucyte. The script then uses the standard form of the file naming convention to generate a folder structure for the images and sort the images into the folders that match their file name. The general form of the folder structure is: 
  - Plate Name
      - Well Number
          - Image region
              - Colour Channel
                  - Images for all time points

By changing the folder structure for the image files, creating the following analysis scripts was made significantly easier, as was automating the analysis pipeline. 


# 2. Create_stack_images.ipynb 
This script requires the user to select the "plate name" folder level from the output of the previous script. 
