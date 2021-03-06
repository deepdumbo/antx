function checkstr = subsasgn_checkstr(item, subs)

% function checkstr = subsasgn_checkstr(item, subs)
% Preformat a warning message suitable for all subsasgn_check functions
%
% This code is part of a batch job configuration system for MATLAB. See 
%      help matlabbatch
% for a general overview.
%_______________________________________________________________________
% Copyright (C) 2007 Freiburg Brain Imaging

% Volkmar Glauche
% $Id: subsasgn_checkstr.m 284 2008-06-06 11:12:41Z glauche $

rev = '$Rev: 284 $'; %#ok

checkstr = sprintf('Item ''%s'', field ''%s''', subsref(item,substruct('.','name')), subs(1).subs);
