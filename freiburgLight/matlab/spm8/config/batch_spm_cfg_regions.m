%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 217 $)
%-----------------------------------------------------------------------
matlabbatch{1}.menu_cfg.menu_entry.conf_files.type = 'cfg_files';
matlabbatch{1}.menu_cfg.menu_entry.conf_files.name = 'Select SPM.mat';
matlabbatch{1}.menu_cfg.menu_entry.conf_files.tag = 'spmmat';
matlabbatch{1}.menu_cfg.menu_entry.conf_files.filter = 'mat';
matlabbatch{1}.menu_cfg.menu_entry.conf_files.ufilter = '^SPM\.mat$';
matlabbatch{1}.menu_cfg.menu_entry.conf_files.dir = '';
matlabbatch{1}.menu_cfg.menu_entry.conf_files.num = [1 1];
matlabbatch{1}.menu_cfg.menu_entry.conf_files.check = [];
matlabbatch{1}.menu_cfg.menu_entry.conf_files.help = {'Select the SPM.mat file that contains the design specification.'};
matlabbatch{1}.menu_cfg.menu_entry.conf_files.def = [];
matlabbatch{2}.menu_cfg.menu_entry.conf_entry.type = 'cfg_entry';
matlabbatch{2}.menu_cfg.menu_entry.conf_entry.name = 'Contrast';
matlabbatch{2}.menu_cfg.menu_entry.conf_entry.tag = 'contrasts';
matlabbatch{2}.menu_cfg.menu_entry.conf_entry.strtype = 'n';
matlabbatch{2}.menu_cfg.menu_entry.conf_entry.extras = [];
matlabbatch{2}.menu_cfg.menu_entry.conf_entry.num = [1 Inf];
matlabbatch{2}.menu_cfg.menu_entry.conf_entry.check = @(job)spm_run_regions('check','contrasts',job);
matlabbatch{2}.menu_cfg.menu_entry.conf_entry.help = {'Index of contrast(s). If more than one number is entered, analyse a conjunction hypothesis.'};
matlabbatch{2}.menu_cfg.menu_entry.conf_entry.def = [];
matlabbatch{3}.menu_cfg.menu_entry.conf_menu.type = 'cfg_menu';
matlabbatch{3}.menu_cfg.menu_entry.conf_menu.name = 'Threshold type';
matlabbatch{3}.menu_cfg.menu_entry.conf_menu.tag = 'threshdesc';
matlabbatch{3}.menu_cfg.menu_entry.conf_menu.labels = {
                                                       'FWE'
                                                       'none'
                                                       }';
matlabbatch{3}.menu_cfg.menu_entry.conf_menu.values = {
                                                       'FWE'
                                                       'none'
                                                       }';
