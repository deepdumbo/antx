function [stat, cfg] = statistics_montecarlo(cfg, dat, design, varargin)

% STATISTICS_MONTECARLO performs a nonparametric statistical test by calculating 
% Monte-Carlo estimates of the significance probabilities and/or critical values from the 
% permutation distribution. This function should not be called
% directly, instead you should call the function that is associated with
% the type of data on which you want to perform the test.
%
% Use as:
%   stat = ft_timelockstatistics(cfg, data1, data2, data3, ...)
%   stat = ft_freqstatistics    (cfg, data1, data2, data3, ...)
%   stat = ft_sourcestatistics  (cfg, data1, data2, data3, ...)
%
% Where the data is obtained from FT_TIMELOCKANALYSIS, FT_FREQANALYSIS
% or FT_SOURCEANALYSIS respectively, or from FT_TIMELOCKGRANDAVERAGE,
% FT_FREQGRANDAVERAGE or FT_SOURCEGRANDAVERAGE respectively.
%
% Required configuration option: cfg.statstic (see below)
% Forbidden configuration options: cfg.ztransform, cfg.removemarginalmeans,
% cfg.randomfactor, cfg.voxelthreshold, cfg.voxelstatistic
%
% Configuration options that can be specified:
%   cfg.numrandomization = number of randomizations, can be 'all'
%   cfg.correctm         = apply multiple-comparison correction, 'no', 'max', cluster', 'bonferoni', 'holms', 'fdr' (default = 'no')
%   cfg.alpha            = critical value for rejecting the null-hypothesis per tail (default = 0.05) 
%   cfg.tail             = -1, 1 or 0 (default = 0)
%   cfg.correcttail      = correct p-values or alpha-values when doing a two-sided test, 'alpha','prob' or 'no' (default = 'no')
%   cfg.ivar             = number or list with indices, independent variable(s)
%   cfg.uvar             = number or list with indices, unit variable(s)
%   cfg.wvar             = number or list with indices, within-cell variable(s)
%   cfg.cvar             = number or list with indices, control variable(s)
%   cfg.feedback         = 'gui', 'text', 'textbar' or 'no' (default = 'text')
%   cfg.randomseed       = 'yes', 'no' or a number (default = 'yes')
%
% If you use a cluster-based statistic, you can specify the following
% options that determine how the single-sample or single-voxel
% statistics will be thresholded and combined into one statistical
% value per cluster.
%   cfg.clusterstatistic = how to combine the single samples that belong to a cluster, 'maxsum', 'maxsize', 'wcm' (default = 'maxsum')
%   cfg.clusterthreshold = method for single-sample threshold, 'parametric', 'nonparametric_individual', 'nonparametric_common' (default = 'parametric')
%   cfg.clusteralpha     = for either parametric or nonparametric thresholding per tail (default = 0.05)
%   cfg.clustercritval   = for parametric thresholding (default is determined by the statfun)
%   cfg.clustertail      = -1, 1 or 0 (default = 0)
%
% To include the channel dimension for clustering, you should specify
%   cfg.neighbours       = structure with the neighbours of each channel, see FT_NEIGHBOURSELECTION
% If you specify an empty neighbourhood structure, clustering will only be done
% in frequency and time (if available) and not over neighbouring channels.
%
% The statistic that is computed for each sample in each random reshuffling 
% of the data is specified as
%   cfg.statistic       = 'indepsamplesT'     independent samples T-statistic,
%                         'indepsamplesF'     independent samples F-statistic,
%                         'indepsamplesregrT' independent samples regression coefficient T-statistic,
%                         'indepsamplesZcoh'  independent samples Z-statistic for coherence,
%                         'depsamplesT'       dependent samples T-statistic,
%                         'depsamplesF'       dependent samples F-statistic,
%                         'depsamplesregrT'   dependent samples regression coefficient T-statistic,
%                         'actvsblT'          activation versus baseline T-statistic.
%
% You can also use a custom statistic of your choise that is sensitive
% to the expected effect in the data. You can implement the statistic
% in a "statfun" that will be called for each randomization. The
% requirements on a custom statistical function is that the function
% is called statfun_xxx, and that the function returns a structure
% with a "stat" field containing the single sample statistical values.
% Check the private functions statfun_xxx (e.g.  with xxx=tstat) for
% the correct format of the input and output.
%
% See also FT_TIMELOCKSTATISTICS, FT_FREQSTATISTICS, FT_SOURCESTATISTICS

