# Retraining Cellpose models

The authors of cellpose have provided documentation and scripts that allow the user to re-train the models within their model zoo, to make the segmentation models more relevant to specific tasks [1]. We present two scripts created to make retraining the segmentation models easier. 

## Create_training_images.ipynb
This is a script designed to generate a series of training images for the user from their experimental data. The program used a file directory to ask the user to point the program to where the images (in this case time-lapse images) are saved in memory. Each of the images are opened sequentially, and 5, 100x100 pixel, crops are taken from random frames within the image. The pseudo-random number generator from numpy is used to randomly select which frames in the image will be used to generate the crops. The location of the crops in the image is also chosen randomly in the same way, with some safeguards put in to ensure the 100x100 pixels lie within the maximum number of pixels in the image. 

The ImageJ macro "3D drift correct" pads the images passed to it with zero value pixels to correct for image drift. To generate a segmentation model with the highest level of accuracy, the training data should closely resemble the actual data that it will be applied to. To achieve this, each of the image crops has the outer edge padded with 2-pixels worth of zeros. This does not affect the image beyond to mirror more closely the form of the images returned from drift correction.  

The images generated from this script are then saved into a new folder, with the name "training_images", which is found at the same level as the folder containing the images, which is selected by the user at the beginning of the script. 

A ground-truth for these images was generated manually using QuPath [2], and these were exported as .tif files for the next step in retraining the images. 


## Retrain_cellpose_model.ipynb
Once the ground truth for the training images has been completed, retraining the cellpose models can be performed using the script: Retrain_cellpose_model.ipynb. 

This requires three inputs from the user at the beginning, these are: 
  1. The name of the cell type/objects to be segmented
  2. the split between the training and the validation data.
  3. the cellpose model that is to be retrained. 
