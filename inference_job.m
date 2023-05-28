%% ANALYSIS
% STEP 5.2: Second level GLM - Inference Results
% Function name:    inference_job
% Description:      Inference Results
% Arguments:        spm_mat (spm.mat file from estimation)    
% Outputs:          inference_results

function [inference_results] = inference_job(spm_mat)

    clear matlabbatch   % clear matlabbatch
    
    matlabbatch{1}.spm.stats.results.spmmat = cellstr(spm_mat);  % select spm.mat file

    % set parameters
    matlabbatch{1}.spm.stats.results.conspec.contrasts = 1; % specify tested contrast
    matlabbatch{1}.spm.stats.results.conspec.threshdesc = 'FWE';    % specify error correction
    matlabbatch{1}.spm.stats.results.conspec.thresh = 0.05; % specify threshold
    matlabbatch{1}.spm.stats.results.conspec.extent = 0;
    matlabbatch{1}.spm.stats.results.print = false;

    inference_results = matlabbatch;

    % perform inference
    spm_jobman('run', inference_results);

    clear matlabbatch % clear matlabbatch

end