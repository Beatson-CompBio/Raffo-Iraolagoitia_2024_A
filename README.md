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

# **Requirements** 

To run this code, you will need: 
  1. Access to python, we recommend downloading anaconda: https://www.anaconda.com/download/success
  2. A version of fiji: https://imagej.net/software/fiji/downloads

# **How to create the python environment**

  0. Clone the repository, make sure anaconda and fiji are downloaded. 

  1. Open up the anaconda prompt which is included in the download of anaconda.

  2. Locate the .yaml file in the cloned repository and copy the file location.
     - There are two .yaml files in the repository, one for working with a nvidia GPU (cell_interactions_gpu_nvidia.yaml), and one for working without a GPU (cell_interactions.yaml).
     - During our testing, access to a GPU can decrease the time spend on cell segmentation by 10 times (eg: 60 minutes becomes 6 minutes). It is recommended to run this analysis sequence on a system that has access to a GPU.

  3. Use the following command in the anaconda prompt to build the python environment: conda env create -f path_to_the_yaml_file
     - NOTE: replace path_to_the_yaml_file with the .yaml file path, eg: C:/Users/JBloggs/Documents/Github/Raffo-Iraolagoitia_2024_A/cell_interactions/gpu/nvidia.yaml

  4. The previous command will automatically build the python environment required to run the analysis sequence.

  5. The python environment can then be activated using the following command: conda activate cell_interactions_gpu

  6. The python scripts used for the analysis were created using jupyter-lab []. The jupyter script editor can be opened using the anaconda prompt by typing the command: jupyter lab.
      - Jupyter is a script editor that runs through your web browser.
      - Note: internet connection is not required for jupyter lab to work in your browser. 

  7. The following link is to a video which shows steps 1-6 visually: 
      https://github.com/user-attachments/assets/18e07f38-7708-45ea-b96e-67bf583f63d8

  8. Use the file naviation bar on the left hand side of the jupyter window to access the folder directory for the cloned repository.




