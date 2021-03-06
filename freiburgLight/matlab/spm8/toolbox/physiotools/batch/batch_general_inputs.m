%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 1 $)
%-----------------------------------------------------------------------
matlabbatch{1}.menu_cfg.menu_entry.conf_files.type = 'cfg_files';
matlabbatch{1}.menu_cfg.menu_entry.conf_files.name = 'Image Time Series';
matlabbatch{1}.menu_cfg.menu_entry.conf_files.tag = 'images';
matlabbatch{1}.menu_cfg.menu_entry.conf_files.filter = 'image';
matlabbatch{1}.menu_cfg.menu_entry.conf_files.ufilter = '.*';
matlabbatch{1}.menu_cfg.menu_entry.conf_files.dir = [];
matlabbatch{1}.menu_cfg.menu_entry.conf_files.num = [1 Inf];
matlabbatch{1}.menu_cfg.menu_entry.conf_files.check = [];
matlabbatch{1}.menu_cfg.menu_entry.conf_files.help = {'Enter the image time series.'};
matlabbatch{1}.menu_cfg.menu_entry.conf_files.def = [];
matlabbatch{2}.menu_cfg.menu_entry.conf_entry.type = 'cfg_entry';
matlabbatch{2}.menu_cfg.menu_entry.conf_entry.name = 'TR';
matlabbatch{2}.menu_cfg.menu_entry.conf_entry.tag = 'TR';
matlabbatch{2}.menu_cfg.menu_entry.conf_entry.strtype = 'r';
matlabbatch{2}.menu_cfg.menu_entry.conf_entry.extras = [];
matlabbatch{2}.menu_cfg.menu_entry.conf_entry.num = [1 1];
matlabbatch{2}.menu_cfg.menu_entry.conf_entry.check = [];
matlabbatch{2}.menu_cfg.menu_entry.conf_entry.help = {'The TR of your experiment. Note that this function assumes that the scans are acquired without any "silent" periods between scans.'};
matlabbatch{2}.menu_cfg.menu_entry.conf_entry.def = [];
matlabbatch{3}.menu_cfg.menu_entry.conf_entry.type = 'cfg_entry';
matlabbatch{3}.menu_cfg.menu_entry.conf_entry.name = '#Dummy scans';
matlabbatch{3}.menu_cfg.menu_entry.conf_entry.tag = 'ndummy';
matlabbatch{3}.menu_cfg.menu_entry.conf_entry.strtype = 'w';
matlabbatch{3}.menu_cfg.menu_entry.conf_entry.extras = [];
matlabbatch{3}.menu_cfg.menu_entry.conf_entry.num = [1 1];
matlabbatch{3}.menu_cfg.menu_entry.conf_entry.check = [];
matlabbatch{3}.menu_cfg.menu_entry.conf_entry.help = {'Enter the number of dummy scans that were acquired before the start of the image time series.'};
matlabbatch{3}.menu_cfg.menu_entry.conf_entry.def = [];
matlabbatch{4}.menu_cfg.menu_entry.conf_entry.type = 'cfg_entry';
matlabbatch{4}.menu_cfg.menu_entry.conf_entry.name = 'Slice order';
matlabbatch{4}.menu_cfg.menu_entry.conf_entry.tag = 'sorder';
matlabbatch{4}.menu_cfg.menu_entry.conf_entry.strtype = 'n';
matlabbatch{4}.menu_cfg.menu_entry.conf_entry.extras = [];
matlabbatch{4}.menu_cfg.menu_entry.conf_entry.num = [1 Inf];
matlabbatch{4}.menu_cfg.menu_entry.conf_entry.check = [];
matlabbatch{4}.menu_cfg.menu_entry.conf_entry.help = {'Enter the slice order of your acquisition.'};
matlabbatch{4}.menu_cfg.menu_entry.conf_entry.def = [];