matlabbatch{3}.menu_cfg.menu_entry.conf_menu.check = [];
matlabbatch{3}.menu_cfg.menu_entry.conf_menu.help = {};
matlabbatch{3}.menu_cfg.menu_entry.conf_menu.def = @(val)spm_get_defaults('stats.results.threshtype',val{:});
matlabbatch{4}.menu_cfg.menu_entry.conf_entry.type = 'cfg_entry';
matlabbatch{4}.menu_cfg.menu_entry.conf_entry.name = 'Threshold';
matlabbatch{4}.menu_cfg.menu_entry.conf_entry.tag = 'thresh';
matlabbatch{4}.menu_cfg.menu_entry.conf_entry.strtype = 'r';
matlabbatch{4}.menu_cfg.menu_entry.conf_entry.extras = [];
matlabbatch{4}.menu_cfg.menu_entry.conf_entry.num = [1 1];
matlabbatch{4}.menu_cfg.menu_entry.conf_entry.check = [];
matlabbatch{4}.menu_cfg.menu_entry.conf_entry.help = {};
matlabbatch{4}.menu_cfg.menu_entry.conf_entry.def = @(val)spm_get_defaults('stats.results.thresh',val{:});
matlabbatch{5}.menu_cfg.menu_entry.conf_entry.type = 'cfg_entry';
matlabbatch{5}.menu_cfg.menu_entry.conf_entry.name = 'Extent';
matlabbatch{5}.menu_cfg.menu_entry.conf_entry.tag = 'extent';
matlabbatch{5}.menu_cfg.menu_entry.conf_entry.strtype = 'w';
matlabbatch{5}.menu_cfg.menu_entry.conf_entry.extras = [];
matlabbatch{5}.menu_cfg.menu_entry.conf_entry.num = [1 1];
matlabbatch{5}.menu_cfg.menu_entry.conf_entry.check = [];
matlabbatch{5}.menu_cfg.menu_entry.conf_entry.help = {};
matlabbatch{5}.menu_cfg.menu_entry.conf_entry.def = @(val)spm_get_defaults('stats.results.extent',val{:});
matlabbatch{6}.menu_cfg.menu_entry.conf_entry.type = 'cfg_entry';
matlabbatch{6}.menu_cfg.menu_entry.conf_entry.name = 'Contrast(s) for Masking';
matlabbatch{6}.menu_cfg.menu_entry.conf_entry.tag = 'contrasts';
matlabbatch{6}.menu_cfg.menu_entry.conf_entry.strtype = 'n';
matlabbatch{6}.menu_cfg.menu_entry.conf_entry.extras = [];
matlabbatch{6}.menu_cfg.menu_entry.conf_entry.num = [1 Inf];
matlabbatch{6}.menu_cfg.menu_entry.conf_entry.check = @(job)spm_run_regions('check','contrasts',job);
matlabbatch{6}.menu_cfg.menu_entry.conf_entry.help = {'Index of contrast(s) for masking - leave empty for no masking.'};
matlabbatch{6}.menu_cfg.menu_entry.conf_entry.def = [];
matlabbatch{7}.menu_cfg.menu_entry.conf_entry.type = 'cfg_entry';
matlabbatch{7}.menu_cfg.menu_entry.conf_entry.name = 'Mask threshold';
matlabbatch{7}.menu_cfg.menu_entry.conf_entry.tag = 'thresh';
matlabbatch{7}.menu_cfg.menu_entry.conf_entry.strtype = 'r';
matlabbatch{7}.menu_cfg.menu_entry.conf_entry.extras = [];
matlabbatch{7}.menu_cfg.menu_entry.conf_entry.num = [1 1];
matlabbatch{7}.menu_cfg.menu_entry.conf_entry.check = [];
matlabbatch{7}.menu_cfg.menu_entry.conf_entry.help = {};
matlabbatch{7}.menu_cfg.menu_entry.conf_entry.def = @(val)spm_get_defaults('stats.results.maskthresh',val{:});
matlabbatch{8}.menu_cfg.menu_entry.conf_menu.type = 'cfg_menu';
matlabbatch{8}.menu_cfg.menu_entry.conf_menu.name = 'Nature of mask';
matlabbatch{8}.menu_cfg.menu_entry.conf_menu.tag = 'mtype';
matlabbatch{8}.menu_cfg.menu_entry.conf_menu.labels = {
                                                       'Inclusive'
                                                       'Exclusive'
                                                       }';
matlabbatch{8}.menu_cfg.menu_entry.conf_menu.values = {
                                                       0
                                                       1
                                                       }';