% Undocumented local options:
%   cfg.resampling       permutation, bootstrap
%   cfg.computecritval   yes|no, for the statfun
%   cfg.computestat      yes|no, for the statfun
%   cfg.computeprob      yes|no, for the statfun
%   cfg.voxelstatistic   deprecated
%   cfg.voxelthreshold   deprecated
%   cfg.precondition     before|after|[], for the statfun

% Copyright (C) 2005-2007, Robert Oostenveld
%
% This file is part of FieldTrip, see http://www.ru.nl/neuroimaging/fieldtrip
% for the documentation and details.
%
%    FieldTrip is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    FieldTrip is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with FieldTrip. If not, see <http://www.gnu.org/licenses/>.
%
% $Id: statistics_montecarlo.m 3729 2011-06-23 15:26:04Z sashae $

ft_defaults

% check if the input cfg is valid for this function
cfg = ft_checkconfig(cfg, 'renamed',     {'factor',           'ivar'});
cfg = ft_checkconfig(cfg, 'renamed',     {'unitfactor',       'uvar'});
cfg = ft_checkconfig(cfg, 'renamed',     {'repeatedmeasures', 'uvar'});
cfg = ft_checkconfig(cfg, 'renamedval',  {'clusterthreshold', 'nonparametric', 'nonparametric_individual'});
cfg = ft_checkconfig(cfg, 'renamedval',  {'correctm', 'yes', 'max'});
cfg = ft_checkconfig(cfg, 'required',    {'statistic'});
cfg = ft_checkconfig(cfg, 'forbidden',   {'ztransform', 'removemarginalmeans', 'randomfactor'});
cfg = ft_checkconfig(cfg, 'forbidden',   {'voxelthreshold', 'voxelstatistic'});

% set the defaults for the main function
if ~isfield(cfg, 'alpha'),               cfg.alpha    = 0.05;            end
if ~isfield(cfg, 'tail'),                cfg.tail     = 0;               end
if ~isfield(cfg, 'correctm'),            cfg.correctm = 'no';            end % no, max, cluster, bonferoni, fdr
if ~isfield(cfg, 'resampling'),          cfg.resampling = 'permutation'; end % permutation, bootstrap
if ~isfield(cfg, 'feedback'),            cfg.feedback = 'text';          end
if ~isfield(cfg, 'ivar'),                cfg.ivar     = 'all';           end
if ~isfield(cfg, 'uvar'),                cfg.uvar     = [];              end
if ~isfield(cfg, 'cvar'),                cfg.cvar     = [];              end
if ~isfield(cfg, 'wvar'),                cfg.wvar     = [];              end
if ~isfield(cfg, 'correcttail'),         cfg.correcttail = 'no';         end % for the number of tails in a two-sided test
if ~isfield(cfg, 'randomseed'),          cfg.randomseed = 'yes';         end
if ~isfield(cfg, 'precondition'),        cfg.precondition = [];          end

if strcmp(cfg.correctm, 'cluster')
  % set the defaults for clustering
  if ~isfield(cfg, 'clusterstatistic'),    cfg.clusterstatistic = 'maxsum';     end  % no, max, maxsize, maxsum, wcm
  if ~isfield(cfg, 'clusterthreshold'),    cfg.clusterthreshold = 'parametric'; end  % parametric, nonparametric_individual, nonparametric_common
  if ~isfield(cfg, 'clusteralpha'),        cfg.clusteralpha = 0.05;             end
  if ~isfield(cfg, 'clustercritval'),      cfg.clustercritval = [];             end
  if ~isfield(cfg, 'clustertail'),         cfg.clustertail = cfg.tail;          end
else
  % these options only apply to clustering, to ensure appropriate configs they are forbidden when _not_ clustering
  cfg = ft_checkconfig(cfg, 'unused', {'clusterstatistic', 'clusteralpha', 'clustercritval', 'clusterthreshold', 'clustertail', 'neighbours'});
