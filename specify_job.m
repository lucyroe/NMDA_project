%% ANALYSIS - STILL NEEDS TO BE DONE (LUCY)
% STEP 4.1: First Level GLM - Specification
% Function name:    specify_job
% Description:      
% Arguments:        
% Outputs:  

function [XX] = XX(XX)

    clear matlabbatch   % clear matlabbatch
    
    matlabbatch{1}.spm.stats.fmri_spec.dir = {'/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1'};
    matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'scans';
    matlabbatch{1}.spm.stats.fmri_spec.timing.RT = 7;
    matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = 16;
    matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
    matlabbatch{1}.spm.stats.fmri_spec.sess.scans = {
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_004.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_005.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_006.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_007.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_008.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_009.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_010.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_011.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_012.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_013.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_014.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_015.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_016.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_017.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_018.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_019.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_020.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_021.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_022.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_023.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_024.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_025.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_026.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_027.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_028.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_029.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_030.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_031.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_032.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_033.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_034.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_035.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_036.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_037.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_038.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_039.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_040.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_041.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_042.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_043.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_044.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_045.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_046.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_047.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_048.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_049.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_050.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_051.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_052.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_053.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_054.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_055.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_056.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_057.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_058.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_059.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_060.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_061.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_062.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_063.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_064.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_065.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_066.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_067.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_068.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_069.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_070.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_071.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_072.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_073.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_074.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_075.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_076.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_077.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_078.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_079.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_080.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_081.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_082.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_083.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_084.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_085.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_086.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_087.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_088.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_089.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_090.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_091.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_092.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_093.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_094.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_095.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_096.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_097.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_098.img,1'
                                                     '/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/fM00223/swfM00223_099.img,1'
                                                     };
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

    XX = matlabbatch;

    % perform specification
    spm_jobman('run', XX);

    clear matlabbatch % clear matlabbatch

end
