%% ANALYSIS
% STEP 5.3: Second level GLM - Rendering
% Function name:    render_job
% Description:      Renders images to visualize clusters of activation
% Arguments:        render_file (cortex mask used for rendering from spm toolbox)
%                   spm_mat (spm.mat file from estimation)
% Outputs:          rendered_img

function [rendered_img] = render_job(render_file, spm_mat)

    clear matlabbatch   % clear matlabbatch
    
    matlabbatch{1}.spm.util.render.display.rendfile = {render_file};  % select render file
    matlabbatch{1}.spm.util.render.display.conspec.spmmat = cellstr(spm_mat);  % select spm.mat file

    % set parameters
    matlabbatch{1}.spm.util.render.display.conspec.contrasts = 1;   % specify tested contrast
    matlabbatch{1}.spm.util.render.display.conspec.threshdesc = 'FWE';  % specify error correction
    matlabbatch{1}.spm.util.render.display.conspec.thresh = 0.05;   % specify threshold
    matlabbatch{1}.spm.util.render.display.conspec.extent = 0;

    rendered_img = matlabbatch;

    % perform rendering
    spm_jobman('run', rendered_img);

    clear matlabbatch % clear matlabbatch

end