%% PREPROCESSING 
% STEP 2.1: (OPTIONAL) Normalization (structural)
% Function name:    normalise_structural_job
% Description:      applies normalisation parameters to anatomical images
% Arguments:        deformation_file (deformation info from segmentation)
%                   bias_file (bias-corrected structural from segmentation)
% Outputs:          spatially normalised structural file with the prefix 'ws'

function [ws_img] = normalise_structural_job(deformation_file, bias_file)

    clear matlabbatch   % clear matlabbatch
    
    matlabbatch{1}.spm.spatial.normalise.write.subj.def = cellstr(deformation_file);    % select deformation file
    matlabbatch{1}.spm.spatial.normalise.write.subj.resample = cellstr(bias_file);  % select bias-corrected structural file
    
    % set parameters
    matlabbatch{1}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                              78 76 85];
    matlabbatch{1}.spm.spatial.normalise.write.woptions.vox = [1 1 3];
    matlabbatch{1}.spm.spatial.normalise.write.woptions.interp = 4;
    matlabbatch{1}.spm.spatial.normalise.write.woptions.prefix = 'ws';

    ws_img = matlabbatch;

    % perform normalization
    spm_jobman('run', ws_img);

    clear matlabbatch % clear matlabbatch

end
