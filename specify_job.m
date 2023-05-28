%% ANALYSIS
% STEP 4.1: First Level GLM - Specification
% Function name:    specify_job
% Description:      Model Specification
% Arguments:        output_dir (output directory)
%                   swrf_images (preprocessed images)        
% Outputs:          spm_data (spm.mat file saved in the output directory)

function [spm_data] = specify_job(output_dir, swrf_images)

    clear matlabbatch   % clear matlabbatch

    matlabbatch{1}.spm.stats.fmri_spec.dir = cellstr(output_dir); % specify output directory

    % set parameters
    matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'scans';
    matlabbatch{1}.spm.stats.fmri_spec.timing.RT = 7;
    matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = 16;
    matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = 8;

    matlabbatch{1}.spm.stats.fmri_spec.sess.scans = cellstr(swrf_images);    % select preprocessed swrf images

    matlabbatch{1}.spm.stats.fmri_spec.sess.cond.name = 'listening';
    matlabbatch{1}.spm.stats.fmri_spec.sess.cond.onset = [6
                                                          18
                                                          30
                                                          42
                                                          54
                                                          66
                                                          78];
    matlabbatch{1}.spm.stats.fmri_spec.sess.cond.duration = 6;
    matlabbatch{1}.spm.stats.fmri_spec.sess.cond.tmod = 0;
    matlabbatch{1}.spm.stats.fmri_spec.sess.cond.pmod = struct('name', {}, 'param', {}, 'poly', {});
    matlabbatch{1}.spm.stats.fmri_spec.sess.cond.orth = 1;
    matlabbatch{1}.spm.stats.fmri_spec.sess.multi = {''};
    matlabbatch{1}.spm.stats.fmri_spec.sess.regress = struct('name', {}, 'val', {});
    matlabbatch{1}.spm.stats.fmri_spec.sess.multi_reg = {''};
    matlabbatch{1}.spm.stats.fmri_spec.sess.hpf = 128;
    matlabbatch{1}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
    matlabbatch{1}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
    matlabbatch{1}.spm.stats.fmri_spec.volt = 1;
    matlabbatch{1}.spm.stats.fmri_spec.global = 'None';
    matlabbatch{1}.spm.stats.fmri_spec.mthresh = 0.8;
    matlabbatch{1}.spm.stats.fmri_spec.mask = {''};
    matlabbatch{1}.spm.stats.fmri_spec.cvi = 'AR(1)';

    spm_data = matlabbatch;

    % perform specification
    spm_jobman('run', spm_data);

    clear matlabbatch % clear matlabbatch

end
