%% ANALYSIS - STILL NEEDS TO BE DONE (LUCY)
% STEP 4.2: First Level GLM - Estimation
% Function name:    estimate_job
% Description:      
% Arguments:        
% Outputs:          

function [XX] = XX(XX)

    clear matlabbatch   % clear matlabbatch
    
    matlabbatch{1}.spm.stats.fmri_est.spmmat = {'/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/SPM.mat'};
    matlabbatch{1}.spm.stats.fmri_est.write_residuals = 0;
    matlabbatch{1}.spm.stats.fmri_est.method.Classical = 1;

    XX = matlabbatch;

    % perform estimation
    spm_jobman('run', XX);

    clear matlabbatch % clear matlabbatch

end