end

% for backward compatibility and other warnings relating correcttail
if isfield(cfg,'correctp') && strcmp(cfg.correctp,'yes')
  warning('cfg.correctp has been renamed to cfg.correcttail and the options have been changed')
  disp('setting cfg.correcttail to ''prob''')
  cfg.correcttail = 'prob';
  cfg = rmfield(cfg,'correctp');
elseif isfield(cfg,'correctp') && strcmp(cfg.correctp,'no')
  cfg = ft_checkconfig(cfg, 'renamed', {'correctp', 'correcttail'});
end
if strcmp(cfg.correcttail,'no') && cfg.tail==0 && cfg.alpha==0.05
  warning('doing a two-sided test without correcting p-values or alpha-level, p-values and alpha-level will reflect one-sided tests per tail')
end

% get the single keyval for issource out
issource = keyval('issource', varargin); if isempty(issource), issource = 0; end


% for backward compatibility
if size(design,2)~=size(dat,2)
  design = transpose(design);
end

if ischar(cfg.ivar) && strcmp(cfg.ivar, 'all')
  cfg.ivar = 1:size(design,1);
end

% determine the function handle to the low-level statistics function
if exist(['statistics_' cfg.statistic])
  statfun = str2func(['statistics_' cfg.statistic]);
elseif exist(['statfun_' cfg.statistic])
  statfun = str2func(['statfun_' cfg.statistic]);
else
  error(sprintf('could not find the statistics function "%s"\n', ['statfun_' cfg.statistic]));
end
fprintf('using "%s" for the single-sample statistics\n', func2str(statfun));

% initialize the random number generator.
if strcmp(cfg.randomseed, 'no')
   % do nothing
elseif strcmp(cfg.randomseed, 'yes')
   rand('state',sum(100*clock));
else
   % seed with the user-given value
   rand('state',cfg.randomseed);
end;

% construct the resampled design matrix or data-shuffling matrix
fprintf('constructing randomized design\n');
resample = resampledesign(cfg, design);
Nrand = size(resample,1);

% most of the statfuns result in this warning, which is not interesting
ws = warning('off', 'MATLAB:warn_r14_stucture_assignment');

if strcmp(cfg.correctm, 'cluster')
  % determine the critical value for cluster thresholding
  if strcmp(cfg.clusterthreshold, 'nonparametric_individual') || strcmp(cfg.clusterthreshold, 'nonparametric_common')
    fprintf('using a nonparmetric threshold for clustering\n');
    cfg.clustercritval = [];  % this will be determined later
  elseif strcmp(cfg.clusterthreshold, 'parametric') && isempty(cfg.clustercritval)
    fprintf('computing a parametric threshold for clustering\n');
    tmpcfg = [];
    tmpcfg.dimord         = cfg.dimord;
    tmpcfg.dim            = cfg.dim;
    tmpcfg.alpha          = cfg.clusteralpha;
    tmpcfg.tail           = cfg.clustertail;
    tmpcfg.ivar           = cfg.ivar;
    tmpcfg.uvar           = cfg.uvar;
    tmpcfg.cvar           = cfg.cvar;
    tmpcfg.wvar           = cfg.wvar;
    if isfield(cfg, 'contrastcoefs'), tmpcfg.contrastcoefs = cfg.contrastcoefs; end % needed for Erics F-test statfun
    tmpcfg.computecritval = 'yes';  % explicitly request the computation of the crtitical value
    tmpcfg.computestat    = 'no';   % skip the computation of the statistic
    try
      cfg.clustercritval    = getfield(statfun(tmpcfg, dat, design), 'critval');
    catch
      disp(lasterr);
      error('could not determine the parametric critical value for clustering');
    end
  elseif strcmp(cfg.clusterthreshold, 'parametric') && ~isempty(cfg.clustercritval)
    fprintf('using the specified parametric threshold for clustering\n');
    cfg.clusteralpha = [];
  end
end

% compute the statistic for the observed data
ft_progress('init', cfg.feedback, 'computing statistic');
% get an estimate of the time required per evaluation of the statfun
time_pre = cputime;

