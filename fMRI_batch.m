%% auditory fMRI (Adapted from Auditory fMRI task from SPM Manual)
%    batch script that calls subscripts to do preprocessing and data analysis of auditory fMRI data step by step

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

%% STEP 1.1:  Coregistration

        coregister_script = fullfile(script_path, 'coregister.m');      % compose the script filename and source directory into a full filename to be used in following functions.
        % presumably this line wont be necessary once we incorporate into a multi-session/subject/run loop. 
        coregister_jobs = repmat(coregister_script, 1, no_runs);  % Copy the script location multiple/no_runs times into a list, this will be passed as an argument to the function spm_jobman 
        inputs = cell(0, no_runs);                                                           % create an empty cell array of size (0 x no_runs) this will be passed as an argument to the function spm_jobman
        spm_jobman('run', coregister_jobs, inputs{:});                    % spm_jobman() simply enables SPM to understand the "matlabbatch" jobs within the jobs file module).

%% STEP 1.2: Segmentation

        % Code below follows the code blocks for previous preprocessing stages   (see above for comments)
        segment_script = fullfile(script_path, 'segment.m');    
        % presumably this line wont be necessary once we incorporate into a multi-session/subject/run loop. 
        segment_jobs = repmat(segment_script, 1, no_runs); 
        inputs = cell(0, no_runs);                                                      
        spm_jobman('run', segment_jobs, inputs{:});                

%% STEP 2: Normalization (Functional)

        % Code below follows the code blocks for previous preprocessing stages   (see above for comments)
        normalise_functional_script = fullfile(script_path, 'normalise_functional.m');    
        % presumably this line wont be necessary once we incorporate into a multi-session/subject/run loop. 
        normalise_functional_jobs = repmat(normalise_functional_script, 1, no_runs); 
        inputs = cell(0, no_runs);
        spm_jobman('run', normalise_functional_jobs, inputs{:});

%% STEP 2.1 (OPTIONAL) Normalisation (Structural)

        % Code below follows the code blocks for previous preprocessing stages   (see above for comments)
        normalise_structural_script = fullfile(script_path, 'normalise_structural.m');    
        % presumably this line wont be necessary once we incorporate into a multi-session/subject/run loop. 
        normalise_structural_jobs = repmat(normalise_structural_script, 1, no_runs); 
        inputs = cell(0, no_runs);
        spm_jobman('run', normalise_structural_jobs, inputs{:});

%% STEP 3: Smoothing

       % Code below follows the code blocks for previous preprocessing stages   (see above for comments)
        smooth_script = fullfile(script_path, 'smooth.m');    
        % presumably this line wont be necessary once we incorporate into a multi-session/subject/run loop. 
        smooth_jobs = repmat(smooth_script, 1, no_runs); 
        inputs = cell(0, no_runs);
        spm_jobman('run', smooth_jobs, inputs{:});

        end
    end
end

%% ANALYSIS

%% STEP 4: First level GLM

%% STEP 5: Second level GLM

%% STEP 6: Stats
