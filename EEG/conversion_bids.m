%% script to convert raw EEG data to BIDS

% set up
clc
clear
close all

script_path = fullfile('/Users/Lucy/Documents/GitHub/NMDA_project/EEG/');   % change to where the scripts are for you
datapath = fullfile('/Users/Lucy/Documents/Berlin/FU/MCNB/2Semester/NMDAII/EEG_example_dataset/');  % change to where data is for you
fieldtrip_path = fullfile('/Users/Lucy/Documents/MATLAB/fieldtrip-20230716');  % change to where you downloaded the fieldtrip toolbox
addpath(script_path, datapath, fieldtrip_path)   % add script, data and fieldtrip path

sub = {'01'}; % subjects (in example data set, there is only one subject)

% loop over subjects
for subindx=1:numel(sub)

  cfg = [];
  cfg.method    = 'convert';
  cfg.datatype  = 'eeg';

  % specify the input file name
  filename = fullfile(datapath, 'subject1.bdf'); % get subjectfile
  cfg.dataset   = filename;

  % specify the output directory
  cfg.bidsroot  = 'bids';
  cfg.sub       = sub{subindx};

  % provide the mnemonic and long description of the task
  cfg.TaskName        = 'auditory oddball paradigm';
  cfg.TaskDescription = 'Subjects heard standard (500Hz) and deviant (550Hz) tones, occuring 80% (480 trials) and 20% (120 trials) of the time, respectively.';

  % these are EEG specific
  cfg.eeg.PowerLineFrequency = 50;   % since recorded in the EU
  cfg.eeg.EEGReference       = 'M1'; % actually I do not know, but let's assume it was left mastoid

  data2bids(cfg);

end
