# Retraining Cellpose models

The authors of cellpose have provided documentation and scripts that allow the user to re-train the models within their model zoo, to make the segmentation models more relevant to specific tasks [1]. We present two scripts created to make retraining the segmentation models easier. 

## Create_training_images.ipynb
This is a script designed to generate a series of training images for the user from their experimental data. The program used a file directory to ask the user to point the program to where the images (in this case time-lapse images) are saved in memory. Each of the images are opened sequentially, and 5, 100x100 pixel, crops are taken from random frames within the image. The pseudo-random number generator from numpy is used to randomly select which frames in the image will be used to generate the crops. The location of the crops in the image is also chosen randomly in the same way, with some safeguards put in to ensure the 100x100 pixels lie within the maximum number of pixels in the image. 

The ImageJ macro "3D drift correct" pads the images passed to it with zero value pixels to correct for image drift [2]. To generate a segmentation model with the highest level of accuracy, the training data should closely resemble the actual data that it will be applied to. To achieve this, each of the image crops has the outer edge padded with 2-pixels worth of zeros. This does not affect the image beyond to mirror more closely the form of the images returned from drift correction.  

The images generated from this script are then saved into a new folder, with the name "training_images", which is found at the same level as the folder containing the images, which is selected by the user at the beginning of the script. 

A ground-truth for these images was generated manually using QuPath [3], and these were exported as .tif files for the next step in retraining the images. 


## Retrain_cellpose_model.ipynb
Once the ground truth for the training images has been completed, retraining the cellpose models can be performed using the script: Retrain_cellpose_model.ipynb. 

This requires three inputs from the user at the beginning, these are: 
  1. The name of the cell type/objects to be segmented
  2. the split between the training and the validation data.
  3. the cellpose model that is to be retrained - a list of which can be found: https://cellpose.readthedocs.io/en/latest/models.html 

Once these values have been inputted into the system, the user can run the remaining cells in the script to retain the cellpose mode. The user will be asked to point the program to the location of the Training images and their corresponding ground_truths, this is done by navigating through a dialogue box, similar to the file explorer in windows. From here, the program randomly allocates images to either the "training" or "validation" datasets. The Training dataset is used to retrain the selected cellpose model, whereas the validation dataset is used to assess the performance of the retrained-cellpose model. It is recommended that there are significantly more images in the training dataset, as a large and varied training dataset will result in a more accurate segmentation in the end. For this work, the ratio of training data to validation data was 80:20. 

There is a cell in the script with the title: "Train a model on the training datasets". 
The cell here contains all of the parameters that are used to retrain the cellpose model. Here the user can change: 
  - The channel of the image to use for segmentation.
  - The number of epochs used for training
  - The learning rate of the model.
  - The weight decay of the mode.
  - the number of images used per epoch
  - The split of the training data between the data used for training the model, and the data used to test the performance of the model during training.

When this cell is run, the retraining of the cellpose model will begin. So these parameters should be altered before execution if required. The parameters in the script are the default values of the cellpose retraining model. The retrained segmentation model, and the metadata for the model will be saved in a folder called: "models" which can be found in the same file level as the training image folder. 

The cell titled: "Test the model on Validation Data", runs a perfomance analysis of the newly retrained model on the validation data, with the performance of the model evaluated by the average precision of the models performance across the validation dataset. The results of this analysis is saved into a .csv file, along with the metadata and training parameters of the model. 

# Bibliography
1. Pachitariu, M., Stringer, C. Cellpose 2.0: how to train your own model. Nat Methods 19, 1634–1641 (2022). https://doi.org/10.1038/s41592-022-01663-4
2. Parslow A, Cardona A and Bryson-Richardson RJ (2014) Sample drift correction following 4D confocal time-lapse imaging. J Vis Exp. 2014 Apr 12;(86). doi: 10.3791/51086.
3. Bankhead P, Loughrey MB, Fernández JA, Dombrowski Y, McArt DG, Dunne PD, McQuaid S, Gray RT, Murray LJ, Coleman HG, James JA, Salto-Tellez M, Hamilton PW. QuPath: Open source software for digital pathology image analysis. Sci Rep. 2017 Dec 4;7(1):16878. doi: 10.1038/s41598-017-17204-5. PMID: 29203879; PMCID: PMC5715110.
