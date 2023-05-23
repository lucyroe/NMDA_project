%% auditory fMRI (Adapted from Auditory fMRI task from SPM Manual)
% batch script that calls subscripts to do preprocessing and data analysis of auditory fMRI data step by step

%% SETUP
no_runs = 1; % enter the number of runs here
no_sessions = 1; % enter the number of sessions here
no_vp = 1; % enter the number of participants here

spm('defaults', 'FMRI'); % setup spm
spm_jobman('initcfg'); % initialize spm

script_path = fullfile('/Users/Lucy/Documents/GitHub/NMDA_project/'); % change to where the scripts are for you
datapath = fullfile('/Users/Lucy/Documents/Berlin/FU/MCNB/2Semester/NMDA II/fMRI example dataset/MoAEpilot/fM00223/'); % change to where data is for you

% Function Name:  get_filelist
% Description: Find source files from data directory and compile them into a list.  Function can be used for all stages of processing,
%   by passing the appropriate filter as an argument.
% Arguments: filter(to find relevant file for SPM processing stage), datapath(source directory)
% Example filters: per SPM ^r.*      ^ar.*       ^war.*      ^swar.*
% TODO:  Confirm best filters to use, currently just using standard file search filters.
%       Adjust code segments for each stage to use this function rather than separatly compiling file lists
function [final_img_data] = get_filelist(filter, datapath)
	img_files = dir(fullfile(datapath,filter)); % get all relevant files (per filter) from data directory (datapath) and list them.    
        img_data = {};                              %  initialize empty array to fill with files in the right format
        for i = 1:length(img_files)                 % loop over all img files
            baseFileName = img_files(i).name; 	    % get file names
            fullFileName = strcat(datapath, baseFileName, ',1');   % convert to correct format
            img_data = [img_data fullFileName];                    % add file to struct
        end
        final_img_data = {transpose(img_data)};                    % transpose to column for use SPM functions
end

% Initialise fMRI analysis process loop over subjects, sessions, and runs.
for v = 1:no_vp
    for s = 1:no_sessions
        for r = 1:no_runs

%% PREPROCESSING

%% STEP 1: Realignment
        % data formatting
        img_files = dir(fullfile(datapath,'*.img')); % get all the img files from data directory and list them
        img_data = {}; % initialize empty array to fill with files in the right format
        for i = 1:length(img_files) % loop over all img files
            baseFileName = img_files(i).name; % get file name
            fullFileName = strcat(datapath, baseFileName, ',1'); % add right format
            img_data = [img_data fullFileName]; % add file to struct
        end
        final_img_data = {transpose(img_data)}; % change struct to right format
        spm_jobman('run', fullfile(script_path, 'realign_job.m');

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

%% Estimate
nrun = X; % enter the number of runs here
jobfile = {'/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/output_directory/estimatee_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});

%% Specify
% List of open inputs
nrun = X; % enter the number of runs here
jobfile = {'/Users/caglademirkan/Documents/MATLAB_NMDA/MoAEpilot1/output_directory/specify_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});



%% STEP 5: Second level GLM

%% STEP 6: Stats
