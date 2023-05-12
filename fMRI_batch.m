%% auditory fMRI
% batch script that calls subscripts to do preprocessing and data analysis
% of auditory fMRI data step by step

%% SETUP
no_runs = 1; % enter the number of runs here
no_sessions = 1; % enter the number of sessions here
no_vp = 1; % enter the number of participants here

spm('defaults', 'FMRI'); % setup spm

script_path = fullfile('/Users/Lucy/Documents/Berlin/FU/MCNB/2Semester/NMDA II/fMRI example dataset/code/'); % change to where the scripts are for you
datapath = fullfile('/Users/Lucy/Documents/Berlin/FU/MCNB/2Semester/NMDA II/fMRI example dataset/MoAEpilot/fM00223/'); % change to where data is for you

for v = 1:no_vp
    for s = 1:no_sessions
        for r = 1:no_runs

%% PREPROCESSING

%% STEP 1: Realignment

        realign_script = fullfile(script_path, 'realign.m');
        realign_jobs = repmat(realign_script, 1, no_runs);
        inputs = cell(0, no_runs);
        spm_jobman('run', realign_jobs, inputs{:});

%% STEP 2: Normalization

%% STEP 3: Smoothing

        end
    end
end

%% ANALYSIS

%% STEP 4: First level GLM

%% STEP 5: Second level GLM

%% STEP 6: Stats