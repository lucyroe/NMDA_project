# NMDA_project

Trying out SPM with an example dataset containing fMRI data and another dataset containing EEG data. 
Group of Cagla, Kirk, Kainat and Lucy (MCNB Master Programm at FU Berlin).

Scripts available for the following steps:


# fMRI

BATCH SCRIPT that calls all the other subscripts and where the amount of participants, runs and session as well as the datapaths can be specified

PREPROCESSING

1. Realignment

1.1. Coregistration

1.2. Segmentation

2. Normalization (Functional)

2.1. Normalization (Structural) - optional

3. Smoothing

FIRST LEVEL ANALYSIS

4.1. First level GLM - Specification

4.2. First level GLM - Estimation

SECOND LEVEL ANALYSIS

5.1. Second level GLM - Contrasts

5.2. Second level GLM - Inference Results

5.3. Second level GLM - Rendering


# EEG - SPM

BATCH SCRIPT that contains all the preprocessing steps for running them together as part of a pipeline.  

Steps before preprocessing analysis:
1. converting .bdf file to .mat file 
2. channel selection from the data 
3) preparing data for the montage 
4) prepare trial definition for epoching 

PREPROCESSING

1. Convert
2. Montage 
3. Prepare
4. Highpass filter
5. Downsampling 
6. Lowpass filter 
7. Epoching 
8. Artefacts
9. Averaging 


# EEG - FIELDTRIP

............
