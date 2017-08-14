function tag = gettag(item)

% function tag = gettag(item)
% Return tag of item or its item.values{1} child node, depending on
% configuration.
%
% This code is part of a batch job configuration system for MATLAB. See 
%      help matlabbatch
% for a general overview.
%_______________________________________________________________________
% Copyright (C) 2007 Freiburg Brain Imaging

% Volkmar Glauche
% $Id: gettag.m 269 2008-05-23 07:15:10Z glauche $

rev = '$Rev: 269 $'; %#ok


if numel(item.values)>1 || item.forcestruct,
    tag = item.cfg_item.tag;
else
    tag = gettag(item.values{1});
end;

    
