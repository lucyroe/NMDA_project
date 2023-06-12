%% PREPROCESSING 
% STEP 2: Normalization (functional)
% Function name:    normalise_functional_job
% Description:      normalises functional images spatially
% Arguments:        deformation_file (deformation info from segmentation)
%                   r_files (realigned functional image files)
% Outputs:          spatially normalised files with the prefix 'w'

function [w_img] = normalise_functional_job(deformation_file, r_files)
    
    clear matlabbatch   % clear matlabbatch
    
    matlabbatch{1}.spm.spatial.normalise.write.subj.def = cellstr(deformation_file);    % select deformation file from segmentation
    matlabbatch{1}.spm.spatial.normalise.write.subj.resample = cellstr(r_files);    % select realigned files
    
    % set parameters
    matlabbatch{1}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                              78 76 85];
    matlabbatch{1}.spm.spatial.normalise.write.woptions.vox = [3 3 3];
    matlabbatch{1}.spm.spatial.normalise.write.woptions.interp = 4;
    matlabbatch{1}.spm.spatial.normalise.write.woptions.prefix = 'w';

    w_img = matlabbatch;

    % perform normalization
    spm_jobman('run', w_img);

    clear matlabbatch % clear matlabbatch

end
