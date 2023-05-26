%% PREPROCESSING 
% STEP 3: Smoothing
% Function name:    smooth_job
% Description:      smoothes wrf images
% Arguments:        wrf_images (realigned normalised functional images)
% Outputs:          smoothed images with the prefix 's'

function [sm_img] = smooth_job(wrf_images)

    clear matlabbatch   % clear matlabbatch

    matlabbatch{1}.spm.spatial.smooth.data = cellstr(wrf_images);   % select wrf images

    % set parameters
    matlabbatch{1}.spm.spatial.smooth.fwhm = [6 6 6];
    matlabbatch{1}.spm.spatial.smooth.dtype = 0;
    matlabbatch{1}.spm.spatial.smooth.im = 0;
    matlabbatch{1}.spm.spatial.smooth.prefix = 's';
    
    sm_img = matlabbatch;

    % perform smoothing
    spm_jobman('run', sm_img);

    clear matlabbatch % clear matlabbatch

end
