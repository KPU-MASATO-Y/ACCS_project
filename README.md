# ACCS_project (In preparation)
This repository was created for the purpose of publishing ACCS source code and learning data.
The ACCS means "automatic cell counting system with the machine learning". The ACCS is the automatic counting system for measuring cells using Fiji (https://imagej.net/Fiji) and Trainable Weka Segmentation (TWS; https://imagej.net/Trainable_Weka_Segmentation).

## Note
This program is opened in the hope that it will be useful, but without any warranty. This system occupies the computer CPU and memory.

## Operating environment
* Operating system : Windows 10 Home (64bit)  
* Processor        : Intel (R) Core (TM) i7-8700 CPU  
* Memory (RAM)     : 16GB DDR4  
* GPU              : NVIDIA GeForce GTX 1050Ti  


## Install
1.  Install Fiji on the computer. Fiji can be downloaded from https://fiji.sc. See https://imagej.net/Fiji/Downloads for how to install Fiji. TWS is included in the Fiji plugin.
2.  Download the ACCS folder from Github (https://github.com/KPU-MASATO-Y/ACCS_project.git). Put the ACCS folder on the desktop of the computer.

## Description of the ACCS folder
The hierarchical structure of the ACCS folder is designed as follows.
* Desktop
  * ACCS
    * macro script
    * model images for machine learning
    * output
    * preparation
    * segmentation
    * test
    * unsharp mask
 
Illustrate the hierarchical structure of the ACCS folder.  
![Folder Structure](./ReadMe_images/Folder_structure.tiff)

## Description of the macro script folder
The ACCS.ijm is stored in the macro script folder. The ACCS.ijm is the system code and written by ImageJ Macro Language (IJM).

## Description of the machine learning folder
15 image data used create learning data are stored in the model images for machine learning folder. 

## Description of the output folder
Images after measurement are output to the output folder.

## Description of the preparation folder
In the preparation folder, a model of learning data (classifier.model), trace information (trace information.arff) and an image for starting TWS are stored.

## Description of the segmentation folder
Segmented images by TWS are output to the segmentation folder.

## Description of the test folder
Save the images you want to measure in the test folder. In the initial state, sample data are saved in advane.

## Description of the unsharp mask folder
Unsharp masked images are output to the unsharp mask folder.

***
# **Usage and Tutorial**
1. Save the images to be measured in the test folder of the ACCS folder.
2. Start Fiji.
3.
