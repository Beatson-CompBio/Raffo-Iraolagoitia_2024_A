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

# **Requirements** 

To run this code, you will need: 
  1. Access to Python, we recommend downloading Anaconda: https://www.anaconda.com/download/success
  2. A version of Fiji: https://imagej.net/software/fiji/downloads

# **Installation**

  0. Clone the repository. 

  1. Launch the Anaconda Prompt (if using).

  2. Locate the .yaml file in the cloned repository and copy the file path.
     - There are two .yaml files in the repository, one for working with a nvidia GPU (cell_interactions_gpu_nvidia.yaml), and one for working without a GPU (cell_interactions.yaml).
     - During our testing, access to a GPU can decrease cell segmentation time by 10 (eg: 60 minutes becomes 6 minutes). It is recommended to run this analysis sequence on a system that has access to a GPU.

  3. Use the following command in the Anaconda Prompt to build the Python environment:  
     <code>conda env create -f path_to_the_yaml_file</code>
     - NOTE: replace path_to_the_yaml_file with the .yaml file path, eg:   
C:/Users/JBloggs/Documents/Github/Raffo-Iraolagoitia_2024_A/cell_interactions/gpu/nvidia.yaml

  4. Activate the Python environment by typing:  
     <code>conda activate cell_interactions_gpu</code>

  5. The Python scripts used for the analysis were created using jupyter-lab []. Type: <code>jupyter lab</code> into the Anaconda prompt to launch jupyter script editor, which will open in a browser.

  6. The following link is to a video which shows steps 1-6 visually:   
      https://github.com/user-attachments/assets/18e07f38-7708-45ea-b96e-67bf583f63d8

  7. Use the file navigation bar on the left-hand side of the jupyter window to access the folder directory for the cloned repository.

# References 

[1]  Kluyver, Thomas & Ragan-Kelley, Benjamin & Perez, Fernando & Granger, Brian & Bussonnier, Matthias & Frederic, Jonathan & Kelley, Kyle & Hamrick, Jessica & Grout, Jason & Corlay, Sylvain & Ivanov, Paul & Avila, Damián & Abdalla, Safia & Willing, Carol & [Unknown, Jupyter. (2016). Jupyter Notebooks – a publishing format for reproducible computational workflows.





