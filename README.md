# Introduction

This repository holds the scripts used to some of the image analysis in the paper: 
Vg1 gd T cells steer airway macrophages towards a pro-fibrotic response in an autochthonous lung cancer mouse model - X.Raffo 2025. 

Included here is the code for analysing:   
1. The interactions between the $\gamma$ $\delta$ T cells and the alveolar macrophages from expeiments conducted using the Sartorius S3 Incucte microscope. This is contained within the "Interaction Tracking" folder in this repository.
2. TCRD Clustering, which is contained in the folder "TCRD Analysis".

Included in each folder is a brief description of the workflow and a summary of the expected outputs from the code.  
All code created using a Jupyter notebook is fully commented with a description of what each block of code does.

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
     - If you wish to use the GPU, we recommend following the steps outlined on the cellpose Github page, as the GPU on your computers may not be the same make or model as the ones used in the development and executuion of this code: https://github.com/MouseLand/cellpose

  3. Use the following command in the Anaconda Prompt to build the Python environment:  
     <code>conda env create -f path_to_the_yaml_file</code>
     - NOTE: replace path_to_the_yaml_file with the .yaml file path, eg:   
C:/Users/JBloggs/Documents/Github/Interaction_Tracking/gpu/nvidia.yaml

  4. Activate the Python environment by typing:  
     <code>conda activate cell_interactions_gpu</code>

  5. The Python scripts used for the analysis were created using jupyter-lab [1]. Type: <code>jupyter lab</code> into the Anaconda prompt to launch jupyter script editor, which will open in a browser.

  6. The following link is to a video which shows steps 1-6 visually:   
      https://github.com/user-attachments/assets/18e07f38-7708-45ea-b96e-67bf583f63d8

  7. Use the file navigation bar on the left-hand side of the jupyter window to access the folder directory for the cloned repository.


# References 

[1]  Kluyver, Thomas & Ragan-Kelley, Benjamin & Perez, Fernando & Granger, Brian & Bussonnier, Matthias & Frederic, Jonathan & Kelley, Kyle & Hamrick, Jessica & Grout, Jason & Corlay, Sylvain & Ivanov, Paul & Avila, Damián & Abdalla, Safia & Willing, Carol & [Unknown, Jupyter. (2016). Jupyter Notebooks – a publishing format for reproducible computational workflows.


