%% PREPROCESSING 
% STEP 1: Realignment
% Function name:    realign_job
% Description:      realign fMRI img files
% Arguments:        functional_img (functional fMRI images)
% Outputs:          realigned functional images with the prefix 'r'
%                   mean image with the prefix 'mean'
%                   translations and rotations as text file with the prefix 'rp'

function [r_img] = realign_job(functional_img)
    
    clear matlabbatch % clear matlabbatch
    
    matlabbatch{1}.spm.spatial.realign.estwrite.data = {cellstr(functional_img)}; % select img data

    % set parameters
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

    r_img = matlabbatch;
    % perform realignment
    spm_jobman('run', r_img);

    clear matlabbatch % clear matlabbatch

end