try
  % the nargout function in Matlab 6.5 and older does not work on function handles
  num = nargout(statfun);
catch
  num = 1;
end
if num==1,
  % only the statistic is returned
  [statobs] = statfun(cfg, dat, design);
elseif num==2,
  % both the statistic and the (updated) configuration are returned
  [statobs, cfg] = statfun(cfg, dat, design);
elseif num==3,
  % both the statistic and the (updated) configuration and the (updated) data are returned
  tmpcfg = cfg;
  if strcmp(cfg. precondition, 'before'), tmpcfg.preconditionflag = 1; end 
  [statobs, tmpcfg, dat]  = statfun(tmpcfg, dat, design);
end

if isstruct(statobs)
  % remember all details for later reference, continue to work with the statistic
  statfull = statobs;
  statobs  = getfield(statfull, 'stat');
else
  % remember the statistic for later reference, continue to work with the statistic
  statfull.stat = statobs;
end
time_eval = cputime - time_pre;
fprintf('estimated time per randomization is %d seconds\n', round(time_eval));

% pre-allocate some memory
%if strcmp(cfg.correctm, 'cluster')
if strcmp(cfg.correctm, 'cluster')
  statrand = zeros(size(statobs,1), size(resample,1));
else
  prb_pos   = zeros(size(statobs));
  prb_neg   = zeros(size(statobs));
end

if strcmp(cfg.precondition, 'after'),
  tmpcfg = cfg;
  tmpcfg.preconditionflag = 1;
  [tmpstat, tmpcfg, dat]     = statfun(tmpcfg, dat, design);  
end

% compute the statistic for the randomized data and count the outliers
for i=1:Nrand
  ft_progress(i/Nrand, 'computing statistic %d from %d\n', i, Nrand);
  if strcmp(cfg.resampling, 'permutation')
    tmpdesign = design(:,resample(i,:));     % the columns in the design matrix are reshufled by means of permutation
    tmpdat    = dat;                        % the data itself is not shuffled
    if size(tmpdesign,1)==size(tmpdat,2)
      tmpdesign = transpose(tmpdesign);
    end
  elseif strcmp(cfg.resampling, 'bootstrap')
    tmpdesign = design;                     % the design matrix is not shuffled
    tmpdat    = dat(:,resample(i,:));        % the columns of the data are resampled by means of bootstrapping
  end
  if strcmp(cfg.correctm, 'cluster')
    % keep each randomization in memory for cluster postprocessing
    dum = statfun(cfg, tmpdat, tmpdesign);
    if isstruct(dum)
      statrand(:,i) = getfield(dum, 'stat');
    else
      statrand(:,i) = dum;
    end
  else
    % do not keep each randomization in memory, but process them on the fly
    statrand = statfun(cfg, tmpdat, tmpdesign);
    if isstruct(statrand)
      statrand = getfield(statrand, 'stat');
    end
    % the following line is for debugging 
    % stat.statkeep(:,i) = statrand;
    if strcmp(cfg.correctm, 'max')
      % compare each data element with the maximum statistic
      prb_pos = prb_pos + (statobs<max(statrand(:)));
      prb_neg = prb_neg + (statobs>min(statrand(:)));
      posdistribution(i) = max(statrand(:));
      negdistribution(i) = min(statrand(:));
    else
      % compare each data element with its own statistic
      prb_pos = prb_pos + (statobs<statrand);
      prb_neg = prb_neg + (statobs>statrand);
    end
  end
end
ft_progress('close');

if strcmp(cfg.correctm, 'cluster')
  % do the cluster postprocessing
  [stat, cfg] = clusterstat(cfg, statrand, statobs,'issource',issource);
else
  switch cfg.tail
  case 1
    clear prb_neg  % not needed any more, free some memory
    stat.prob = prb_pos./Nrand;
  case -1
    clear prb_pos  % not needed any more, free some memory
    stat.prob = prb_neg./Nrand;
  case 0
    % for each observation select the tail that corresponds with the lowest probability
    prb_neg = prb_neg./Nrand;
    prb_pos = prb_pos./Nrand;
    stat.prob = min(prb_neg, prb_pos); % this is the probability for the most unlikely tail
  end
