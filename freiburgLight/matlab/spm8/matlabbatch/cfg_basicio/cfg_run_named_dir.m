function out = cfg_run_named_dir(job)

% Return selected dirs as separate output arguments.
%
% This code is part of a batch job configuration system for MATLAB. See 
%      help matlabbatch
% for a general overview.
%_______________________________________________________________________
% Copyright (C) 2007 Freiburg Brain Imaging

% Volkmar Glauche
% $Id: cfg_run_named_dir.m 269 2008-05-23 07:15:10Z glauche $

rev = '$Rev: 269 $'; %#ok

out.dirs = job.dirs;