matlabbatch{8}.menu_cfg.menu_entry.conf_menu.check = [];
matlabbatch{8}.menu_cfg.menu_entry.conf_menu.help = {};
matlabbatch{8}.menu_cfg.menu_entry.conf_menu.def = [];
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.type = 'cfg_branch';
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.name = 'Mask definition';
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.tag = 'mask';
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.val{1}(1) = cfg_dep;
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.val{1}(1).tname = 'Val Item';
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.val{1}(1).tgt_spec = {};
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.val{1}(1).sname = 'Entry: Contrast(s) for Masking (cfg_entry)';
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.val{1}(1).src_exbranch = substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.val{1}(1).src_output = substruct('()',{1});
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.val{2}(1) = cfg_dep;
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.val{2}(1).tname = 'Val Item';
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.val{2}(1).tgt_spec = {};
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.val{2}(1).sname = 'Entry: Mask threshold (cfg_entry)';
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.val{2}(1).src_exbranch = substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.val{2}(1).src_output = substruct('()',{1});
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.val{3}(1) = cfg_dep;
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.val{3}(1).tname = 'Val Item';
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.val{3}(1).tgt_spec = {};
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.val{3}(1).sname = 'Menu: Nature of mask (cfg_menu)';
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.val{3}(1).src_exbranch = substruct('.','val', '{}',{8}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.val{3}(1).src_output = substruct('()',{1});
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.check = [];
matlabbatch{9}.menu_cfg.menu_struct.conf_branch.help = {};
matlabbatch{10}.menu_cfg.menu_struct.conf_repeat.type = 'cfg_repeat';
matlabbatch{10}.menu_cfg.menu_struct.conf_repeat.name = 'Masking';
matlabbatch{10}.menu_cfg.menu_struct.conf_repeat.tag = 'masking';
matlabbatch{10}.menu_cfg.menu_struct.conf_repeat.values{1}(1) = cfg_dep;
matlabbatch{10}.menu_cfg.menu_struct.conf_repeat.values{1}(1).tname = 'Values Item';
matlabbatch{10}.menu_cfg.menu_struct.conf_repeat.values{1}(1).tgt_spec = {};
matlabbatch{10}.menu_cfg.menu_struct.conf_repeat.values{1}(1).sname = 'Branch: Mask definition (cfg_branch)';
matlabbatch{10}.menu_cfg.menu_struct.conf_repeat.values{1}(1).src_exbranch = substruct('.','val', '{}',{9}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{10}.menu_cfg.menu_struct.conf_repeat.values{1}(1).src_output = substruct('()',{1});
matlabbatch{10}.menu_cfg.menu_struct.conf_repeat.num = [0 1];
matlabbatch{10}.menu_cfg.menu_struct.conf_repeat.forcestruct = false;
matlabbatch{10}.menu_cfg.menu_struct.conf_repeat.check = [];
matlabbatch{10}.menu_cfg.menu_struct.conf_repeat.help = {};
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.type = 'cfg_branch';
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.name = 'Contrast query';
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.tag = 'conspec';
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{1}(1) = cfg_dep;
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{1}(1).tname = 'Val Item';
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{1}(1).tgt_spec = {};
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{1}(1).sname = 'Entry: Contrast (cfg_entry)';
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{1}(1).src_exbranch = substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{1}(1).src_output = substruct('()',{1});
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{2}(1) = cfg_dep;
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{2}(1).tname = 'Val Item';
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{2}(1).tgt_spec = {};
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{2}(1).sname = 'Menu: Threshold type (cfg_menu)';
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{2}(1).src_exbranch = substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{2}(1).src_output = substruct('()',{1});
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{3}(1) = cfg_dep;
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{3}(1).tname = 'Val Item';
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{3}(1).tgt_spec = {};
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{3}(1).sname = 'Entry: Threshold (cfg_entry)';
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{3}(1).src_exbranch = substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{3}(1).src_output = substruct('()',{1});
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{4}(1) = cfg_dep;
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{4}(1).tname = 'Val Item';
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{4}(1).tgt_spec = {};
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{4}(1).sname = 'Entry: Extent (cfg_entry)';
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{4}(1).src_exbranch = substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{4}(1).src_output = substruct('()',{1});
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{5}(1) = cfg_dep;
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{5}(1).tname = 'Val Item';
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{5}(1).tgt_spec = {};
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{5}(1).sname = 'Repeat: Masking (cfg_repeat)';
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{5}(1).src_exbranch = substruct('.','val', '{}',{10}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.val{5}(1).src_output = substruct('()',{1});
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.check = [];
matlabbatch{11}.menu_cfg.menu_struct.conf_branch.help = {};
matlabbatch{12}.menu_cfg.menu_entry.conf_const.type = 'cfg_const';
matlabbatch{12}.menu_cfg.menu_entry.conf_const.name = 'All inmask voxels';
matlabbatch{12}.menu_cfg.menu_entry.conf_const.tag = 'inmask';
matlabbatch{12}.menu_cfg.menu_entry.conf_const.val = {true};
matlabbatch{12}.menu_cfg.menu_entry.conf_const.check = [];
matlabbatch{12}.menu_cfg.menu_entry.conf_const.help = {'Extract data from all inmask voxels that fall into the VOI.'};
matlabbatch{12}.menu_cfg.menu_entry.conf_const.def = [];
matlabbatch{13}.menu_cfg.menu_struct.conf_choice.type = 'cfg_choice';
matlabbatch{13}.menu_cfg.menu_struct.conf_choice.name = 'Data source&mask';
matlabbatch{13}.menu_cfg.menu_struct.conf_choice.tag = 'smask';
matlabbatch{13}.menu_cfg.menu_struct.conf_choice.values{1}(1) = cfg_dep;
matlabbatch{13}.menu_cfg.menu_struct.conf_choice.values{1}(1).tname = 'Values Item';
matlabbatch{13}.menu_cfg.menu_struct.conf_choice.values{1}(1).tgt_spec = {};
matlabbatch{13}.menu_cfg.menu_struct.conf_choice.values{1}(1).sname = 'Branch: Contrast query (cfg_branch)';
matlabbatch{13}.menu_cfg.menu_struct.conf_choice.values{1}(1).src_exbranch = substruct('.','val', '{}',{11}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{13}.menu_cfg.menu_struct.conf_choice.values{1}(1).src_output = substruct('()',{1});
matlabbatch{13}.menu_cfg.menu_struct.conf_choice.values{2}(1) = cfg_dep;
matlabbatch{13}.menu_cfg.menu_struct.conf_choice.values{2}(1).tname = 'Values Item';
matlabbatch{13}.menu_cfg.menu_struct.conf_choice.values{2}(1).tgt_spec = {};
matlabbatch{13}.menu_cfg.menu_struct.conf_choice.values{2}(1).sname = 'Const: All inmask voxels (cfg_const)';
matlabbatch{13}.menu_cfg.menu_struct.conf_choice.values{2}(1).src_exbranch = substruct('.','val', '{}',{12}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{13}.menu_cfg.menu_struct.conf_choice.values{2}(1).src_output = substruct('()',{1});
matlabbatch{13}.menu_cfg.menu_struct.conf_choice.check = [];
matlabbatch{13}.menu_cfg.menu_struct.conf_choice.help = {'Data can be extracted from voxels surviving a certain analysis threshold (as in the SPM GUI) or from all inmask voxels.'};
matlabbatch{14}.menu_cfg.menu_struct.conf_branch.type = 'cfg_branch';
matlabbatch{14}.menu_cfg.menu_struct.conf_branch.name = 'Source SPM';
matlabbatch{14}.menu_cfg.menu_struct.conf_branch.tag = 'srcspm';
matlabbatch{14}.menu_cfg.menu_struct.conf_branch.val{1}(1) = cfg_dep;
matlabbatch{14}.menu_cfg.menu_struct.conf_branch.val{1}(1).tname = 'Val Item';
matlabbatch{14}.menu_cfg.menu_struct.conf_branch.val{1}(1).tgt_spec = {};
matlabbatch{14}.menu_cfg.menu_struct.conf_branch.val{1}(1).sname = 'Files: Select SPM.mat (cfg_files)';
matlabbatch{14}.menu_cfg.menu_struct.conf_branch.val{1}(1).src_exbranch = substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{14}.menu_cfg.menu_struct.conf_branch.val{1}(1).src_output = substruct('()',{1});
matlabbatch{14}.menu_cfg.menu_struct.conf_branch.val{2}(1) = cfg_dep;
matlabbatch{14}.menu_cfg.menu_struct.conf_branch.val{2}(1).tname = 'Val Item';
matlabbatch{14}.menu_cfg.menu_struct.conf_branch.val{2}(1).tgt_spec = {};
matlabbatch{14}.menu_cfg.menu_struct.conf_branch.val{2}(1).sname = 'Choice: Data source&mask (cfg_choice)';
matlabbatch{14}.menu_cfg.menu_struct.conf_branch.val{2}(1).src_exbranch = substruct('.','val', '{}',{13}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{14}.menu_cfg.menu_struct.conf_branch.val{2}(1).src_output = substruct('()',{1});
matlabbatch{14}.menu_cfg.menu_struct.conf_branch.check = @(job)spm_run_regions('check','srcspm',job);
matlabbatch{14}.menu_cfg.menu_struct.conf_branch.help = {};
matlabbatch{15}.menu_cfg.menu_entry.conf_entry.type = 'cfg_entry';
matlabbatch{15}.menu_cfg.menu_entry.conf_entry.name = 'centre of VOI {mm}';
matlabbatch{15}.menu_cfg.menu_entry.conf_entry.tag = 'xyz';
matlabbatch{15}.menu_cfg.menu_entry.conf_entry.strtype = 'r';
matlabbatch{15}.menu_cfg.menu_entry.conf_entry.extras = [];
matlabbatch{15}.menu_cfg.menu_entry.conf_entry.num = [3 1];
matlabbatch{15}.menu_cfg.menu_entry.conf_entry.check = [];
matlabbatch{15}.menu_cfg.menu_entry.conf_entry.help = {'Enter the coordinates of the centre of the VOI to be extracted.'};
matlabbatch{15}.menu_cfg.menu_entry.conf_entry.def = [];
matlabbatch{16}.menu_cfg.menu_entry.conf_entry.type = 'cfg_entry';
matlabbatch{16}.menu_cfg.menu_entry.conf_entry.name = 'Name of VOI';
matlabbatch{16}.menu_cfg.menu_entry.conf_entry.tag = 'name';
matlabbatch{16}.menu_cfg.menu_entry.conf_entry.strtype = 's';
matlabbatch{16}.menu_cfg.menu_entry.conf_entry.extras = [];
matlabbatch{16}.menu_cfg.menu_entry.conf_entry.num = [1 Inf];
matlabbatch{16}.menu_cfg.menu_entry.conf_entry.check = [];
matlabbatch{16}.menu_cfg.menu_entry.conf_entry.help = {'A label for this VOI.'};
matlabbatch{16}.menu_cfg.menu_entry.conf_entry.def = [];
matlabbatch{17}.menu_cfg.menu_entry.conf_entry.type = 'cfg_entry';
matlabbatch{17}.menu_cfg.menu_entry.conf_entry.name = 'Contrast# used to adjust data';
matlabbatch{17}.menu_cfg.menu_entry.conf_entry.tag = 'Ic';
matlabbatch{17}.menu_cfg.menu_entry.conf_entry.strtype = 'w';
matlabbatch{17}.menu_cfg.menu_entry.conf_entry.extras = [];
matlabbatch{17}.menu_cfg.menu_entry.conf_entry.num = [1 1];
matlabbatch{17}.menu_cfg.menu_entry.conf_entry.check = [];
matlabbatch{17}.menu_cfg.menu_entry.conf_entry.help = {
                                                       'The data can be adjusted w.r.t. a (pre-defined) F contrast to remove signal that is modelled by the reduced design of this contrast.'
                                                       'Enter zero (0) for no adjustment or the index number of the desired F contrast.'
                                                       }';
matlabbatch{17}.menu_cfg.menu_entry.conf_entry.def = [];
matlabbatch{18}.menu_cfg.menu_entry.conf_entry.type = 'cfg_entry';
matlabbatch{18}.menu_cfg.menu_entry.conf_entry.name = 'Session index';
matlabbatch{18}.menu_cfg.menu_entry.conf_entry.tag = 'Sess';
matlabbatch{18}.menu_cfg.menu_entry.conf_entry.strtype = 'n';
matlabbatch{18}.menu_cfg.menu_entry.conf_entry.extras = [];
matlabbatch{18}.menu_cfg.menu_entry.conf_entry.num = [1 1];
matlabbatch{18}.menu_cfg.menu_entry.conf_entry.check = [];
matlabbatch{18}.menu_cfg.menu_entry.conf_entry.help = {'Enter the Session# for which to extract data.'};
matlabbatch{18}.menu_cfg.menu_entry.conf_entry.def = [];
matlabbatch{19}.menu_cfg.menu_entry.conf_entry.type = 'cfg_entry';
matlabbatch{19}.menu_cfg.menu_entry.conf_entry.name = 'Sphere: VOI radius {mm}';
matlabbatch{19}.menu_cfg.menu_entry.conf_entry.tag = 'sphere';
matlabbatch{19}.menu_cfg.menu_entry.conf_entry.strtype = 'r';
matlabbatch{19}.menu_cfg.menu_entry.conf_entry.extras = [];
matlabbatch{19}.menu_cfg.menu_entry.conf_entry.num = [1 1];
matlabbatch{19}.menu_cfg.menu_entry.conf_entry.check = [];
matlabbatch{19}.menu_cfg.menu_entry.conf_entry.help = {'Enter the radius of the sphere in mm units.'};
matlabbatch{19}.menu_cfg.menu_entry.conf_entry.def = [];
matlabbatch{20}.menu_cfg.menu_entry.conf_entry.type = 'cfg_entry';
matlabbatch{20}.menu_cfg.menu_entry.conf_entry.name = 'Box: VOI dimensions [x y z] {mm}';
matlabbatch{20}.menu_cfg.menu_entry.conf_entry.tag = 'box';
matlabbatch{20}.menu_cfg.menu_entry.conf_entry.strtype = 'r';
matlabbatch{20}.menu_cfg.menu_entry.conf_entry.extras = [];
matlabbatch{20}.menu_cfg.menu_entry.conf_entry.num = [3 1];
matlabbatch{20}.menu_cfg.menu_entry.conf_entry.check = [];
matlabbatch{20}.menu_cfg.menu_entry.conf_entry.help = {''};
matlabbatch{20}.menu_cfg.menu_entry.conf_entry.def = [];
matlabbatch{21}.menu_cfg.menu_entry.conf_files.type = 'cfg_files';
matlabbatch{21}.menu_cfg.menu_entry.conf_files.name = 'Mask: VOI image';
matlabbatch{21}.menu_cfg.menu_entry.conf_files.tag = 'mask';
matlabbatch{21}.menu_cfg.menu_entry.conf_files.filter = 'image';
matlabbatch{21}.menu_cfg.menu_entry.conf_files.ufilter = '.*';
matlabbatch{21}.menu_cfg.menu_entry.conf_files.dir = '';
matlabbatch{21}.menu_cfg.menu_entry.conf_files.num = [1 1];
matlabbatch{21}.menu_cfg.menu_entry.conf_files.check = [];
matlabbatch{21}.menu_cfg.menu_entry.conf_files.help = {};
matlabbatch{21}.menu_cfg.menu_entry.conf_files.def = [];
matlabbatch{22}.menu_cfg.menu_entry.conf_const.type = 'cfg_const';
matlabbatch{22}.menu_cfg.menu_entry.conf_const.name = 'Cluster: VOI in current cluster';
matlabbatch{22}.menu_cfg.menu_entry.conf_const.tag = 'cluster';
matlabbatch{22}.menu_cfg.menu_entry.conf_const.val = {true};
matlabbatch{22}.menu_cfg.menu_entry.conf_const.check = [];
matlabbatch{22}.menu_cfg.menu_entry.conf_const.help = {'The VOI will include all voxels in the cluster at the VOI centre as defined by the current results query.'};
matlabbatch{22}.menu_cfg.menu_entry.conf_const.def = [];
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.type = 'cfg_choice';
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.name = 'VOI type';
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.tag = 'voi';
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{1}(1) = cfg_dep;
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{1}(1).tname = 'Values Item';
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{1}(1).tgt_spec = {};
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{1}(1).sname = 'Entry: Sphere: VOI radius {mm} (cfg_entry)';
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{1}(1).src_exbranch = substruct('.','val', '{}',{19}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{1}(1).src_output = substruct('()',{1});
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{2}(1) = cfg_dep;
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{2}(1).tname = 'Values Item';
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{2}(1).tgt_spec = {};
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{2}(1).sname = 'Entry: Box: VOI dimensions [x y z] {mm} (cfg_entry)';
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{2}(1).src_exbranch = substruct('.','val', '{}',{20}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{2}(1).src_output = substruct('()',{1});
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{3}(1) = cfg_dep;
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{3}(1).tname = 'Values Item';
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{3}(1).tgt_spec = {};
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{3}(1).sname = 'Files: Mask: VOI image (cfg_files)';
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{3}(1).src_exbranch = substruct('.','val', '{}',{21}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{3}(1).src_output = substruct('()',{1});
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{4}(1) = cfg_dep;
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{4}(1).tname = 'Values Item';
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{4}(1).tgt_spec = {};
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{4}(1).sname = 'Const: Cluster: VOI in current cluster (cfg_const)';
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{4}(1).src_exbranch = substruct('.','val', '{}',{22}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.values{4}(1).src_output = substruct('()',{1});
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.check = [];
matlabbatch{23}.menu_cfg.menu_struct.conf_choice.help = {'Data will be extracted from all voxels that are in the defined VOI and also belong to the supra-threshold or inmask voxels of the choosen SPM result.'};
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.type = 'cfg_branch';
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.name = 'VOI specification';
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.tag = 'xY';
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{1}(1) = cfg_dep;
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{1}(1).tname = 'Val Item';
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{1}(1).tgt_spec = {};
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{1}(1).sname = 'Entry: centre of VOI {mm} (cfg_entry)';
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{1}(1).src_exbranch = substruct('.','val', '{}',{15}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{1}(1).src_output = substruct('()',{1});
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{2}(1) = cfg_dep;
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{2}(1).tname = 'Val Item';
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{2}(1).tgt_spec = {};
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{2}(1).sname = 'Entry: Name of VOI (cfg_entry)';
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{2}(1).src_exbranch = substruct('.','val', '{}',{16}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{2}(1).src_output = substruct('()',{1});
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{3}(1) = cfg_dep;
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{3}(1).tname = 'Val Item';
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{3}(1).tgt_spec = {};
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{3}(1).sname = 'Entry: Contrast# used to adjust data (cfg_entry)';
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{3}(1).src_exbranch = substruct('.','val', '{}',{17}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{3}(1).src_output = substruct('()',{1});
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{4}(1) = cfg_dep;
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{4}(1).tname = 'Val Item';
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{4}(1).tgt_spec = {};
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{4}(1).sname = 'Entry: Session index (cfg_entry)';
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{4}(1).src_exbranch = substruct('.','val', '{}',{18}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{4}(1).src_output = substruct('()',{1});
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{5}(1) = cfg_dep;
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{5}(1).tname = 'Val Item';
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{5}(1).tgt_spec = {};
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{5}(1).sname = 'Choice: VOI type (cfg_choice)';
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{5}(1).src_exbranch = substruct('.','val', '{}',{23}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.val{5}(1).src_output = substruct('()',{1});
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.check = [];
matlabbatch{24}.menu_cfg.menu_struct.conf_branch.help = {};
matlabbatch{25}.menu_cfg.menu_struct.conf_repeat.type = 'cfg_repeat';
matlabbatch{25}.menu_cfg.menu_struct.conf_repeat.name = 'VOI specifications';
matlabbatch{25}.menu_cfg.menu_struct.conf_repeat.tag = 'xYs';
matlabbatch{25}.menu_cfg.menu_struct.conf_repeat.values{1}(1) = cfg_dep;
matlabbatch{25}.menu_cfg.menu_struct.conf_repeat.values{1}(1).tname = 'Values Item';
matlabbatch{25}.menu_cfg.menu_struct.conf_repeat.values{1}(1).tgt_spec = {};
matlabbatch{25}.menu_cfg.menu_struct.conf_repeat.values{1}(1).sname = 'Branch: VOI specification (cfg_branch)';
matlabbatch{25}.menu_cfg.menu_struct.conf_repeat.values{1}(1).src_exbranch = substruct('.','val', '{}',{24}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{25}.menu_cfg.menu_struct.conf_repeat.values{1}(1).src_output = substruct('()',{1});
matlabbatch{25}.menu_cfg.menu_struct.conf_repeat.num = [1 Inf];
matlabbatch{25}.menu_cfg.menu_struct.conf_repeat.forcestruct = false;
matlabbatch{25}.menu_cfg.menu_struct.conf_repeat.check = [];
matlabbatch{25}.menu_cfg.menu_struct.conf_repeat.help = {};
matlabbatch{26}.menu_cfg.menu_struct.conf_exbranch.type = 'cfg_exbranch';
matlabbatch{26}.menu_cfg.menu_struct.conf_exbranch.name = 'VOI extraction (eigenvariate)';
matlabbatch{26}.menu_cfg.menu_struct.conf_exbranch.tag = 'regions';
matlabbatch{26}.menu_cfg.menu_struct.conf_exbranch.val{1}(1) = cfg_dep;
matlabbatch{26}.menu_cfg.menu_struct.conf_exbranch.val{1}(1).tname = 'Val Item';
matlabbatch{26}.menu_cfg.menu_struct.conf_exbranch.val{1}(1).tgt_spec = {};
matlabbatch{26}.menu_cfg.menu_struct.conf_exbranch.val{1}(1).sname = 'Branch: Source SPM (cfg_branch)';
matlabbatch{26}.menu_cfg.menu_struct.conf_exbranch.val{1}(1).src_exbranch = substruct('.','val', '{}',{14}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{26}.menu_cfg.menu_struct.conf_exbranch.val{1}(1).src_output = substruct('()',{1});
matlabbatch{26}.menu_cfg.menu_struct.conf_exbranch.val{2}(1) = cfg_dep;
matlabbatch{26}.menu_cfg.menu_struct.conf_exbranch.val{2}(1).tname = 'Val Item';
matlabbatch{26}.menu_cfg.menu_struct.conf_exbranch.val{2}(1).tgt_spec = {};
matlabbatch{26}.menu_cfg.menu_struct.conf_exbranch.val{2}(1).sname = 'Repeat: VOI specifications (cfg_repeat)';
matlabbatch{26}.menu_cfg.menu_struct.conf_exbranch.val{2}(1).src_exbranch = substruct('.','val', '{}',{25}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{26}.menu_cfg.menu_struct.conf_exbranch.val{2}(1).src_output = substruct('()',{1});
matlabbatch{26}.menu_cfg.menu_struct.conf_exbranch.prog = @(job)spm_run_regions('run',job);
matlabbatch{26}.menu_cfg.menu_struct.conf_exbranch.vout = @(job)spm_run_regions('vout',job);
matlabbatch{26}.menu_cfg.menu_struct.conf_exbranch.check = [];
matlabbatch{26}.menu_cfg.menu_struct.conf_exbranch.help = {'Extract filtered&adjusted eigenvariate data (as returned by spm_regions) from one or more ROIs in a SPM analysis.'};
matlabbatch{27}.menu_cfg.gencode_gen.gencode_fname = 'spm_cfg_regions.m';
matlabbatch{27}.menu_cfg.gencode_gen.gencode_dir = {'/export/spm-devel/spm/trunk/config/'};
matlabbatch{27}.menu_cfg.gencode_gen.gencode_var(1) = cfg_dep;
matlabbatch{27}.menu_cfg.gencode_gen.gencode_var(1).tname = 'Root node of config';
matlabbatch{27}.menu_cfg.gencode_gen.gencode_var(1).tgt_spec = {};
matlabbatch{27}.menu_cfg.gencode_gen.gencode_var(1).sname = 'Exbranch: VOI extraction (eigenvariate) (cfg_exbranch)';
matlabbatch{27}.menu_cfg.gencode_gen.gencode_var(1).src_exbranch = substruct('.','val', '{}',{26}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{27}.menu_cfg.gencode_gen.gencode_var(1).src_output = substruct('()',{1});
matlabbatch{27}.menu_cfg.gencode_gen.gencode_opts.gencode_o_def = false;
matlabbatch{27}.menu_cfg.gencode_gen.gencode_opts.gencode_o_mlb = false;
matlabbatch{27}.menu_cfg.gencode_gen.gencode_opts.gencode_o_path = false;