end

% In case of a two tailed test, the type-I error rate (alpha) refers to
% both tails of the distribution, whereas the stat.prob value computed sofar
% corresponds with one tail, i.e. the probability, under the assumption of
% no effect or no difference (the null hypothesis), of obtaining a result
% equal to or more extreme than what was actually observed. The decision
% rule whether the null-hopothesis should be rejected given the observed
% probability therefore should consider alpha divided by two, to correspond
% with the probability in one of the tails (the most extreme tail). This
% is conceptually equivalent to performing a Bonferroni correction for the
% two tails.
% 
% An alternative solution to distribute the alpha level over both tails is
% achieved by multiplying the probability with a factor of two, prior to
% thresholding it wich cfg.alpha.  The advantage of this solution is that
% it results in a p-value that corresponds with a parametric probability.
% Below both options are realized
if strcmp(cfg.correcttail, 'prob') && cfg.tail==0
  stat.prob = stat.prob .* 2;
  stat.prob(stat.prob>1) = 1; % clip at p=1
  % also correct the probabilities in the pos/negcluster fields
  if isfield(stat, 'posclusters')
    for i=1:length(stat.posclusters)
      stat.posclusters(i).prob = stat.posclusters(i).prob*2;
      if stat.posclusters(i).prob>1; stat.posclusters(i).prob = 1; end
    end
  end
  if isfield(stat, 'negclusters')
    for i=1:length(stat.negclusters)
      stat.negclusters(i).prob = stat.negclusters(i).prob*2;
      if stat.negclusters(i).prob>1; stat.negclusters(i).prob = 1; end
    end
  end
elseif strcmp(cfg.correcttail, 'alpha') && cfg.tail==0
  cfg.alpha = cfg.alpha / 2;
end

switch lower(cfg.correctm)
  case 'max'
    % the correction is implicit in the method
    fprintf('using a maximum-statistic based method for multiple comparison correction\n');
    fprintf('the returned probabilities and the thresholded mask are corrected for multiple comparisons\n');
    stat.mask = stat.prob<=cfg.alpha;
    stat.posdistribution = posdistribution;
    stat.negdistribution = negdistribution;
  case 'cluster'
    % the correction is implicit in the method
    fprintf('using a cluster-based method for multiple comparison correction\n');
    fprintf('the returned probabilities and the thresholded mask are corrected for multiple comparisons\n');
    stat.mask = stat.prob<=cfg.alpha;
  case 'bonferoni'
    fprintf('performing Bonferoni correction for multiple comparisons\n');
    fprintf('the returned probabilities are uncorrected, the thresholded mask is corrected\n');
    stat.mask = stat.prob<=(cfg.alpha ./ numel(stat.prob));
  case 'holms'
    % test the most significatt significance probability against alpha/N, the second largest against alpha/(N-1), etc.
    fprintf('performing Holms correction for multiple comparisons\n');
    fprintf('the returned probabilities are uncorrected, the thresholded mask is corrected\n');
    [pvals, indx] = sort(stat.prob(:));                     % this sorts the significance probabilities from smallest to largest
    mask = pvals<=(cfg.alpha ./ ((length(pvals):-1:1)'));   % compare each significance probability against its individual threshold
    stat.mask = zeros(size(stat.prob));
    stat.mask(indx) = mask;
  case 'fdr'
    fprintf('performing FDR correction for multiple comparisons\n');
    fprintf('the returned probabilities are uncorrected, the thresholded mask is corrected\n');
    stat.mask = fdr(stat.prob, cfg.alpha);
  otherwise
    fprintf('not performing a correction for multiple comparisons\n');
    stat.mask = stat.prob<=cfg.alpha;
end

% return the observed statistic
if ~isfield(stat, 'stat')
  stat.stat = statobs;
end

if exist('statrand', 'var'),
  stat.ref = mean(statrand,2);
end

% return optional other details that were returned by the statfun
fn = fieldnames(statfull);
for i=1:length(fn)
  if ~isfield(stat, fn{i})
    stat = setfield(stat, fn{i}, getfield(statfull, fn{i}));
  end
end

warning(ws); % revert to original state