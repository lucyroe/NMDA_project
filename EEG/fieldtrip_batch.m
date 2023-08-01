%% set up
clc
clear
close all

script_path = fullfile('/Users/Lucy/Documents/GitHub/NMDA_project/EEG/');   % change to where the scripts are for you
datapath = fullfile('/Users/Lucy/Documents/Berlin/FU/MCNB/2Semester/NMDAII/EEG_example_dataset/');  % change to where data is for you
fieldtrip_path = fullfile('/Users/Lucy/Documents/MATLAB/fieldtrip-20230716');  % change to where you downloaded the fieldtrip toolbox
addpath(script_path, datapath, fieldtrip_path)   % add script, data and fieldtrip path

removeChans = {'EXG4','EXG5','EXG6','EXG7','EXG8','GSR1','GSR2','Erg1','Erg2','Resp','Plet','Temp', 'Status'}; % channels to ignore

filename = fullfile(datapath, 'subject1.bdf'); % get subjectfile

% uncomment to visualize raw data
% cfg            = [];
% cfg.dataset    = filename;
% cfg.continuous = 'yes';
% cfg.viewmode   = 'vertical';
% cfg.blocksize  = 1; % duration of data to display, in seconds
% 
% ft_databrowser(cfg);

% read events
cfg = [];
cfg.trialdef.prestim = 0.005; % in seconds / WE DON'T KNOW WHEN THE STIMULUS WAS PRESENTED SO THESE NUMBERS ARE ARBITRARY
cfg.trialdef.poststim = 0.065; % in seconds
cfg.dataset = filename; % define dataset
cfg.trialdef.eventtype = 'STATUS'; % set event type
cfg.trialdef.eventvalue = [65152 65216]; % the values of the stimulus trigger for the conditions
% apparently standard and deviant trials are coded as 65152 and 65216 respectively
cfg_tr_def = ft_definetrial(cfg); % read the list of the specific stimulus

cfg = [];
cfg.dataset = filename;
cfg.channel = setdiff('all', removeChans);
data = ft_preprocessing(cfg); % read raw data

% segment data according to the trial definition
data = ft_redefinetrial(cfg_tr_def, data);

% bdf data needs to be rereferenced, i.e. change the reference from CMS to another electrode (here: A1)
cfg.reref = 'yes';
cfg.refchannel = 'A1';
cfg.demean = 'yes';
cfg.baselinewindow = [-0.2 0];
data = ft_preprocessing(cfg, data);

cfg = [];
timelock = ft_timelockanalysis(cfg, data);

% filter
cfg = [];
cfg.hpfilter       = 'yes';        % enable high-pass filtering
cfg.lpfilter       = 'yes';        % enable low-pass filtering
cfg.hpfreq         = 20;           % set up the frequency for high-pass filter
cfg.lpfreq         = 250;          % set up the frequency for low-pass filter
cfg.dftfilter      = 'yes';        % enable notch filtering to eliminate power line noise
cfg.dftfreq        = [50 100 150]; % set up the frequencies for notch filtering
cfg.baselinewindow = [-0.1 -0.02];    % define the baseline window
data               = ft_preprocessing(cfg,data);

% clean data of bad trials
cfg        = [];
cfg.metric = 'zvalue';  % use by default zvalue method
cfg.method = 'summary'; % use by default summary method
data       = ft_rejectvisual(cfg,data); % AT THE MOMENT MANUAL REJECTION - FIND AUTOMATED WAY

% averaging
cfg = [];
cfg.preproc.demean    = 'yes';    % enable demean to remove mean value from each single trial
cfg.covariance        = 'yes';    % calculate covariance matrix of the data
cfg.covariancewindow  = [-0.1 0]; % calculate the covariance matrix for a specific time window
EEG_avg               = ft_timelockanalysis(cfg, data);

% rereferencing
cfg               = [];
cfg.reref         = 'yes';
cfg.refchannel    = 'all';
cfg.refmethod     = 'avg';
EEG_avg           = ft_preprocessing(cfg, EEG_avg);

% global mean field power calculation for visualization purposes
cfg         = [];
cfg.method  = 'amplitude';
EEG_gmfp    = ft_globalmeanfield(cfg, EEG_avg);

% plotting results
figure

pol = -1;     % correct polarity
scale = 10^6; % scale for eeg data micro volts

signal = scale * pol * EEG_avg.avg; % add single trials in a new value

% plot single trial together with global mean field power
h1 = plot(EEG_avg.time,signal, 'color',[0,0,0.5]);
hold on;
h2 = plot(EEG_avg.time,scale*EEG_gmfp.avg, 'color',[1,0,0], 'linewidth',1);

legend([h1(1,1),h2],{'EEG', 'GMFP'});
grid on;
ylabel('SEP (\muV)', 'Interpreter', 'Tex');
xlabel('Time (s)')
set(gca, 'fontsize',18, 'fontname', 'Century Gothic');

mx = max(max(signal));
mn = min(min(signal));
axis([EEG_avg.time(1) EEG_avg.time(end) mn mx])
