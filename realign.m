%% PREPROCESSING 
% STEP 1: Realignment
% script takes as input auditory fMRI img files and realigns them

%% setup & data formatting
datapath = fullfile('/Users/Lucy/Documents/Berlin/FU/MCNB/2Semester/NMDA II/fMRI example dataset/MoAEpilot/fM00223/'); % change to where data is for you
img_path = fullfile(datapath,'*.img'); % get all the img files from a directory
all_img_files = dir(img_path); % list all img files
img_data = {}; % initialize empty array to fill with files in the right format
for i = 1:length(all_img_files) % loop over all img files
    baseFileName = all_img_files(i).name; % get file name
    fullFileName = strcat(datapath, baseFileName, ',1'); % add right format
    img_data = [img_data fullFileName]; % add file to struct
end
final_data = {transpose(img_data)}; % change struct to right format

%% realignment
matlabbatch{1}.spm.spatial.realign.estwrite.data = final_data';
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.quality = 0.9;
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.sep = 4;
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.fwhm = 5;
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.rtm = 1;
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.interp = 2;
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.realign.estwrite.eoptions.weight = '';
matlabbatch{1}.spm.spatial.realign.estwrite.roptions.which = [0 1];
matlabbatch{1}.spm.spatial.realign.estwrite.roptions.interp = 4;
matlabbatch{1}.spm.spatial.realign.estwrite.roptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.realign.estwrite.roptions.mask = 1;
matlabbatch{1}.spm.spatial.realign.estwrite.roptions.prefix = 'r';

spm('defaults', 'FMRI'); % setup spm
spm_jobman('run', matlabbatch); % run
