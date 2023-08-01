script_path = fullfile('C:\Users\mishi\Desktop\MCNB\2nd Semester\NMDA\EEG\Fieldtrip');   % change to where the scripts are for you
datapath = fullfile('C:\Users\mishi\Desktop\MCNB\2nd Semester\NMDA\EEG\Fieldtrip\Dataset');  % change to where data is for you
fieldtrip_path = fullfile('C:\Program Files\spm12\external\fieldtrip');  % change to where you downloaded the fieldtrip toolbox
addpath(script_path, datapath, fieldtrip_path)   % add script, data and fieldtrip path
removeChans = {'EXG4','EXG5','EXG6','EXG7','EXG8','GSR1','GSR2','Erg1','Erg2','Resp','Plet','Temp', 'Status'}; % channels to ignore
%% define trials
filename = fullfile(datapath, 'subject1.bdf');
cfg                         = [];
cfg.dataset                 = filename;
cfg.trialfun                = 'ft_trialfun_general'; % this is the default
cfg.trialdef.eventtype      = 'STATUS';
cfg.trialdef.eventvalue     = [65152 65216];
cfg.trialdef.prestim        = 0.005; % in seconds
cfg.trialdef.poststim       = 0.065; % in seconds
cfg.trialdef.ntrials        = 600;

cfg_tr_def = ft_definetrial(cfg);

%% Preprocessing
cfg = [];
cfg.dataset = filename;
cfg.channel = setdiff('all', removeChans);
data = ft_preprocessing(cfg); % read raw data

%% Automated artifact rejection
cfg = [];
cfg.dataset = filename;
cfg.trl       = cfg_tr_def; %structure that defines the data segments of interest, see FT_DEFINETRIAL
cfg.continuous = 'yes'; %'yes' or 'no' whether the file contains continuous data

% Prior to artifact detection, the data is preprocessed (again) with the following configuration parameters, which are optimal for identifying EOG artifacts.
cfg.artfctdef.zvalue.bpfilter   = 'yes';
cfg.artfctdef.zvalue.bpfilttype = 'but';
cfg.artfctdef.zvalue.bpfreq     = [1 3];
cfg.artfctdef.zvalue.bpfiltord  = 4;
cfg.artfctdef.zvalue.hilbert    = 'yes';

%Artifacts are identified by means of thresholding the z-transformed value of the preprocessed data.
cfg.artfctdef.zvalue.channel = setdiff('all', removeChans);
cfg.artfctdef.zvalue.cutoff = 4; 
cfg.artfctdef.zvalue.trlpadding = 0;
cfg.artfctdef.zvalue.fltpadding = 0;
cfg.artfctdef.zvalue.artpadding = 0.1;
cfg.artfctdef.zvalue.interactive = 'yes';
[cfg, artifact_eog] = ft_artifact_zvalue(cfg, data);

%% reject artifact
cfg.artfctdef.eog.artifact = artifact_eog;
cfg = ft_rejectartifact(cfg, data);
%% plotting erp's
% Baseline-correction & filtering options
cfg = [];
cfg.continuous = 'yes';
cfg.hpfilter       = 'yes';        % enable high-pass filtering
cfg.lpfilter       = 'yes';        % enable low-pass filtering
cfg.hpfreq         = 20;           % set up the frequency for high-pass filter
cfg.lpfreq         = 250;          % set up the frequency for low-pass filter
cfg.dftfilter      = 'yes';        % enable notch filtering to eliminate power line noise
cfg.dftfreq        = [50 100 150]; % set up the frequencies for notch filtering
cfg.demean    = 'yes';    % enable demean to remove mean value from each single trial
cfg.baselinewindow = [-0.1 -0.02];    % define the baseline window

% Re-referencing options 
cfg.refmethod   = 'avg';
cfg.reref         = 'yes';
cfg.refchannel    = 'all';

data_clean = ft_preprocessing(cfg, data);

%% Computing ERP's
% use ft_timelockanalysis to compute the ERPs

