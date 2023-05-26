%% auditory fMRI (Adapted from Auditory fMRI task from SPM Manual)
% batch script that calls functions in subscripts to do preprocessing and data analysis of auditory fMRI data step by step

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SETUP
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

no_runs = 1;    % enter the number of runs here
no_sessions = 1;    % enter the number of sessions here
no_vp = 1;  % enter the number of participants here

script_path = fullfile('/Users/Lucy/Documents/GitHub/NMDA_project/');   % change to where the scripts are for you
datapath = fullfile('/Users/Lucy/Documents/Berlin/FU/MCNB/2Semester/NMDA II/fMRI example dataset/MoAEpilot/');  % change to where data is for you
spm_path = fullfile('/Users/Lucy/Documents/MATLAB/spm12');  % change to where you downloaded the spm toolbox
addpath(script_path, datapath, spm_path)   % add script, data and spm path

spm('defaults', 'FMRI');    % setup spm
spm_jobman('initcfg');  % initialize spm

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PREPROCESSING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initialise fMRI analysis process loop over subjects, sessions, and runs
for v = 1:no_vp
    for s = 1:no_sessions
        for r = 1:no_runs

%% STEP 1: Realignment
        functional_img = spm_select('FPList', fullfile(datapath,'fM00223'), '^f.*\.img$');  % select all functional images
        structural_img = spm_select('FPList', fullfile(datapath,'sM00223'), '^s.*\.img$');  % select structural image
        r_img = realign_job(functional_img);    % realigns the functional images using the realign_job function

%% STEP 1.1:  Co-registration

        mean_functional_img = spm_select('FPList', fullfile(datapath,'fM00223'), '^mean.*\.img$');    % select mean image file from realignment
        c_img = coregister_job(mean_functional_img, structural_img);    % co-registrates the realigned functional image with the structural image

%% STEP 1.2: Segmentation

        tpm_file = spm_select('FPList', fullfile(spm_path, 'tpm'), '^T.*\.nii$');   % select tpm file
        s_img = segment_job(structural_img, tpm_file);  % segments the structural image    

%% STEP 2: Normalisation (Functional)

        deformation_file = spm_select('FPList', fullfile(datapath,'sM00223'), '^y.*\.nii$');  % select deformation file from segmentation
        r_files = spm_select('FPList', fullfile(datapath,'fM00223'), '^r.*\.img$'); % select realigned files from realignment
        w_img = normalise_functional_job(deformation_file, r_files);    % normalizes realigned images

%% STEP 2.1 (OPTIONAL) Normalisation (Structural)

        bias_file = spm_select('FPList', fullfile(datapath,'sM00223'), '^m.*\.nii$');  % select bias-corrected structural file from segmentation
        ws_img = normalise_structural_job(deformation_file, bias_file); % normalises structural image

%% STEP 3: Smoothing

        wrf_images = spm_select('FPList', fullfile(datapath, 'fM00223'), '^w.*\.img$'); % select wrf images
        sm_img = smooth_job(wrf_images); % smoothes all wrf images

        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ANALYSIS - STILL NEEDS TO BE DONE (LUCY)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% STEP 4.1: First level GLM - Specification

%% STEP 4.2: First level GLM - Estimation

%% STEP 5.1: Second level GLM - Contrasts

%% STEP 5.2: Second level GLM - Inference Results

%% STEP 5.3: Second level GLM - Rendering

%% STEP 6: Stats
