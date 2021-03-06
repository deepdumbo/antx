
%% #b export files from ANT structure
% _______________________________________________________________________________________________
%  - export with/without preserving hierarchy
%  - options: renaming/prefix/add mouse-folder name
%  - "bat"-file is created and copied to the export-folder. RAtionale: If exported nifti-files
%     (contained in a single folder) are copied to another computer which has no matlab installed,
%     but has a folder that contains mouse-subfolders with the same mouse-name-suffix ,
%     Than: this "bat"-file will distribute the moved files to this mouse-specific subfolders
% _______________________________________________________________________________________________
%% #by FUNCTION
% xexport(showgui,x )
%% #by INPUT
%    showgui               (optional) 0/1 : silent mode or GUI    ...default: GUI
%    x                     (optional) parameters OF THIS ROUTINE
% _______________________
% x.destinationPath        destination path to export files , cellarray,
%                          default: {''}
%                          -path is created if it does not exist
% x.keepSubdirStructure    [0] flattened hierarchy (no subdirs),
%                          [1] the destination path contains a subfolder for each mouse
%                          default: 1
% x.prefixDirName=         adds mouse Dir/folder name as prefix to the new filename,
%                          default: ''
% x.renameString=          new file name (without extention), this works if only one file is
%                          copied per directory
%                          default: ''
% x.addString=             adds a string as suffix to the new file name
%                          default: ''
% x.reorient=              reorient volume , a 9-lement-vector
%                          use [0 0 0 0 0 0 1 -1 1] if data came from DSIstudio)
%                          default: []  ... do nothing;
%% #by EXAMPLE
% EXPORT THE FOLLOWING FILES
% x.files=               { 'O:\data\dtiSusanne\analysis\dat\20160623HP_M36\c1c2mask.nii'  % files to export
%     'O:\data\dtiSusanne\analysis\dat\20160623HP_M37\c1c2mask.nii'                       %
%     'O:\data\dtiSusanne\analysis\dat\20160623HP_M41echt\c1c2mask.nii'                   %
%     'O:\data\dtiSusanne\analysis\dat\20160623HP_M42echt\c1c2mask.nii' };                %
% x.destinationPath=     'C:\Users\skoch\Desktop\batchout'  ; % destination path to export files
% x.keepSubdirStructure= [0];    %  0 flattened hierarchy, all data stored in the same folder
% x.prefixDirName=       [1];    % adds mouse direcotry name as prefix to the new filename
% x.renameString=        '';     % no new file name
% x.addString=           '';     % no suffix added
% x.reorient=            '';	 % NO-REORIENTATION
% xexport(1,x);         % RUN THIS FUNCTION with open GUI

% _______________________________________________________________________________________
%
%% #by RUN-def:
% xexport(1) or  xexport    ... open PARAMETER_GUI
% xexport(0,z)             ...NO-GUI,  z is the predefined struct
% xexport(1,z)             ...WITH-GUI z is the predefined struct
%
%% #by RE-USE BATCH: see 'anth' [..anthistory] -variable in workspace


function xexport(showgui,x )





%����������������������������������������������������������������������������������������������������
%% test-data
%
% if 0
%   % *** RENAME FILES
% % ===================================
% x.files=               { 'O:\data\dtiSusanne\analysis\dat\20160623HP_M36\c1c2mask.nii' 	% files to export <required to fill>
%           'O:\data\dtiSusanne\analysis\dat\20160623HP_M37\c1c2mask.nii'
%           'O:\data\dtiSusanne\analysis\dat\20160623HP_M40\c1c2mask.nii'
%           'O:\data\dtiSusanne\analysis\dat\20160623HP_M41echt\c1c2mask.nii'
%           'O:\data\dtiSusanne\analysis\dat\20160623HP_M42echt\c1c2mask.nii' };
% x.destinationPath=     'C:\Users\skoch\Desktop\batchout';	% destination path to export files <required to fill>
% x.keepSubdirStructure= [0];	% [0,1], [0] flattened hierarchy (no subdirs), [1] the destination path contains the subfolders
% x.prefixDirName=       [1];	% adds mouse Dir/folder name as prefix to the new filename
% x.renameString=        '';	% new file name (without extention), this works if only one file is copied per dir
% x.addString=           '';	% add string as suffix to the new file name
% x.reorient=            '';	%  <9 lement vector> reorient volume, default: []: do nothing; (nb: use [0 0 0 0 0 0 1 -1 1] if data came from DSIstudio)
% xexport(0,'params',x)
%
% end

