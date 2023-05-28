%% ANALYSIS
% STEP 4.2: First Level GLM - Estimation
% Function name:    estimate_job
% Description:      Model Estimation
% Arguments:        spm_mat1 (spm.mat file from specification)    
% Outputs:          spm_mat2 (updated spm.mat file)

function [spm_mat2] = estimate_job(spm_mat1)

    clear matlabbatch   % clear matlabbatch
    
    matlabbatch{1}.spm.stats.fmri_est.spmmat = cellstr(spm_mat1);    % select spm.mat file

    % set parameters
    matlabbatch{1}.spm.stats.fmri_est.write_residuals = 0;
    matlabbatch{1}.spm.stats.fmri_est.method.Classical = 1;

    spm_mat2 = matlabbatch;

    % perform estimation
    spm_jobman('run', spm_mat2);

    clear matlabbatch % clear matlabbatch

end
