%% ANALYSIS
% STEP 5.1: Second level GLM - Contrasts
% Function name:    contrast_job
% Description:      Contrasts
% Arguments:        spm_mat (spm.mat file from estimation)    
% Outputs:          contrast_results

function [contrast_results] = contrast_job(spm_mat)

    clear matlabbatch   % clear matlabbatch
    
    matlabbatch{1}.spm.stats.con.spmmat = cellstr(spm_mat);  % select spm.mat file

    matlabbatch{1}.spm.stats.con.consess{1}.tcon.name = 'Listening > Rest'; % define contrast 1
    matlabbatch{1}.spm.stats.con.consess{1}.tcon.weights = [1 0];   % set weights
    matlabbatch{1}.spm.stats.con.consess{2}.tcon.name = 'Rest > Listening'; % define contrast 2
    matlabbatch{1}.spm.stats.con.consess{2}.tcon.weights = [-1 0];  % set weights
    % etc.

    contrast_results = matlabbatch;

    % calculate contrasts
    spm_jobman('run', contrast_results);

    clear matlabbatch % clear matlabbatch

end