%�����������������������������������������������
%%   PARAMS
%�����������������������������������������������
if exist('showgui')==0 || isempty(showgui) ;    showgui=1                   ;end
if exist('x')==0                           ;    x=[]                        ;end
if exist('pa')==0      || isempty(pa)      ;    pa=antcb('getallsubjects')  ;end

if ischar(pa);                      pa=cellstr(pa);   end
if isempty(x) || ~isstruct(x)  ;  %if no params spezified open gui anyway
    showgui  =1   ;
    x=[]          ;
end




%����������������������������������������������������������������������������������������������������
%%  PARAMETER-gui
%����������������������������������������������������������������������������������������������������
if exist('x')~=1;        x=[]; end

%% import 4ddata
p={...
    'inf98'      '*** RENAME FILES                 '                         '' ''   %    'inf1'      '% PARAMETER         '                                    ''  ''
    'inf100'     '==================================='                          '' ''
    'files'                ''           'files to export <required to fill>'  'mf'
    'destinationPath'      ''           'destination path to export files <required to fill>'  'd'
    'keepSubdirStructure'   0            '[0,1], [0] flattened hierarchy (no subdirs), [1] the destination path contains the subfolders  '    'b'
    'prefixDirName'         1            'adds mouse Dir/folder name as prefix to the new filename'      'b'
    'renameString'         ''           'new file name (without extention), this works if only one file is copied per dir'  {'mask' 'raw' 'test'}
    'addString'            ''           'add string as suffix to the new file name'                                                            ''
    'reorient'             ''           ' <9 lement vector> reorient volume, default: []: do nothing; (nb: use [0 0 0 0 0 0 1 -1 1] if data came from DSIstudio)'  {'0 0 0 0 0 0 -1 1 1';'0 0 0 0 0 0 1 -1 1'; '0 0 0 0 0 0 -1 -1 1'}
    };
