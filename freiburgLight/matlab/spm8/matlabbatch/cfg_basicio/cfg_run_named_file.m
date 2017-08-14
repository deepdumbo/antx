function out = cfg_run_named_file(job)

% Return selected files as separate output arguments.
%
% This code is part of a batch job configuration system for MATLAB. See 
%      help matlabbatch
% for a general overview.
%_______________________________________________________________________
% Copyright (C) 2007 Freiburg Brain Imaging

% Volkmar Glauche
% $Id: cfg_run_named_file.m 269 2008-05-23 07:15:10Z glauche $

rev = '$Rev: 269 $'; %#ok

out.files = job.files;
cind = 1;
for k = 1:numel(job.files)
    out.index{k} = cind:(cind+numel(job.files{k})-1);
    cind = cind+numel(job.files{k});
end;
