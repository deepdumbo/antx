function str = showdetail(item)

% function str = showdetail(item)
% Display details for a cfg_repeat and all of its options.
%
% This code is part of a batch job configuration system for MATLAB. See 
%      help matlabbatch
% for a general overview.
%_______________________________________________________________________
% Copyright (C) 2007 Freiburg Brain Imaging

% Volkmar Glauche
% $Id: showdetail.m 557 2012-06-05 07:14:03Z glauche $

rev = '$Rev: 557 $'; %#ok

str = showdetail(item.cfg_item);
str{end+1} = 'Class  : cfg_repeat';
% Display detailed help for each cfg_choice value item
citems = subsref(item, substruct('.','values'));
if numel(citems) > 1 || item.forcestruct
    str{end+1} = ['A cell array, each cell containing a struct with a ' ...
                  'single field:'];
    for k = 1:numel(citems)
        str{end+1} = sprintf('.%s', gettag(citems{k}));
    end;
else
    if isa(citems{1}, 'cfg_branch')
        str{end+1} = 'A struct array with fields:';
    else
        str{end+1} = 'A cell array with contents:';
    end
    str = [str; showdetail(citems{1})];
end