%show parameter
% if nargin==0;
%     pinfo={};
%     for i=1:size(p,1)
%         var=p{i,1}; if regexpi(var,'^inf\d'); var=''; else;  var=sprintf('%s\t\t\t' ,[var ': ' ]  ) ;end
%         if isempty(var);des=p{i,2};defaults='@@' ; else  ; des=p{i,3};defaults=  p{i,2}    ;end
%         if isnumeric(defaults); defaults=num2str(defaults);end
%         if isempty('defaults'); defaults='''';end
%          if strcmp(defaults,'@@'); defaults='';
%              defaults='';
%          else
%              defaults=['(default: ' defaults ')'];
% %         if ~strcmp(defaults,'_'); default=['(default: ' defaults ')'];else;default='';end
%          end
%
%        pinfo{i,1}=[var des  defaults] ;
%     end
%
%     eval(['help ' mfilename]);
%     disp('__________________________________________________________________________________________');
%     disp([' INPUT PARAMETERS of ' mfilename ' (must be arranged as struct) ***' ]);
%    disp(char( pinfo(2:end)));
%    return;
% end

p=paramadd(p,x);%add/replace parameter
%     [m z]=paramgui(p,'uiwait',0,'close',0,'editorpos',[.03 0 1 1],'figpos',[.2 .3 .7 .5 ],'title','PARAMETERS: LABELING');

% %% show GUI
if showgui==1
    hlp=help(mfilename); hlp=strsplit2(hlp,char(10))';
    [m z a params]=paramgui(p,'uiwait',1,'close',1,'editorpos',[.03 0 1 1],'figpos',[.2 .3 .8 .6 ],...
        'title','SETTINGS','pb1string','OK','info',hlp);
    fn=fieldnames(z);
    z=rmfield(z,fn(regexpi2(fn,'^inf\d')));
else
    z=param2struct(p);
end




% if  exist('showgui')~=1 ; showgui=1; end
% %% additional parameters
% para=struct();
% if ~isempty(varargin)
%     para=cell2struct(varargin(2:2:end),varargin(1:2:end),2);
% end





% if isfield(para,'params') %%&& strcmp(getfield(para,'parameter'),'default') ==1
%     p0=para.params;
%     fn=fieldnames(p0);
%     for i=1:length(fn)
%         is=regexpi2(p(:,1),['^' fn{i} '$' ]);
%         if ~isempty(is)
%             p{is,2}=getfield(p0,fn{i});
%         end
%     end
% end


% %% show gui
% if showgui==1
%     hlp=help(mfilename); hlp=strsplit2(hlp,char(10))';
%     [m z a params]=paramgui(p,'uiwait',1,'close',1,'editorpos',[.03 0 1 1],'figpos',[.2 .3 .8 .6 ],...
%         'title','SETTINGS','pb1string','OK','info',hlp);
% else
%     z=[];
%     for i=1:size(p,1)
%         eval(['z.' p{i,1} '=' 'p{' num2str(i) ',2};']);
%     end
%     
% end

 
%����������������������������������������������������������������������������������������������������
if ischar(z.files); z.files=cellstr(z.files); end
if isempty(z.files); return; end
if exist(z.destinationPath)~=7;  
    try
        mkdir(z.destinationPath)
    catch
    return;
    end
end

for i=1:length(z.files)
    f1=z.files{i};
    [pa fi ext]=fileparts(f1);
    pa2=pa;
    padest=z.destinationPath;
    filename=[fi ext];
    [~, subdir]=fileparts(pa);
    
    %% fileNamestring
    if ~isempty(z.renameString)
        filename=[z.renameString ext];
    end
    
    %% add addString as suffix to filename
    if ~isempty(z.addString)
        [~, fip ext ]=fileparts(filename);
        filename=[fip z.addString ext];
    end
    
    %% add subdir as prefix to filename
    if z.prefixDirName==1
        filename=[ subdir '_' filename];
    end
    
    
    
    
    %% keepSubdirStructure
    if z.keepSubdirStructure==1
        padest=fullfile(padest, subdir);
        mkdir(padest);
    end
    
    %% concat new filename
    f2=fullfile(padest,filename);
    
    
    %% copyfile
    copyfile(f1, f2);
    
    
    %% reorient image
    if strcmp(ext,'.nii')
        if ~isempty(z.reorient) && length(z.reorient)==9
            predef=[ z.reorient 0 0 0]; % [[0 0 0   0 0 0 ]]  1 -1 1  ->used fpr DTIstudio
            fsetorigin(f2, predef);  %ANA
        end
    end
    
    
    
    %% MSG
    [pa3 fi3 ext3]=fileparts(f2);
    try
        disp(['create file ' ['[' fullfile( pa3,[ fi3 ext3]) '] in']  ' <a href="matlab: explorer('' ' padest '  '')">' pa '</a>' '; sourceVol: ' ['[' fullfile(pa,[fi, ext]) ']' ]  ]);% show h<perlink
    catch
        disp(['create file : '  ['[' fullfile( pa3,[ fi3 ext3]) ']' ] ' from:  '  ['[' fullfile(pa,[fi, ext])  ']']  '' ]);
    end
    
end

%% copy BATCH
xbat=which('xfiles2subfolders.bat');
copyfile( xbat,replacefilepath( xbat, z.destinationPath) );

makebatch(z);


%����������������������������������������������������������������������������������������������������
% %% coder
% % disp('        ');
% hh={};
% hh{end+1,1}=('% ������������������������������������������������������');
% hh{end+1,1}=[ '% BATCH:        [' [mfilename '.m' ] ']' ];
% hh{end+1,1}=('%    ..copy/evaluate the this section');
% hh{end+1,1}=('% ������������������������������������������������������');
% hh=[hh; struct2list(z)];
% hh(end+1,1)={[mfilename '(' '1', ',''params''' ,',z' ')' ]};
% % disp(char(hh));
% uhelp(hh,1);

%����������������������������������������������������������������������������������������������������
%��������������������  SUBS ��������������������������������������������������������������������������
%����������������������������������������������������������������������������������������������������

function makebatch(z)
try
    hlp=help(mfilename);
    hlp=hlp(1:min(strfind(hlp,char(10)))-1);
catch
    hlp='';
end

hh={};
hh{end+1,1}=('% ������������������������������������������������������');
hh{end+1,1}=[ '% BATCH:        [' [mfilename '.m' ] ']' ];
hh{end+1,1}=[ '% #b descr:' hlp];
hh{end+1,1}=('% ������������������������������������������������������');
hh=[hh; 'z=[];' ];
hh=[hh; struct2list(z)];
hh(end+1,1)={[mfilename '(' '1',  ',z' ');' ]};
% uhelp(hh,1);
try
    v = evalin('base', 'anth');
catch
    v={};
    assignin('base','anth',v);
    v = evalin('base', 'anth');
end
v=[v; hh; {'                '};{'                '}];
assignin('base','anth',v);
disp(['BATCH: <a href="matlab: uhelp(anth,1,''cursor'',''end'')">' 'show history' '</a>'  ]);

%����������������������������������������������������������������������������������������������������



























