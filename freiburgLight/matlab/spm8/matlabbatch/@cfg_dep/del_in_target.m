function cj = del_in_target(sdeps, cj)

% function cj = del_in_target(sdeps, cj)
% If a dependency source has changed, drop all dependent (target)
% references. Since dependencies only depend on input structure, this does
% not require recursive updates - the input structure of the dependent
% cfg_exbranch does not change if one of its inputs is missing.
%
% This code is part of a batch job configuration system for MATLAB. See 
%      help matlabbatch
% for a general overview.
%_______________________________________________________________________
% Copyright (C) 2007 Freiburg Brain Imaging

% Volkmar Glauche
% $Id: del_in_target.m 359 2008-11-18 11:38:19Z glauche $

rev = '$Rev: 359 $'; %#ok

% first, delete all immediate dependencies
for k = 1:numel(sdeps)
    eitem = subsref(cj, sdeps(k).tgt_exbranch); % dependent exbranch
    ditem = subsref(eitem, sdeps(k).tgt_input); % dependent item
    dind  = false(1,numel(ditem.val{1}));
    for l = 1:numel(ditem.val{1})
        % only check source here: if source has changed, delete it in all
        % targets
        dind(l) = ~isequalsource(sdeps(k),ditem.val{1}(l));
    end;
    if any(dind)
        ditem.val = {ditem.val{1}(dind)}; % Keep other dependencies
    else
        ditem.val = {}; % nothing left
    end;
    eitem = subsasgn(eitem, sdeps(k).tgt_input, ditem);
    % input to eitem.vout changes, but not the structure. Re-harvesting
    % eitem is therefore not necessary, instead just delete sdeps(k) from
    % eitem.tdeps.
    dind  = false(1,numel(eitem.tdeps));
    for l = 1:numel(eitem.tdeps)
        dind(l) = ~isequalsource(sdeps(k), eitem.tdeps(l));
    end;
    if any(dind)
        eitem.tdeps = eitem.tdeps(dind);
    else
        eitem.tdeps = [];
    end;
    cj = subsasgn(cj, sdeps(k).tgt_exbranch, eitem);
end;