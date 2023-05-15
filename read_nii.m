%% just a basic script on how to open .nii files

% first, you need to install the NIFTI Toolbox to be able to use the
% following functions
% install it by clicking on "Add-Ons" - "Get Add-Ons" in your Matlab or
% by following this link: https://de.mathworks.com/matlabcentral/fileexchange/8797-tools-for-nifti-and-analyze-image
% you can check whether the toolbox is installed by trying out the
% following functions

% Load the NIfTI file
nii = load_nii('/Users/Lucy/Downloads/ds000003_R2.0.2/sub-01/func/sub-01_task-rhymejudgment_bold.nii'); % change to where you downloaded the NIFTI file (make sure to unzip it if its still zipped)

% Access the image data
img = nii.img;

% Access the header information
hdr = nii.hdr; % probably has three fields: hk, dime, hist
% try out to access these, e.g., hdr.dime should give you the dimensions
% etc.