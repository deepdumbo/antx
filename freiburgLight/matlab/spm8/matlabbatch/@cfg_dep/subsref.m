function varargout = subsref(dep, subs)

% function varargout = subsref(dep, subs)
% subscript references we have to deal with are:
% one level
% dep.(field)   - i.e. struct('type',{'.'} ,'subs',{field})
% dep(idx)      - i.e. struct('type',{'()'},'subs',{idx})
% two levels
% dep(idx).(field)
%
% to be dealt with elsewhere
% dep.(field){fidx}
% three levels
% dep(idx).(field){fidx}
%
% This code is part of a batch job configuration system for MATLAB. See 
%      help matlabbatch
% for a general overview.
%_______________________________________________________________________
% Copyright (C) 2007 Freiburg Brain Imaging

% Volkmar Glauche
% $Id: subsref.m 490 2010-09-20 13:14:03Z glauche $

rev = '$Rev: 490 $'; %#ok

if strcmpi(subs(1).type, '()')
    % select referenced objects from input array
    dep = dep(subs(1).subs{:});
    if numel(subs) == 1
        % done, return selected objects
        varargout{1} = dep;
        return;
    else
        % continue, avoid recursion
        subs = subs(2:end);
    end
end

if strcmpi(subs(1).type, '.')
    % field reference
    val = {dep.(subs(1).subs)};
    if numel(subs) > 1
        varargout = cellfun(@(cval)subsref(cval,subs(2:end)), val, 'UniformOutput', false);
    else
        varargout = val;
    end
else
    cfg_message('matlabbatch:subsref:unknowntype', 'Unknown subsref type: ''%s''. This should not happen.', subs(1).type);
end