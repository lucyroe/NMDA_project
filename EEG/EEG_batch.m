% List of open inputs
nrun = X; % enter the number of runs here
jobfile = {'/Users/caglademirkan/Documents/MATLAB_NMDA/EEG_batch_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'EEG');
spm_jobman('run', jobs, inputs{:});

